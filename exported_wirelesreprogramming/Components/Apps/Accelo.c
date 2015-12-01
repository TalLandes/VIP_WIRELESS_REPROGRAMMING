
#include "bsp_rtc.h"
#include "Accelo.h"
#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"

//unsigned short BufferX[2400];
//unsigned short BufferY[2400];
//unsigned short BufferZ[2400];
//
//
//#define BytesPerPacket 72; //this is bytes per channel per packet. 
//
//char *msgX;
//char *msgY;
//char *msgZ;
//
//volatile unsigned char DMA_DONE=0; 
//
//
////ON/OFF flag
//volatile unsigned short AcceloON=0;
//




//
//
//// ACCELO interface initialization
//void AccelerometerInit(void)
//{
//  uint8_t payloadSize = BytesPerPacket;
//
//  //setup ACCELO power connection
//  ACC_PPORT_SEL &= ~( ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN); // make P3.4/3.5/3.6 mode "General I/O" 
//  ACC_PPORT_DIR |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; //Set  P3.4/3.5/3.6 as output
//  ACC_PPORT_OUT |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; // High voltage turns on
//  
//  //setup ACCELO data connection
//  ACC_DPORT_SEL |= ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN; //set as I/O
//  ACC_DPORT_DIR &= ~(ACC_X_PIN);
//  ACC_DPORT_DIR &= ~(ACC_Y_PIN);
//  ACC_DPORT_DIR &= ~(ACC_Z_PIN);
//
//  ACC_DPORT_OUT &= ~(ACC_X_PIN);
//  ACC_DPORT_OUT &= ~(ACC_Y_PIN );
//  ACC_DPORT_OUT &= ~(ACC_Z_PIN );
//       
// 
//  ADC12CTL0 &= ~ADC12ENC;  
// 
//  //Setup ADC12   
//   //ADC12SHT12 selects 16 cyclye of ADCCLK for t_sample
//  ADC12CTL0 = ADC12ON + ADC12SHT0_12;// 
//  
//
//  //ADC12SHP : ADC12 triggered by timer
//  //ADC12CONSEQ_3: repeated multiple of channels
//  // ADC12SSEL_2 : MCLK as ADC12 clk
//  //ADC12SHS_3 : TimerB to SHI
//  ADC12CTL1 = ADC12SHP + ADC12CONSEQ_3  + ADC12SHS_3 + ADC12SSEL_0;// + ADC12SSEL_3;  
//  
//  ADC12CTL2 = ADC12RES_2;//set ADC resolution to 12 bits/sample
//  
//  ADC12MCTL0 = ACC_X_CHANNEL;
//  ADC12MCTL1 = ACC_Y_CHANNEL;
//  ADC12MCTL2 = ACC_Z_CHANNEL| ADC12EOS;  
//  
//  ACC_PPORT_OUT &= ~( ACC_X_PIN + ACC_Y_PIN + ACC_Z_PIN); // make sure power pin to interface is high (OFF) 
//  
//  
//  //Disable reference module 
//  REFCTL0 &= ~REFMSTR;
//  
//  // TimerB trigers the ADC sampling by generating a PWM signal 
//  // the SMCLK runs at 3.997696 MHz the PWM is 39977 cyclyes ==> 100 samples/sec = sampling rate
//  TBCTL = TBSSEL_2;   // Use SMCLK as Timer_B source
//  TBR = 0;
//  TBCCR0 = 13325;     // Initialize TBCCR0
//  TBCCR1= 13325 - 3000;
//  TBCCTL1 = OUTMOD_7;      
//
// 
//  ADC12CTL0 |=  ADC12ENC;//    //Enable and Start conversion
// 
// 
//                                                              
//  __data16_write_addr((unsigned long)&DMA0SA & 0xffff, (unsigned long)&ADC12MEM0); 
//  DMA0SZ = payloadSize>>2;
// 
//  
//  __data16_write_addr((unsigned long)&DMA1SA & 0xffff, (unsigned long)&ADC12MEM1); 
// DMA1SZ = payloadSize>>2;
// // DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
//  
//  __data16_write_addr((unsigned long)&DMA2SA & 0xffff, (unsigned long)&ADC12MEM2);
//  DMA2SZ = payloadSize>>2;
// // DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
// 
// 
//  DMACTL0 = DMA0TSEL_24+DMA1TSEL_24;  //make ADC12 trigger DMA0
//  DMACTL1 = DMA2TSEL_24;
//  
//  
//  __delay_cycles(200000);                     
//
//}
//


