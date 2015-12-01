//This file was added by Ghaith
#ifndef USB_H_
#define USB_H_

#include "usb.h"
#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"

#define USB_PORT_OUT      P5OUT
#define USB_PORT_SEL      P5SEL
#define USB_PORT_DIR      P5DIR
#define USB_PORT_REN      P5REN
#define USB_PIN_TXD       BIT6
#define USB_PIN_RXD       BIT7

#define PROMPT	UsbSendChar('>')
#define NEW_LINE	UsbSendChar(0x0A)

/*-------------------------------------------------------------
 *                  Function Prototypes 
 * ------------------------------------------------------------*/ 
void UsbInit(void);
void UsbShutDown(void);
void UsbSendChar( uint8_t character);
void UsbSendString( uint8_t string[], unsigned char length);


#endif /*USB_H_*/
