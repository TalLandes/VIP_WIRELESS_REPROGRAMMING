//this file was added by Ghaith

#ifndef BSP_RTC_H_
#define BSP_RTC_H_



#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"

typedef struct
{
  uint8_t hrs;
  uint8_t mins;
} Sleep_time_t;

void setupRTC(void);
uint8_t getRTCNT1(void);
uint8_t getRTCNT2(void);
uint8_t getRTCNT3(void);
uint8_t getRTCNT4(void);

void setRTCNT(uint8_t,uint8_t,uint8_t,uint8_t);
void setRTCNT1(uint8_t);
void setRTCNT2(uint8_t);
void setRTCNT3(uint8_t);
void setRTCNT4(uint8_t);

#endif /*BSP_RTC_H_*/
