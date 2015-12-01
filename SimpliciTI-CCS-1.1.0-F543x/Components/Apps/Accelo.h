#ifndef ACCELO_H_
#define ACCELO_H_


#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h" 

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

void AccelerometerInit(void);
void start_sampling(linkID_t);



#endif /*ACCELO_H_*/
