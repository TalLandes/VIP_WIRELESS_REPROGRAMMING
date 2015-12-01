/*----------------------------------------------------------------------------
 *  Demo Application for SimpliciTI
 *
 *  L. Friedman
 *  Texas Instruments, Inc.
 *---------------------------------------------------------------------------- */

/**********************************************************************************************
  Copyright 2007-2008 Texas Instruments Incorporated. All rights reserved.
  IMPORTANT: Your use of this Software is limited to those specific rights granted under
  the terms of a software license agreement between the user who downloaded the software,
  his/her employer (which must be your employer) and Texas Instruments Incorporated (the
  "License"). You may not use this Software unless you agree to abide by the terms of the
  License. The License limits your use, and you acknowledge, that the Software may not be
  modified, copied or distributed unless embedded on a Texas Instruments microcontroller
  or used solely and exclusively in conjunction with a Texas Instruments radio frequency
  transceiver, which is integrated into your product. Other than for the foregoing purpose,
  you may not use, reproduce, copy, prepare derivative works of, modify, distribute,
  perform, display or sell this Software and/or its documentation for any purpose.
  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE PROVIDED “AS IS”
  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY
  WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
  IN NO EVENT SHALL TEXAS INSTRUMENTS OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE
  THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT LIMITED TO ANY
  INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST
  DATA, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY
  THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
  Should you have any questions regarding your right to use this Software,
  contact Texas Instruments Incorporated at www.TI.com.
**************************************************************************************************/

/**********************************************************************************************
 * All modifications related to Synchronization using DMA timestamping, Buffer management, 
 * LPM, Sleep Cycle, Calender mode of RTC and flash memory modification has been implemented 
 * by DEEPA PHANISH.
 * Please contact deepa.phanish@gatech.edu for any clarification.
**************************************************************************************************/

#include <string.h>

#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "bsp_rtc.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"
#include "Accelo.h"

#include "app_remap_led.h"

static void linkTo(void);
void toggleLED(uint8_t);
void halBoardInit(void);
void LFXT_Start(unsigned int xtdrive);
void ED_Sleep(Sleep_time_t);
/* Callback handler */
static uint8_t sCB(linkID_t);
void Sleep_command(Sleep_time_t*,int);

static volatile uint8_t  sPeerFrameSem = 0;
static volatile uint8_t  BcastMsgSem = 0;
static  linkID_t sLinkID1 = 0;
static uint8_t IsSampling = 0;
static uint8_t linkcnt=0;

#define SPIN_ABOUT_A_SECOND   NWK_DELAY(1000)
#define SPIN_ABOUT_A_QUARTER_SECOND   NWK_DELAY(250)

/* How many times to try a Tx and miss an acknowledge before doing a scan */
#define MISSES_IN_A_ROW  2

#define FLASH_UNLOCK    FCTL3 = FWKEY; FCTL1 = FWKEY + WRT;
#define FLASH_LOCK      FCTL1 = FWKEY; FCTL3 = FWKEY +  LOCK;


//////////////////////////////////////////////////
////////////////////////  defintions and variables reataled to teh vibration app
//////////////////////////////////////////////////////

#define BytesPerPacket 64; // payload bytes per packet. 
#define AppHeaderBytes 9;
#define SamplesPerPkt 16;
#define BytesPerBuffer 32;
#define NumBuffers 32;
#define NumAxes 2;
#define NUM_VIB_PKTS 0x16000 //0x30  // This would be approximately 4hrs of data
#define SLEEP_HRS_AFTER_DATA 0x01 //24 or 0x18

uint16_t BufferX[512];
uint16_t BufferZ[512];
uint16_t BufferT[128];

uint8_t *msgX;
//uint8_t *msgY;
uint8_t *msgZ;
uint8_t *msgT;

volatile uint8_t DMAsegments = 0; 
uint8_t q=0;
int16_t qoffset=0,qToffset=0;

#define WIRELESS_REPROGRAM 1
#ifdef WIRELESS_REPROGRAM
#define SW_RESET()      PMMCTL0 = PMMPW + PMMSWPOR + (PMMCTL0 & 0x0003);
void reprogram();
typedef struct{
	uint16_t jump_to_app;
	uint16_t reprogram;
}rp_data_t;
#endif

