#include <msp430x54xA.h>

//Accelerometer power  - using Port 3 to power the accelo.

#define ACC_PPORT_DIR     P3DIR
#define ACC_PPORT_OUT     P3OUT
#define ACC_PPORT_SEL     P3SEL

//Accelerometer Data - using Port 7 
#define ACC_DPORT_DIR     P7DIR
#define ACC_DPORT_SEL     P7SEL
#define ACC_DPORT_OUT     P7OUT


#define ACC_X_PIN   BIT4  //7.4 and 3.4 for channel X
#define ACC_Y_PIN	BIT5  //7.5 and 3.5 for channel Y
#define ACC_Z_PIN	BIT6  //7.6 and 3.6 for channel Z


//Connect ACCELO input to ADC channel 
#define ACC_X_CHANNEL     ADC12INCH_12
#define ACC_Y_CHANNEL     ADC12INCH_13
#define ACC_Z_CHANNEL     ADC12INCH_14

//ADC channels
#define ADC_X_CH      BIT0
#define ADC_Y_CH      BIT1
#define ADC_Z_CH      BIT2  

//USB definition
#define USB_PORT_OUT      P5OUT  
#define USB_PORT_SEL      P5SEL
#define USB_PORT_DIR      P5DIR
#define USB_PORT_REN      P5REN
#define USB_PIN_TXD       BIT6
#define USB_PIN_RXD       BIT7


#define Num_of_Samples 256

//Buffers 
#define BufferSize 1140

unsigned short BufferX[2500];
unsigned short BufferY[2500];
unsigned short BufferZ[2500];


//#define BufferX 0x10000
//#define BufferY 0x10800
//#define BufferZ 0x11000



#define BytesPerPacket 76; //this is bytes per channel per packet. 

char *msgX;
char *msgY;
char *msgZ;

volatile unsigned char DMA_DONE=0; 



#define CLK_PORT_DIR      P11DIR //outputs clocks to testpoints
#define CLK_PORT_OUT      P11OUT
#define CLK_PORT_SEL      P11SEL



//Acquired data and index
volatile unsigned short samples[Num_of_Samples];

volatile unsigned char sample=0;
//ON/OFF flag
volatile unsigned short AcceloON=0;

//USB buffer
char UsbReceiveBuffer[Num_of_Samples];
unsigned char bufferSize=0;

volatile short new_sample =0;

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
  TBCCR1= 13325 - 3000;
  TBCCTL1 = OUTMOD_7;      
  
 //  TBCTL = TBSSEL_1;   // Use ACLK as Timer_B source
 // TBR = 0;
 // TBCCR0 = 327;     // Initialize TBCCR0
  //TBCCR1= 327 - 20;
 // TBCCTL1 = OUTMOD_7;  
 
 
 
  ADC12CTL0 |=  ADC12ENC;//    //Enable and Start conversion
 
 
                                                              
  __data16_write_addr((unsigned long)&DMA0SA & 0xffff, (unsigned long)&ADC12MEM0); 
  DMA0SZ = 38;
 
    	

  
  __data16_write_addr((unsigned long)&DMA1SA & 0xffff, (unsigned long)&ADC12MEM1); 
 DMA1SZ = 38;
 // DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
	

  
  __data16_write_addr((unsigned long)&DMA2SA & 0xffff, (unsigned long)&ADC12MEM2);
  DMA2SZ = 38;
 // DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
 
 
  DMACTL0 = DMA0TSEL_24+DMA1TSEL_24;  //make ADC12 trigger DMA0
  DMACTL1 = DMA2TSEL_24;
  
  
  __delay_cycles(200000);                     

}



//sets system clock to 16MHz
void setSystemClock()
{


  // Set up XT1 Pins to analog function, and to lowest drive        
  P7SEL |= 0x03;                            
  UCSCTL6 |= XCAP_3 ;                       // Set internal cap values
  
  while(SFRIFG1 & OFIFG) {                  // Check OFIFG fault flag
    while ( (SFRIFG1 & OFIFG))              // Check OFIFG fault flag
    {    
      // Clear OSC fault flags 
      UCSCTL7 &= ~(DCOFFG + XT1LFOFFG + XT1HFOFFG + XT2OFFG);
      SFRIFG1 &= ~OFIFG;                    // Clear OFIFG fault flag
    }
    UCSCTL6 &= ~(XT1DRIVE1_L+XT1DRIVE0);    // Reduce the drive strength 
  }
        
 // Disable the FLL control loop
  __bis_SR_register(SCG0);
  // Set lowest possible DCOx, MODx       
  UCSCTL0 = 0x00;
  
  UCSCTL1 = DCORSEL_5;  // Select suitable range

  UCSCTL2 = FLLD_1 + 121;  // Set DCO Multiplier  FLLNx = 1111001 ==> n=121  ==>  f_DCO = (n+1)*32,768 = 3.997 MHz

  //  SMLK = 3.997MHz
  // MLK = 4 x 3.997  = 15.9907 MHz
  UCSCTL4 = SELA__XT1CLK | SELS__DCOCLKDIV  |  SELM__DCOCLK ;
  
  __bic_SR_register(SCG0);              // Enable the FLL control loop
  
  // Loop until XT1,XT2 & DCO fault flag is cleared
  do
  {
    // Clear XT2,XT1,DCO fault flags
    UCSCTL7 &= ~(XT2OFFG + XT1LFOFFG + XT1HFOFFG + DCOFFG);
    // Clear fault flags
    SFRIFG1 &= ~OFIFG;
  }while (SFRIFG1&OFIFG); // Test oscillator fault flag
//  
  // Worst-case settling time for the DCO when the DCO range bits have been 
  // changed is n x 32 x 32 x f_FLL_reference. See UCS chapter in 5xx UG 
  // for optimization.
  // 32 x 32 x / f_FLL_reference (32,768 Hz) = .03125 = t_DCO_settle
  // t_DCO_settle / (1 / 25 MHz) = 781250 = counts_DCO_settle
  __delay_cycles(781250);  
}

