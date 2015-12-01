//this file was added by Ghaith

#include "bsp_rtc.h"
#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"

void setupRTC(void)
{
   RTCCTL01 &= ~RTCMODE;
    
   RTCNT4=0x00;
   RTCNT3=0x00;
   RTCNT2=0x00;
   RTCNT1=0x00;
    
   RTCCTL01 &= ~RTCHOLD;

   RTCPS0CTL = RT1SSEL_0 + RT1PSDIV_7; //source RT0PS from ACLK
   RTCPS1CTL = RT1SSEL_2 + RT1IP_6 + RT1PSIE; // Source RT1PS from RT0PS  generates an interrupt every 1 sec.

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
	uint8_t  sync_msg[6];

    uint8_t i=0;

    switch (RTCIV)
    {
        case 0x02: break;
        case 0x04: break;
        case 0x08: break;
        case 0x0A:   //RT1PSIFG
        
            sync_msg[0]='a';   //Command 'SS' : Start Sampling
		    sync_msg[1]='a';
		    sync_msg[2]=RTCNT4;
		    sync_msg[3]=RTCNT3;
		    sync_msg[4]=RTCNT2;
		    sync_msg[5]=RTCNT1;
		    
		    for(i=0;i<3;i++)  // 3 attempts to send synch command
		    {
        		if ( SMPL_SUCCESS == SMPL_Bcast( sync_msg, sizeof(sync_msg)))
     		 	{
					  break;
       			}
        	}
        	
        	UsbSendString(sync_msg,6);
            break;

    }
    RTCPS1CTL &= ~RT1PSIFG;
}