//ON/OFF flag
volatile unsigned short AcceloON=0;

extern Sleep_time_t Sleep_time = {0x00,0x01};

#pragma DATA_SECTION(Sleep_time, ".rstdata"); 
#pragma DATA_ALIGN(Sleep_time, 1);

void main (void)
{
#ifdef SLEEP_CYCLE 
  Sleep_time_t sltLink = {0x01,0x00};

  FLASH_UNLOCK;
  if((Sleep_time.hrs == 0xff || Sleep_time.mins == 0xff) ||
  (Sleep_time.hrs == 0x00 && Sleep_time.mins == 0x00) ||
  (Sleep_time.hrs > 0x18 || Sleep_time.mins > 0x3C))
  {
    Sleep_time.hrs = 0x00; 
    while((FCTL3 & BUSY)); 
    Sleep_time.mins = 0x01;
    while((FCTL3 & BUSY)); 
  }
  FLASH_LOCK;
     
  ED_Sleep(Sleep_time);
#endif
  
  BSP_Init();
  
 // WDTCTL = WDTPW+WDTHOLD;
  
  setupRTC();//setup Real-time clock for synchronization 
 
  /* If an on-the-fly device address is generated it must be done before the
   * call to SMPL_Init(). If the address is set here the ROM value will not
   * be used. If SMPL_Init() runs before this IOCTL is used the IOCTL call
   * will not take effect. One shot only. The IOCTL call below is conformal.
   */
#ifdef I_WANT_TO_CHANGE_DEFAULT_ROM_DEVICE_ADDRESS_PSEUDO_CODE
  {
    addr_t lAddr;

    createRandomAddress(&lAddr);
    SMPL_Ioctl(IOCTL_OBJ_ADDR, IOCTL_ACT_SET, &lAddr);
  }
#endif /* I_WANT_TO_CHANGE_DEFAULT_ROM_DEVICE_ADDRESS_PSEUDO_CODE */

  /* Keep trying to join (a side effect of successful initialization) until
   * successful. Toggle LEDS to indicate that joining has not occurred.
   */
   
#ifdef SLEEP_CYCLE   
   while (SMPL_SUCCESS != SMPL_Init(sCB) && linkcnt<10)
  {
    toggleLED(1);
    toggleLED(2);
    
    linkcnt++;
    SPIN_ABOUT_A_SECOND;
  }

  if(linkcnt==10)
  Sleep_command(&sltLink,0);  	
#else
   while (SMPL_SUCCESS != SMPL_Init(sCB))
  {
    toggleLED(1);
    toggleLED(2);
    
    linkcnt++;
    SPIN_ABOUT_A_SECOND;
  }
#endif
  /* LEDs on solid to indicate successful join. */
  if (!BSP_LED2_IS_ON())
  {
    toggleLED(2);
  }
  if (!BSP_LED1_IS_ON())
  {
    toggleLED(1);
  }

  //CLK_PORT_DIR |= 0x07; outputing the clocks 
  //CLK_PORT_SEL |= 0x07;
  /* Unconditional link to AP which is listening due to successful join. */
  
  DMAsegments = 0;
  
  
  linkTo();

  while (1){
 
  }
}



