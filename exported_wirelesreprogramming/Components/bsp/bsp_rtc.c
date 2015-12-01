//this file was added by Ghaith

/**********************************************************************************************
 * All modifications related to Synchronization using DMA timestamping, Buffer management, 
 * LPM, Sleep Cycle, Calender mode of RTC and flash memory modification has been implemented 
 * by DEEPA PHANISH.
 * Please contact deepa.phanish@gatech.edu for any clarification.
**************************************************************************************************/

#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"
#include "bsp_rtc.h"

#define SPIN_ABOUT_A_SECOND   NWK_DELAY(1000)

void setupRTC(void)
{
   RTCCTL01 &= ~RTCMODE;
    
   RTCNT4=0x00;
   RTCNT3=0x00;
   RTCNT2=0x00;
   RTCNT1=0x00;
    
   RTCCTL01 &= ~RTCHOLD;

   RTCPS0CTL = RT1SSEL_0 + RT1PSDIV_7; //source RT0PS from ACLK
   RTCPS1CTL = RT1SSEL_2 + RT1IP_6 ;//+ RT1PSIE; // Source RT1PS from RT0PS  generates an interrupt every 1 sec.

}

void setupRTC_calender(Sleep_time_t Sleep_time)
{
  
   RTCNT4=0x00;
   RTCNT3=0x00;
   RTCNT2=0x00;
   RTCNT1=0x00;
    
   RTCCTL01 |= RTCMODE; 
   RTCCTL01 |= RTCAIE;
   //RTCCTL01 |= RTCTEV0;

   RTCHOUR = 0;
   RTCMIN = 0;
   RTCADAY = 0;
   RTCADOW = 0;
   RTCAHOUR = 0x80+Sleep_time.hrs;
   RTCAMIN  = 0x80+Sleep_time.mins;
   RTCPS0CTL = RT1SSEL_0 + RT1PSDIV_7; //source RT0PS from ACLK
   RTCPS1CTL = RT1SSEL_2 + RT1IP_6;// + RT1PSIE; // Source RT1PS from RT0PS  generates an interrupt every 1 sec.
   // do'nt care in calender mode RT1PSDIV_7 RTCPS1CTL
   __bis_SR_register(GIE);
    RTCCTL01 &= ~RTCHOLD;
}


uint8_t getRTCNT4(void){
	return RTCNT4;
}

uint8_t getRTCNT3(void){
	return RTCNT3;
}

uint8_t getRTCNT2(void){
	return RTCNT2;
}

uint8_t getRTCNT1(void){
	return RTCNT1;
}

void setRTCNT(uint8_t n4,uint8_t n3,uint8_t n2,uint8_t n1){
	
	RTCCTL01 |= RTCHOLD;
	setRTCNT4(n4);
	setRTCNT3(n3);
	setRTCNT2(n2);
	setRTCNT1(n1);
	RTCCTL01 &= ~RTCHOLD;
}

void setRTCNT4(uint8_t n){
	RTCNT4=n;
}
void setRTCNT3(uint8_t n){
	RTCNT3=n;
}
void setRTCNT2(uint8_t n){
	RTCNT2=n;
}
void setRTCNT1(uint8_t n){
	RTCNT1=n;
}



#pragma vector=RTC_VECTOR
__interrupt void RTC_ISR(void)
{
#if defined(ACCESS_POINT)
	uint8_t  sync_msg[6];
    uint8_t i=0;
#endif
    switch (RTCIV)
    {
        case 0x02: break;
        case 0x04: break;
        case 0x06: 
       
        RTCCTL01 |= RTCHOLD;
        
        /* Toggle sleep state 
          if (__get_SR_register_on_exit() & CPUOFF)
          {
            LPM3_EXIT;
          }
          else
          {
        	Sleep_command(SLEEP_TIME_AFTER_DATA);
          } */
          
         LPM3_EXIT;
        //UCSCTL6_L |= XT1OFF;

         break;
        case 0x08: break;
        case 0x0A:   //RT1PSIFG
 #if defined(ACCESS_POINT)       
            sync_msg[0]='S';   //Command 'SS' : Start Sampling
		    sync_msg[1]='Y';
		    sync_msg[2]=RTCNT4;
		    sync_msg[3]=RTCNT3;
		    sync_msg[4]=RTCNT2;
		    sync_msg[5]=RTCNT1;
	    
		    for(i=0;i<3;i++)  // 3 attempts to send synch command
		    {
        		if ( SMPL_SUCCESS == SMPL_Send(SMPL_LINKID_USER_UUD, sync_msg, sizeof(sync_msg))) //broadcast message
     		 	{
					  break;
       			}
        	}
        	
        	//UsbSendString(sync_msg,6);
#endif
            break;

    }
    RTCCTL01 &= ~RTCAIFG;
    RTCPS1CTL &= ~RT1PSIFG;
}
