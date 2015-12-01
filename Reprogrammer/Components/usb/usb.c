//This file was added by Ghaith

#include "usb.h"
#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"

volatile char UsbReceiveBuffer[255];
volatile uint8_t BufferSize=0;
volatile char CmdComplete=0;

void UsbInit(void)
{
  volatile unsigned char i;
  
  for (i = 0;i < 255; i++)
    UsbReceiveBuffer[i]='\0';
	  
  BufferSize = 0;
  USB_PORT_SEL |= USB_PIN_RXD + USB_PIN_TXD;
  USB_PORT_DIR |= USB_PIN_TXD;
  USB_PORT_DIR &= ~USB_PIN_RXD;
  
  UCA1CTL1 |= UCSWRST;                          //Reset State                      
  UCA1CTL0 = UCMODE_0;
  
  UCA1CTL0 &= ~UC7BIT;                      // 8bit char
  UCA1CTL1 |= UCSSEL_2;
  UCA1BR0 = 34;                  // 16Mhz/460800=34           
  UCA1BR1 = 0;                    
  UCA1MCTL = 0xC;
  UCA1CTL1 &= ~UCSWRST;  
  UCA1IE |= UCRXIE;
  
  __bis_SR_register(GIE);                   // Enable Interrupts
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


void UsbSendChar( uint8_t character)
{
  while (!(UCA1IFG & UCTXIFG));  //wait for previous transmission to end
  UCA1TXBUF = character; // put current charater out
}

void UsbSendString( uint8_t string[], unsigned char length)
{
  volatile unsigned char i;
  for (i=0; i < length; i++)
    UsbSendChar(string[i]);  
}

/************************************************************************/
#pragma vector=USCI_A1_VECTOR
__interrupt void USCI_A1_ISR (void)
{
 UsbReceiveBuffer[BufferSize++] = UCA1RXBUF;
}