static void linkTo()
{
  uint8_t msg[73];
  uint8_t rec_msg[73];
  addr_t  sAdd;
  uint8_t len;
  bspIState_t intState;
  uint8_t payloadSize = 64;
  uint8_t i=0;
  uint16_t j=0,k=0;
  int16_t offset=0,offset_msg=0,Toffset=0,Toffset_msg=0;
#ifdef SLEEP_CYCLE 
  uint32_t cnt = 0;
  Sleep_time_t slt = {0x00,0x01};
#endif
  
  for (j=0;j<512;j++){ //intialize all buffers to zeros
    	BufferX[j]=0;
    	//BufferY[j]=0;
        BufferZ[j]=0;
  }   
  
  for (j=0;j<128;j++){ //intialize all buffers to zeros
    	BufferT[j]=0;
  } 
  
  msg[5]=0;
  msg[6]=0;
  msg[7]=0;
  msg[8]=0;
  
  
  //SMPL_Unlink(sLinkID1);//
  /* Keep trying to link... */
  while (SMPL_SUCCESS != SMPL_Link(&sLinkID1))
  {
    toggleLED(1);
    toggleLED(2);
    SPIN_ABOUT_A_SECOND;
  }

  /* Turn off LEDs. */
  if (BSP_LED2_IS_ON())
  {
    toggleLED(2);
  }
  if (BSP_LED1_IS_ON())
  {
    toggleLED(1);
  }

  /* sleep until button press... */
  //SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);


SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);

 //enable general interrupts
    __bis_SR_register(GIE);
      
  while (1)
  {

	if (IsSampling)
    {                  						
	if(DMAsegments > 0){
			
							
			i=(i+1)&0x1F;
			//set the DMA for the next read
			/*offset = i*BytesPerBuffer;
			Toffset = i*4;*/
			
			 msg[0] = 0x0C;  //application ID = 0x0C for vibration 
			
			msgT = (uint8_t*)(BufferT + (Toffset_msg>>1));
			
			msg[1] = msgT[3];//the clock's value after the first sample is converted, gathered through interrupt 
			msg[2] = msgT[2];
			msg[3] = msgT[1];
			msg[4] = msgT[0];
			
			/*__data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
			__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferT+Toffset);
			__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
							
	        DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
			DMA1CTL =  DMADT_1 + DMADSTINCR_3 + DMASRCINCR_3 + DMAEN;// + DMAIE;
			DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;*/
				
			//read the X, Y, and Z components		
			msgX = (uint8_t*)(BufferX + (offset_msg>>1));
			msgZ = (uint8_t*)(BufferZ + (offset_msg>>1));
			 
			//msg[9] = 0x01; //channel x	
			k = 0;
			for (j=0;j<32;j+=2)
			{
				msg[9+k] = msgX[j];
				msg[9+k+1] = msgX[j+1];
				msg[9+k+2] = msgZ[j];
				msg[9+k+3] = msgZ[j+1];
				k = k+4;
			}
							
			for(j=0;j<3;j++)
			{
	 			if(SMPL_SUCCESS == SMPL_Send(sLinkID1, msg, payloadSize+9))//payloadSize+10								
	 			{
	 				    msg[5] = getRTCNT4();//read the real time clock at this point 
			            msg[6] = getRTCNT3();
			            msg[7] = getRTCNT2();
			            msg[8] = getRTCNT1();
			            
			            WDTCTL = WDTPW+WDTCNTCL;
			            SFRIE1 |= WDTIE;
			            //WDTCTL = WDTPW+WDTSSEL_1+WDTIS__32K+WDTTMSEL;
			            WDTCTL = WDTPW+WDTSSEL_1+WDTIS__32K+WDTTMSEL;
						break;
				}
			}
						
	    	offset_msg = i*BytesPerBuffer;
	    	Toffset_msg = i*4;
	    	
	    	BSP_ENTER_CRITICAL_SECTION(intState);
     	    DMAsegments--;
			BSP_EXIT_CRITICAL_SECTION(intState);	
#ifdef SLEEP_CYCLE 			
		   cnt++;
	         if(cnt == NUM_VIB_PKTS)
	         //if(cnt == 200)
	         {
	          //while(1);  	
	         	      	
	       	  slt.hrs = SLEEP_HRS_AFTER_DATA;  //0x00;
	       	  slt.mins = 0x00; //0x03;
	       	  
	       	 // slt.hrs = 0x00;
	       	 // slt.mins = 0x01;
	       	  
	       	  Sleep_command(&slt,1);
	         }	
#endif	     
            			    
	       }
		    	
		    		   
    }//if(IsSampling)

    
    if (sPeerFrameSem)
    {

      if (SMPL_SUCCESS == SMPL_Receive_Src(sLinkID1, rec_msg, &len, &sAdd, 0, 0, 0))
        {
          if(rec_msg[0]=='S' && rec_msg[1]=='S' && IsSampling==0 )
          {
          	//start  sampling
          	IsSampling = 1;
          	i=0; //buffer index
          	AccelerometerInit();
          	turnAccOn();
          	
          	offset = i*BytesPerBuffer;
          	Toffset = i*4;
          	offset_msg = i*BytesPerBuffer;
			   
		   __data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
		   __data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferT+Toffset);
		   __data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
            
			DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
			DMA1CTL =  DMADT_1 + DMADSTINCR_3 + DMASRCINCR_3 + DMAEN;// + DMAIE;
			DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;

			TBCTL |= MC0;
          }
          if(rec_msg[0]=='T' && rec_msg[1]=='S')
          {
          	//terminate sampling
          	IsSampling = 0;
          	TBCTL &= ~MC0; //stop TimerB 
          	turnAccOff();
	
          }
#ifdef SLEEP_CYCLE           
          if(rec_msg[0]=='S' && rec_msg[1]=='L')
          {	
          	slt.hrs = rec_msg[2];
          	slt.mins = rec_msg[3];
          	
          	Sleep_command(&slt,1);
          }
#endif     

#ifdef WIRELESS_REPROGRAM
		  if(rec_msg[0]=='R' && rec_msg[1]=='P'){
		  	BSP_ENTER_CRITICAL_SECTION(intState);
          	sPeerFrameSem--;
          	BSP_EXIT_CRITICAL_SECTION(intState);
			reprogram();	
		  }           
#endif
          //checkChangeChannel();
          BSP_ENTER_CRITICAL_SECTION(intState);
          sPeerFrameSem--;
          BSP_EXIT_CRITICAL_SECTION(intState);
        }
    }
    
    //if(BcastMsgSem)
    {   
    // 'SY' removed
    }//if(BcastMsgSem)
    
    
  }//while(1)
}