void start_sampling(linkID_t LinkID)
{
   	uint8_t i=0;
   	uint16_t j=0;
	uint16_t offset,offset_msg;
	
    uint8_t msg[80]; 
    uint8_t payloadSize = BytesPerPacket;
    msg[0]=0x0C;  //application ID = 0x0B for vibration
    msg[5] = (uint8_t) BytesPerPacket;
    
    AccelerometerInit();
        
   for(i=0;i<20;i++)
   {
        __delay_cycles(800000);  //give the accelerometer some time to settle
   }
         
           
               
//    P1DIR |= 0x03;
//    P1OUT |= 0x02;  //turn on LED2 to indicate mote is ON
//    P1OUT &= ~0x01;
//        
//    P2OUT |= 0x80;
//    P2DIR &= ~0x80;
//    P2REN |= 0x80;
//    P2SEL &= ~0x80;
//    P2IE = 0x80;
//    P2IES &= ~0x80;
//    P2IFG &=~0x80;
    
    //intialize buffers
    for (j=0;j<2400;j++){
    	BufferX[j]=0;
    	BufferY[j]=0;
        BufferZ[j]=0;
    }    
        
    //enable general interrupts
    __bis_SR_register(GIE);

    while(1){
          
         if(AcceloON){
         	
         	
                 i=0;
                // AdcStartRead();
                 FCTL3 = FWKEY;                          // Unlock the flash for write
    			 FCTL1 = FWKEY + BLKWRT;
                
                offset = i*BytesPerPacket;
			    offset_msg = i*BytesPerPacket;
			   
			    __data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
				__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferY+offset);
				__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
							

				DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
				DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
				DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;

				TBCCTL1 &= ~CCIFG;
				TBCTL |= MC0;
              //__bis_SR_register(GIE); 
                
                 do{						
					if(DMA_DONE){
								
						    msg[1] = getRTCNT4();//read the real time clock at this point 
							msg[2] = getRTCNT3();
							msg[3] = getRTCNT2();
							msg[4] = getRTCNT1();
							
							
							//set the DMA for the next read
							offset = i*BytesPerPacket;
							__data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
							__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferY+offset);
							__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
									
					        DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
							DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
							DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
							
							//read the X, Y, and Z components		
							msgX = (char*)(BufferX + (offset_msg>>1));
							
							for (j=0;j<payloadSize;j++)
							{
								msg[5+j]=msgX[j];
							}
							
							for(j=0;j<3;j++)
							{
								if(SMPL_SUCCESS == SMPL_Send(LinkID, msg, payloadSize+6))								{
									break;
								}
							}
									
							msgY = (char*)(BufferY + (offset_msg>>1));
							for (j=0;j<payloadSize;j++)
							{
								msg[5+j]=msgY[j];
							}
							
							for(j=0;j<3;j++)
							{
								if(SMPL_SUCCESS == SMPL_Send(LinkID, msg, payloadSize+6))
								{
									break;
								}
							}
									
							msgZ = (char*)(BufferZ + (offset_msg>>1));
							
							for (j=0;j<payloadSize;j++)
							{
								msg[5+j]=msgZ[j];
							}
							
							for(j=0;j<3;j++)
							{
								if(SMPL_SUCCESS == SMPL_Send(LinkID, msg, payloadSize+6))
								{
									break;
								}
							}
							
										
							DMA_DONE = 0;
									
							offset_msg = i*BytesPerPacket;
						    i=(i+1)&0x1F; //circulate every 15 packets
						      
						}//if DMA_DONE
            		}while(AcceloON);
        }///if accelo ON
    }///while(1)
}//main





#pragma vector=DMA_VECTOR
__interrupt void DMA_ISR(void)
{
	
	DMA_DONE=1;
	
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
	
    DMA0CTL &= ~DMAIFG;
    DMA1CTL &= ~DMAIFG;
    DMA2CTL &= ~DMAIFG;
    
}