void UsbInit(void)
{
  volatile unsigned char i;
  
  for (i = 0;i<255; i++)
    UsbReceiveBuffer[i]='\0';
          
  bufferSize = 0;
  USB_PORT_SEL |= USB_PIN_RXD + USB_PIN_TXD; //slect usb RX - TX pins
  USB_PORT_DIR |= USB_PIN_TXD; //Set direction for each pin
  USB_PORT_DIR &= ~USB_PIN_RXD;
  
  UCA1CTL1 |= UCSWRST;       // Enable Software Reset                       
  UCA1CTL0 = UCMODE_0;    // UART mode
  
  UCA1CTL0 &= ~UC7BIT;  // 8bit char (not 7bit)
  
  UCA1CTL1 |= UCSSEL_2; //SMCLK
  UCA1BR0 = 69;//160;      // 
  UCA1BR1 = 0;//1;                // It ends up being 19200 
  UCA1MCTL = 0x8;
  UCA1CTL1 &= ~UCSWRST;  
  UCA1IE |= UCRXIE;
  

}

void UsbShutDown(void)
{
  UCA1IE &= ~UCRXIE;
  UCA1CTL1 = UCSWRST;                     
  USB_PORT_SEL &= ~( USB_PIN_RXD + USB_PIN_TXD );
  USB_PORT_DIR |= USB_PIN_TXD;
  USB_PORT_DIR |= USB_PIN_RXD;
  USB_PORT_OUT &= ~(USB_PIN_TXD + USB_PIN_RXD);
}


void UsbSendChar(unsigned char character)
{
  while (!(UCA1IFG & UCTXIFG));  //wait for previous transmission to end
  UCA1TXBUF = character;                 // put current charater out
}


void UsbSendString(char string[], unsigned char length)
{
  volatile unsigned char i;
  for (i=0; i < length; i++)
    UsbSendChar(string[i]);  
}


void AdcStartRead(void)
{
	
	
	
}

void main(void)
{
   	volatile unsigned char i=0;
   	volatile unsigned short j=0;
	volatile short offset,offset_msg;
     
  	
   
    // Stop watchdog timer
    WDTCTL = WDTPW+WDTHOLD;
    setSystemClock();
    AccelerometerInit();
        
   
           CLK_PORT_DIR |= 0x07;
           CLK_PORT_SEL |= 0x07;
           
               
    P1DIR |= 0x03;
    P1OUT |= 0x02;  //turn on LED2 to indicate mote is ON
    P1OUT &= ~0x01;
        
    P2OUT |= 0x80;
    P2DIR &= ~0x80;
    P2REN |= 0x80;
    P2SEL &= ~0x80;
    P2IE = 0x80;
    P2IES &= ~0x80;
    P2IFG &=~0x80;
    
    
    for (j=0;j<2500;j++){
    	BufferX[j]=0;
    	BufferY[j]=0;
        BufferZ[j]=0;
    }
        
    UsbInit();
        
    UsbSendString("hello ", 6);
        
        
    //enable general interrupts
    __bis_SR_register(GIE);

    while(1){
          
         if(AcceloON){
         	
         	for(i=0;i<20;i++)
         	  __delay_cycles(800000);  //give acc some time to settle
         
                 i=0;
                // AdcStartRead();
                 FCTL3 = FWKEY;                          // Unlock the flash for write
    			 FCTL1 = FWKEY + BLKWRT;
                
                offset = i*BytesPerPacket;
			    offset_msg = i*BytesPerPacket;
			   
			    __data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
				__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferY+offset);
				__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
							
 
							
				DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;// + DMADT_4;
				DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;// + DMADT_4;
				DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;// + DMADT_4;
							
				//msg = (char*) (BufferX+offset);
		
				TBCCTL1 &= ~CCIFG;
				TBCTL |= MC0;
              //  __bis_SR_register(GIE); 
                
                 do{						
					if(DMA_DONE){
								
						          
							offset = i*BytesPerPacket;
							__data16_write_addr((unsigned long)&DMA0DA & 0xffff, (unsigned long)BufferX+offset);
							__data16_write_addr((unsigned long)&DMA1DA & 0xffff, (unsigned long)BufferY+offset);
							__data16_write_addr((unsigned long)&DMA2DA & 0xffff, (unsigned long)BufferZ+offset);
									
					        DMA0CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
							DMA1CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
							DMA2CTL =  DMADSTINCR_3 + DMAEN + DMAIE;
									
							msgX = (char*)(BufferX + (offset_msg>>1));
							UsbSendString(msgX,76);  //
									
							msgY = (char*)(BufferY + (offset_msg>>1));
							UsbSendString(msgY,76);  //
									
							msgZ = (char*)(BufferZ + (offset_msg>>1));
							UsbSendString(msgZ,76);  //
										
							DMA_DONE = 0;
									
							offset_msg = i*BytesPerPacket;
									
									
						//	 __bis_SR_register(LPM0_bits + GIE); 
						
					         i=(i+1)&0x1F; //circulate every 15 packets 
					}
            		}while(AcceloON);
        }///if accelo ON
    }///while(1)
}//main