#ifdef WIRELESS_REPROGRAM
void reprogram(){
	int i;
	for(i=0;i<3;i++) {
    	if (SMPL_SUCCESS == SMPL_Unlink(sLinkID1)){
      		break;
      	}
  	}
  	rp_data_t* rp_data = (rp_data_t *)0x1900; 
	FLASH_UNLOCK;
	rp_data->jump_to_app = 0;
	rp_data->reprogram = 1;
	FLASH_LOCK;
	SW_RESET();
}
#endif


void toggleLED(uint8_t which)
{
  if (1 == which)
  {
    BSP_TOGGLE_LED1();
  }
  else if (2 == which)
  {
    BSP_TOGGLE_LED2();
  }
  return;
}

static uint8_t sCB(linkID_t lid)
{
  if (lid == sLinkID1) // a unicast message has been received
  {
    sPeerFrameSem++;
    return 0;
  }
  else if(lid == SMPL_LINKID_USER_UUD) //a broadcast message has been received 
  {
  	BcastMsgSem++;
  	return 0;
  }
  return 1;
}




// ACCELO interface initialization
void AccelerometerInit(void)
{

  //setup ACCELO power connection
  ACC_PPORT_SEL &= ~( ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN); // make P3.4/3.5/3.6 mode "General I/O" 
  ACC_PPORT_DIR |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; //Set  P3.4/3.5/3.6 as output
  ACC_PPORT_OUT |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; // High voltage turns on
  
  //setup ACCELO data connection
  ACC_DPORT_SEL |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; //set as I/O
  ACC_DPORT_DIR &= ~(ACC_X_PIN);
  ACC_DPORT_DIR &= ~(ACC_Y_PIN);
  ACC_DPORT_DIR &= ~(ACC_Z_PIN);

  ACC_DPORT_OUT &= ~(ACC_X_PIN);
  ACC_DPORT_OUT &= ~(ACC_Y_PIN );
  ACC_DPORT_OUT &= ~(ACC_Z_PIN );
       
 
  ADC12CTL0 &= ~ADC12ENC;  
 
  //Setup ADC12   
   //ADC12SHT12 selects 16 cyclye of ADCCLK for t_sample
  ADC12CTL0 = ADC12ON + ADC12SHT0_12;// 
  

  //ADC12SHP : ADC12 triggered by timer
  //ADC12CONSEQ_3: repeated multiple of channels
  // ADC12SSEL_2 : MCLK as ADC12 clk
  //ADC12SHS_3 : TimerB to SHI
  ADC12CTL1 = ADC12SHP + ADC12CONSEQ_3  + ADC12SHS_3 + ADC12SSEL_0;// + ADC12SSEL_3;  
  
  ADC12CTL2 = ADC12RES_2;//set ADC resolution to 12 bits/sample
  
  ADC12MCTL0 = ACC_X_CHANNEL;
  ADC12MCTL1 = ACC_Y_CHANNEL;
  ADC12MCTL2 = ACC_Z_CHANNEL| ADC12EOS;  
  
  ACC_PPORT_OUT &= ~( ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN); // make sure power pin to interface is high (OFF) 
  
  
  //Disable reference module 
  REFCTL0 &= ~REFMSTR;
  
  // TimerB trigers the ADC sampling by generating a PWM signal 
  // the SMCLK runs at 3.997696 MHz the PWM is 39977 cyclyes ==> 100 samples/sec = sampling rate
  TBCTL = TBSSEL_2;   // Use SMCLK as Timer_B source
  TBR = 0;
  TBCCR0 = 13325;     // Initialize TBCCR0
  TBCCR1= 13325 - 1000;
  TBCCTL1 = OUTMOD_7;      

 
  ADC12CTL0 |=  ADC12ENC;//    //Enable and Start conversion
 
 
                                                              
  __data16_write_addr((unsigned long)&DMA0SA & 0xffff, (unsigned long)&ADC12MEM0); 
  DMA0SZ = 16;//payloadSize>>2;
 
  
  //__data16_write_addr((unsigned long)&DMA1SA & 0xffff, (unsigned long)&ADC12MEM1); 
 //DMA1SZ = 36;//payloadSize>>2;


  __data16_write_addr((unsigned long)&DMA2SA & 0xffff, (unsigned long)&ADC12MEM2);
  DMA2SZ = 16;//payloadSize>>2;

 
 __data16_write_addr((unsigned long)&DMA1SA & 0xffff, (unsigned long)&RTCTIM0);//RTCTIM0
  DMA1SZ = 2;
  //__data16_write_addr((unsigned long)&DMA4SA & 0xffff, (unsigned long)&RTCTIM1);
  //DMA2SZ = 36;
 
 
  DMACTL0 = DMA0TSEL_24+DMA1TSEL_24;  //make ADC12 trigger DMA0
  DMACTL1 = DMA2TSEL_24;
  
  FCTL3 = FWKEY;                          // Unlock the flash for write
  FCTL1 = FWKEY + BLKWRT;
        
  
  __delay_cycles(200000);                     
}

