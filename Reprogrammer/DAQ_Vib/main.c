#include <msp430x54xA.h>

//Accelerometer power  - using Port 3 pin 5 to power the accelo.
#define ACC_PWR_PIN       BIT5
#define ACC_PPORT_DIR     P3DIR
#define ACC_PPORT_OUT     P3OUT
#define ACC_PPORT_SEL     P3SEL

//Accelerometer Data - using Port 7 pin 4 for Analog input
//Pin 7.4 is connecteed to ADC12 channel 12
#define ACC_DATA_PIN      BIT4
#define ACC_DPORT_DIR     P7DIR
#define ACC_DPORT_SEL     P7SEL
#define ACC_DPORT_OUT     P7OUT
//Connect ACCELO input to ADC channel 12 
#define ACC_CHANNEL     ADC12INCH_12
#define ACC_CH_BIT      BIT0  

//USB definition
#define USB_PORT_OUT      P5OUT  
#define USB_PORT_SEL      P5SEL
#define USB_PORT_DIR      P5DIR
#define USB_PORT_REN      P5REN
#define USB_PIN_TXD       BIT6
#define USB_PIN_RXD       BIT7


#define Num_of_Samples 256


#define CLK_PORT_DIR      P11DIR //outputs clocks to testpoints
#define CLK_PORT_OUT      P11OUT
#define CLK_PORT_SEL      P11SEL


//Acquired data and index
volatile unsigned short samples[Num_of_Samples];
static unsigned char index =0;
volatile unsigned char sample=0;
//ON/OFF flag
volatile unsigned short AcceloON=0;

//USB buffer
char UsbReceiveBuffer[Num_of_Samples];
unsigned char bufferSize=0;

volatile short new_flag;

// ACCELO interface initialization
void AccelerometerInit(void)
{

  //setup ACCELO power connection
  ACC_PPORT_SEL &= ~ACC_PWR_PIN;// make P3.5 mode "General I/O" 
  ACC_PPORT_DIR |= ACC_PWR_PIN; //Set P3.5 as output
  ACC_PPORT_OUT |= ACC_PWR_PIN; // High voltage turns on
  
  //setup ACCELO data connection
  ACC_DPORT_SEL |= ACC_DATA_PIN; //set P7.4 mode "Peripheral"
  ACC_DPORT_DIR &= ~ACC_DATA_PIN; //set direction as input
  ACC_DPORT_OUT &= ~ACC_DATA_PIN;
                        //P7REN |= BIT4;
                        //P7OUT |= BIT4;
                        
                    
 // REFCTL0 &= ~REFMSTR;
  REFCTL0 &= ~REFMSTR;
  //Setup ADC12   
   //ADC12SHT12 selects 16 cyclye of ADCCLK for t_sample
  ADC12CTL0 = ADC12ON + ADC12SHT0_7;//+ ADC12REFON+ ADC12REF2_5V; 

  //ADC12SHP : ADC12 triggered by timer
  //ADC12CONSEQ_2: repeated single channel sampling
  // ADC12SSEL_2 : MCLK as ADC12 clk
  //ADC12SHS_3 : TimerB to SHI
  ADC12CTL1 = ADC12SHP + ADC12CONSEQ_2 +  ADC12SHS_3;  
  
  ADC12CTL2 = ADC12RES_2;// + ADC12DF;   //set ADC resolution to 12 bits/sample
  // ADC12DF = 1 : conversion is left-justified two's complement.
  
  ADC12MCTL0 = ACC_CHANNEL +  ADC12EOS;// + ADC12SREF_1; 
  
  ACC_PPORT_OUT &= ~ACC_PWR_PIN; // make sure power pin to interface is high (OFF) 
  
  // TimerB trigers the ADC sampling by generating a PWM signal 
  // the SMCLK runs at 3.997696 MHz the PWM is 39977 cyclyes ==> 100 samples/sec = sampling rate
   
  TBCTL = TBSSEL_2;   // Use SMCLK as Timer_B source
  TBR = 0;
  TBCCR0 = 39977;     // Initialize TBCCR0
  TBCCR1= 39977 - 1000;
  TBCCTL1 = OUTMOD_7;      
  
 // TBCTL = TBSSEL_1;   // Use SMCLK as Timer_B source
 // TBR = 0;
 // TBCCR0 = 327;     // Initialize TBCCR0
 // TBCCR1= 327 - 20;
 // TBCCTL1 = OUTMOD_7;  
 
  __delay_cycles(200000);                     
                    
}


void AdcStartRead(void)
{
        TBCTL |= MC0;

    ADC12IFG = ~(ACC_CH_BIT); //clear IFG
        
    ADC12IE |= ACC_CH_BIT;// | 0x1000; //Enable interrupt
        
    ADC12CTL0 |=  ADC12ENC;// + ADC12SC;   //Enable and Start conversion
   
 
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
  UCA1BR1 = 0;//1;                 
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


void main(void)
{
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
    
        
        UsbInit();
        new_flag = 0;
        UsbSendString("hello ", 6);
        
        //enable general interrupts
        __bis_SR_register(GIE);

        while(1){
          
           if(AcceloON){
                   AdcStartRead();
                   do{
                   
                     bufferSize  = 0;
            }while(AcceloON);
           }
//			if(AcceloON){
//                   AdcStartRead();
//                   do{
//                   //        if (bufferSize > 0 ){       
//                //        UsbSendChar(samples[index]);
//                 //    bufferSize  = 0;
//               }while(index < Num_of_Samples);
//               
//            }


        }
}

#pragma vector=USCI_A1_VECTOR
__interrupt void USCI_A1_ISR (void)
{
  UsbReceiveBuffer[bufferSize++] = UCA1RXBUF;
}

#pragma vector=ADC12_VECTOR
__interrupt void ADC12_ISR(void)
{
     //   static unsigned char index =0;
 //  switch(__even_in_range(ADC12IV,34)){
  //         case 0x06:
          //        samples[index] = ADC12MEM0;
               //    UsbSendChar('a');
                   UsbSendChar(((char)(ADC12MEM0>>8)&0x0F));
                   UsbSendChar((char)(ADC12MEM0));//>>8));// & 0x00FF));
           //        while (!(UCA1IFG & UCTXIFG));  //wait for previous transmission to end
     //   UCA1TXBUF = character;        
    //               index++;
             //     if(index == Num_of_Samples){
               //            index =0;
               //    }
                   
  // default: 
 //                  break;
 //  }
   ADC12IFG = 0;
}

#pragma vector=PORT2_VECTOR
__interrupt void Port_2(void){

  if(AcceloON){
        TBCTL &= ~MC0; //Stop TimerB
        
        ADC12CTL0 &=  ~(ADC12ENC + ADC12SC); //stop ADC
        AcceloON = 0;
  }else{
          AcceloON =1;
  }
         
  ACC_PPORT_OUT ^= ACC_PWR_PIN; //toggle the interface power (high = interface is OFF, low= interface is ON)
  P1OUT ^= 0x01; // toggle LED1 to indicate interface On/Off        
  P2IFG = 0; //clear interrupt flag from
        
}