#pragma vector=USCI_A1_VECTOR
__interrupt void USCI_A1_ISR (void)
{
  UsbReceiveBuffer[bufferSize++] = UCA1RXBUF;
}

// Timer B0 overflow interrupt service routine
#pragma vector=TIMER0_B1_VECTOR
__interrupt void TIMER0_B1_ISR(void)
{

  switch(__even_in_range(TB0IV,14))
  {
    case  0: break;                         // No interrupt
    case  2: break;                         // TB0CCR1 not used
    case  4: break;                         // TB0CCR2 not used
    case  6: break;                         // TB0CCR3 not used
    case  8: break;                         // TB0CCR4 not used
    case 10: break;                         // TB0CCR5 not used
    case 12: break;                         // TB0CCR6 not used
    case 14:                                // TBIFG overflow handler   
    //  REFCTL0 |= REFON;                     // Enable internal reference  
    //  ADC12CTL0 |= ADC12ENC;                // Disable conversions to configure REF             
	  break;
  }
}


#pragma vector=ADC12_VECTOR
__interrupt void ADC12_ISR(void)
{
     //   static unsigned char index =0;
 //  switch(__even_in_range(ADC12IV,34)){
  //         case 0x06:
          //        samples[index] = ADC12MEM0;
               //    UsbSendChar('a');
     //              UsbSendChar(((char)(ADC12MEM0>>8)&0x0F));
      //             UsbSendChar((char)(ADC12MEM0));
           //        while (!(UCA1IFG & UCTXIFG));  //wait for previous transmission to end
     //   UCA1TXBUF = character;        
    //               index++;
             //     if(index == Num_of_Samples){
               //            index =0;
               //    }
                   
  // default: 
 //                  break;
 //  }
  // ADC12IFG = 0;
}


#pragma vector=PORT2_VECTOR
__interrupt void Port_2(void){

  if(AcceloON){
        TBCTL &= ~MC0; //Stop TimerB
        
        ADC12CTL0 &=  ~(ADC12ENC); //stop ADC
        AcceloON = 0;
  }else{
          AcceloON =1;
  }
         
  ACC_PPORT_OUT ^= ACC_X_PIN; //toggle the interface power (high = interface is OFF, low= interface is ON)
  ACC_PPORT_OUT ^= ACC_Y_PIN;
  ACC_PPORT_OUT ^= ACC_Z_PIN;
  
  P1OUT ^= 0x01; // toggle LED1 to indicate interface On/Off        
  P2IFG = 0; //clear interrupt flag from     
}

#pragma vector=DMA_VECTOR
__interrupt void DMA_ISR(void)
{
	
	DMA_DONE=1;
	
	//P1OUT ^= 0x02;
	switch(__even_in_range(DMAIV,16))
  {
    case  0: break;                         // No interrupt
    case  2: break;
    case  4: break;
    case  6: 
	//	     UsbSendString(msg,52);  //26  * 2 bytes_per_sample
		     break;
    case  8: break;
    case 10: break;
    case 12: break;
    case 14: break;            
	  
  }
	
    DMA0CTL &= ~DMAIFG;
    DMA1CTL &= ~DMAIFG;
    DMA2CTL &= ~DMAIFG;
    
 //   DMA0CTL &= ~(DMAEN + DMAIE);
 //   DMA1CTL &= ~(DMAEN + DMAIE);
 //   DMA2CTL &= ~(DMAEN + DMAIE);
}