void turnAccOn(void){ 
  
  uint8_t i = 0;

  ACC_PPORT_OUT |= ACC_X_PIN; //turn power on for each accelerometer 
  ACC_PPORT_OUT |= ACC_Y_PIN;
  ACC_PPORT_OUT |= ACC_Z_PIN;
  
  
  for(i=0;i<20;i++)
  {
      	__delay_cycles(800000);  //give the accelerometer some time to settle
  }
   
}

void turnAccOff(void){ 
  
  ACC_PPORT_OUT &= ~ACC_X_PIN; //turn power on for each accelerometer 
  ACC_PPORT_OUT &= ~ACC_Y_PIN;
  ACC_PPORT_OUT &= ~ACC_Z_PIN;
   
}




#pragma vector=DMA_VECTOR
__interrupt void DMA_ISR(void)
{
	DMAsegments++;

	switch(__even_in_range(DMAIV,16))
  {
    case  0: break;                         // No interrupt
    case  2: break;
    case  4: break;
    case  6: break;
    case  8: break;
    case 10: break;
    case 12: break;
    case 14: break;            
	  
  }

			q=(q+1)&0x1F;
			//set the DMA for the next read
			qoffset = q*BytesPerBuffer;
			qToffset = q*4;
			
			__data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+qoffset);
			__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferT+qToffset);
			__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+qoffset);
							
	        DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
			DMA1CTL =  DMADT_1 + DMADSTINCR_3 + DMASRCINCR_3 + DMAEN;// + DMAIE;
			DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
  
  	//DMA1CTL =  DMADT_1 + DMADSTINCR_3 + DMAEN; //?
    DMA0CTL &= ~DMAIFG;
    DMA1CTL &= ~DMAIFG;
    DMA2CTL &= ~DMAIFG;  
    
}



#pragma vector=TIMER0_B0_VECTOR
__interrupt void TIMER0_B0_VECTOR_ISR (void){

    TB0CCTL0 &= ~CCIFG;
    _NOP();                                      // Set breakpoint here
}

 
void halBoardInit(void)
{  
  // Tie unused ports
  PAOUT  = 0; PADIR  = 0xFFFF; PASEL  = 0;
  PBOUT  = 0; PBDIR  = 0xFFFF; PBSEL  = 0;
  PCOUT  = 0; PCDIR  = 0xFFFF; PCSEL  = 0;  
  PDOUT  = 0; PDDIR  = 0xFFFF; PDSEL  = 0;  
  // P10.0 to USB RST pin, if enabled with J5
  PEOUT  = 0; PEDIR  = 0xFEFF; PESEL  = 0;  
  P11OUT = 0; P11DIR = 0xFF;   P11SEL = 0;  
  PJOUT  = 0; PJDIR  = 0xFF;
     
  P6OUT = 0x40;                             // Shut down audio output amp
  P5DIR &= ~0x80;                           // USB RX Pin, Input with 
                                            // ...pulled down Resistor
  P5OUT &= ~0x80;
  P5REN |= 0x80;
}

#ifdef SLEEP_CYCLE 
 void LFXT_Start(unsigned int xtdrive)
{
  UCSCTL6_L |= XT1DRIVE1_L+XT1DRIVE0_L; // Highest drive setting for XT1 startup

  while (SFRIFG1 & OFIFG) {   // check OFIFG fault flag
    UCSCTL7 &= ~(DCOFFG+XT1LFOFFG+XT1HFOFFG+XT2OFFG); // Clear OSC flaut Flags fault flags
    SFRIFG1 &= ~OFIFG;        // Clear OFIFG fault flag
  }
  UCSCTL6 = (UCSCTL6 & ~(XT1DRIVE_3)) |(xtdrive); // set Drive mode
}

void ED_Sleep(Sleep_time_t Sleep_time)
{
  WDTCTL = WDTPW+WDTHOLD;
  halBoardInit();
  P7SEL |= BIT1+BIT0;                       // Enable crystal pins 
  LFXT_Start(XT1DRIVE_0);
  setupRTC_calender(Sleep_time);
  __bis_SR_register(LPM3_bits + GIE); 
  __no_operation();
  P1DIR |= BIT1;
  toggleLED(2);
}
#endif

void Sleep_command(Sleep_time_t* slt1,int doUnlink)
{
	uint8_t msg[73];
    unsigned long * Flash_ptr;
  Flash_ptr = (unsigned long *)&Sleep_time;     // Initialize write address
  WDTCTL = WDTPW+WDTHOLD;                   // Disable Watchdog timer
  __disable_interrupt();                    // 5xx Workaround: Disable global
                                            // interrupt while erasing. Re-Enable                                                                       
  while(BUSY & FCTL3);                      // Check if Flash being used
  FCTL3 = FWKEY;                            // Clear Lock bit
  FCTL1 = FWKEY+ERASE;                      // Set Erase bit
  *(unsigned int *)Flash_ptr = 0;           // Dummy write to erase Flash seg
  while(BUSY & FCTL3);                      // Check if Erase is done
  
  FLASH_UNLOCK;
  Sleep_time.hrs = slt1->hrs;
  while((FCTL3 & BUSY)); 
  Sleep_time.mins = slt1->mins;
  while((FCTL3 & BUSY)); 
  FLASH_LOCK;
  
   __enable_interrupt();
  
  if(doUnlink)
  {
  	int i;
  	for(i=0;i<73;i++)
  	msg[i]=0xFF;
  	msg[0] = 0x0D; //unlink msg ID 
  	
  	for(i=0;i<10;i++)
    {
   	  if(SMPL_SUCCESS == SMPL_Send(sLinkID1, msg,73))
  	  break;
  	  SPIN_ABOUT_A_SECOND;
    }
  	
  	SPIN_ABOUT_A_SECOND;
  	for(i=0;i<3;i++)
  	{
      if (SMPL_SUCCESS == SMPL_Unlink(sLinkID1))
      break;
        //toggleLED(1);
        //toggleLED(2);
        SPIN_ABOUT_A_SECOND;
  	}
      
  }
  /* Put radio to sleep */
  SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_SLEEP, 0);
  TBCTL &= ~MC0;
  TBCTL &= ~MC1;
            
  PMMCTL0 |= PMMSWPOR;
}


// Watchdog Timer interrupt service routine
#pragma vector=WDT_VECTOR
__interrupt void watchdog_timer(void)
{
  Sleep_time_t slt = {0x00,0x01};
  
  SFRIFG1 &= ~WDTIFG;  
  Sleep_command(&slt,1);
}
