/*----------------------------------------------------------------------------
 *  Demo Application for SimpliciTI
 *
 *  L. Friedman
 *  Texas Instruments, Inc.
 *----------------------------------------------------------------------------
 */

/**********************************************************************************************
  Copyright 2007-2009 Texas Instruments Incorporated. All rights reserved.

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
C:\Users\Ghaith\Desktop\eStadium\Wireless\SimpliciTI-CCS-1.1.0-F543x\
Projects\Examples\EXP543x\AP_as_Data_Hub\CCE\Project\Components\bsp\bsp_rtc.h

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
#include <stdio.h>


#include "usb.h"
#include "bsp.h"
#include "mrfi.h"
#include "bsp_leds.h"
#include "bsp_buttons.h"
#include "bsp_rtc.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk_frame.h"
#include "nwk.h"


#include "app_remap_led.h"


//extern volatile char UsbReceiveBuffer[255];
void toggleLED(uint8_t);

extern volatile char UsbReceiveBuffer[255];
extern volatile uint8_t BufferSize;

/**************************** COMMENTS ON ASYNC LISTEN APPLICATION ***********************
Summary:
  This AP build includes implementation of an unknown number of end device peers in
  addition to AP functionality. In this scenario all End Devices establish a link to
  the AP and only to the AP. The AP acts as a data hub. All End Device peers are on
  the AP and not on other distinct ED platforms.

  There is still a limit to the number of peers supported on the AP that is defined
  by the macro NUM_CONNECTIONS. The AP will support NUM_CONNECTIONS or fewer peers
  but the exact number does not need to be known at build time.

  In this special but common scenario SimpliciTI restricts each End Device object to a
  single connection to the AP. If multiple logical connections are required these must
  be accommodated by supporting contexts in the application payload itself.

Solution overview:
  When a new peer connection is required the AP main loop must be notified. In essence
  the main loop polls a semaphore to know whether to begin listening for a peer Link
  request from a new End Device. There are two solutions: automatic notification and
  external notification. The only difference between the automatic notification
  solution and the external notification solution is how the listen semaphore is
  set. In the external notification solution the sempahore is set by the user when the
  AP is stimulated for example by a button press or a commend over a serial link. In the
  automatic scheme the notification is accomplished as a side effect of a new End Device
  joining.

  The Rx callback must be implemented. When the callback is invoked with a non-zero
  Link ID the handler could set a semaphore that alerts the main work loop that a
  SMPL_Receive() can be executed successfully on that Link ID.

  If the callback conveys an argument (LinkID) of 0 then a new device has joined the
  network. A SMPL_LinkListen() should be executed.

  Whether the joining device supports ED objects is indirectly inferred on the joining
  device from the setting of the NUM_CONNECTIONS macro. The value of this macro should
  be non-zero only if ED objects exist on the device. This macro is always non-zero
  for ED-only devices. But Range Extenders may or may not support ED objects. The macro
  should be be set to 0 for REs that do not also support ED objects. This prevents the
  Access Point from reserving resources for a joinng device that does not support any
  End Device Objects and it prevents the AP from executing a SMPL_LinkListen(). The
  Access Point will not ever see a Link frame if the joining device does not support
  any connections.

  Each joining device must execute a SMPL_Link() after receiving the join reply from the
  Access Point. The Access Point will be listening.

*************************** END COMMENTS ON ASYNC LISTEN APPLICATION ********************/

/************  THIS SOURCE FILE REPRESENTS THE AUTOMATIC NOTIFICATION SOLUTION ************/

/* reserve space for the maximum possible peer Link IDs */


static linkID_t sLIDtemp =0;
volatile linkID_t sLID[NUM_CONNECTIONS];
volatile uint8_t AppConnState[NUM_CONNECTIONS];

//static uint8_t  sNumCurrentPeers = 0;

/* callback handler */
static uint8_t sCB(linkID_t);

/* received message handler */  // modified by ghaith
static void processMessage(linkID_t lid, uint8_t *msg, uint8_t len, addr_t *sAdd, rssi_t *rssi, uint8_t* lqi, uint8_t* tractID,uint8_t* ts);

/* Frequency Agility helper functions */
static void    checkChangeChannel(void);
static void    changeChannel(void);

/* Source Address from received packet */
static addr_t sAdd;   //added by Ghaith
//Port number of received packet
//static uint8_t sPort;  //added by Ghaith

//RSSI and LQI of received frame
static rssi_t rcRSSI; //RSSI of received packet ...added by Ghaith
static uint8_t rcLQI; //LQI of received packet ...added by Ghaith

//Transaction ID
static uint8_t tractID;   // added by Ghaith
uint8_t CMTS[4];

/* work loop semaphores */
static volatile uint8_t sPeerFrameSem = 0;
static volatile uint8_t sJoinSem = 0;
static volatile uint8_t collectData = 0;

/* wireless reprogramming */
#define WIRELESS_REPROGRAM 1

#ifdef WIRELESS_REPROGRAM
uint8_t currReprogramming = 0;
uint8_t payloadSize = 70;
linkID_t destED = 0;
uint8_t initPayloadSize = 4; 
uint8_t destAddr[4] = {0x00, 0x00, 0x00, 0x00};
#endif

//#ifdef FREQUENCY_AGILITY
//
///*     ************** BEGIN interference detection support */
//
//#define INTERFERNCE_THRESHOLD_DBM (-70)
//#define SSIZE    25
//#define IN_A_ROW  3
//static int8_t  sSample[SSIZE];
//#endif  /* FREQUENCY_AGILITY */

/* blink LEDs when channel changes... */
static volatile uint8_t sBlinky = 0;

/*     ************** END interference detection support                       */

#define SPIN_ABOUT_A_QUARTER_SECOND   NWK_DELAY(250)
#define DATA_TIME 4 //Number of hours to collect data

void main (void)
{ 
  uint8_t  cmd[4]; //command IDs are two bytes in length
  char ch; 
  
  bspIState_t intState;
  unsigned short i=0;
  uint8_t linkIdx= 0;
//#ifdef FREQUENCY_AGILITY
// memset(sSample, 0x0, sizeof(sSample));  //  from string.h
//#endif  /* FREQUENCY_AGILITY */

  BSP_Init();

  UsbInit(); //initialize usb (serial communication)
  
  
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


  SMPL_Init(sCB);

  /* green and red LEDs on solid to indicate waiting for a Join. */
  if (!BSP_LED2_IS_ON())
  {
    toggleLED(2);
  }
  if (!BSP_LED1_IS_ON())
  {
    toggleLED(1);
  }
  
  setupRTC(); //setup Real Time Clock for Synchronization
  
  for(linkIdx =0; linkIdx<NUM_CONNECTIONS; linkIdx++)
  {
    AppConnState[linkIdx] = CONNSTATE_FREE;
    sLID[linkIdx] = 0;
  }
   
  /* main work loop */
  while (1)
  {
    /* Wait for the Join semaphore to be set by the receipt of a Join frame from a
     * device that supports an End Device.
     *
     * An external method could be used as well. A button press could be connected
     * to an ISR and the ISR could set a semaphore that is checked by a function
     * call here, or a command shell running in support of a serial connection
     * could set a semaphore that is checked by a function call.
     */
    if (sJoinSem)// && (sNumCurrentPeers < NUM_CONNECTIONS))
    {
    	
    	for(linkIdx =0; linkIdx<NUM_CONNECTIONS; linkIdx++)
    	{
    		if(AppConnState[linkIdx] == CONNSTATE_FREE)
    		break;
    	}
    	
      /* listen for a new connection */
      while (1)
      {
      	
        if (SMPL_SUCCESS == SMPL_LinkListen(&sLIDtemp))
        {
        	
        	sLID[linkIdx] = sLIDtemp;
        	AppConnState[linkIdx] = CONNSTATE_CONNECTED;
        	
#ifdef WIRELESS_REPROGRAM
		  if (currReprogramming){
    		connInfo_t *pCInfo = nwk_getConnInfo(sLIDtemp);
    		if (destAddr[0] == pCInfo->peerAddr[0] && destAddr[1] == pCInfo->peerAddr[1] && 
    			destAddr[2] == pCInfo->peerAddr[2] && destAddr[3] == pCInfo->peerAddr[3] ) {
    				destED = sLIDtemp;
    				break;
    		}
		  }
#endif
        	
#ifdef SLEEP_CYCLE         	
          if(collectData)
#endif          
          {
		    cmd[0]='S';   //Command 'SS' : Start Sampling
		    cmd[1]='S';
		    //cmd[2] = 4;
		    
		    for(i=0;i<3;i++)  // 3 attempts to send command
		    {
              if (SMPL_SUCCESS == SMPL_Send(sLID[linkIdx], cmd, 2))
     		  {
		   	    break;
       		  }
        	}
        	break;
          }
#ifdef SLEEP_CYCLE           
          else
          {
          	
          	cmd[0]='S';   //Command 'SS' : Start Sampling
		    cmd[1]='L';
		    cmd[2] = 1;   //0x00; Sleep hours
		    cmd[3] = 0;   //0x02; Sleep mins
		    
		    //cmd[2] = 0x00;
		   // cmd[3] = 0x05;
		    
		    for(i=0;i<3;i++)  // 3 attempts to send command
		    {
              if (SMPL_SUCCESS == SMPL_Send(sLID[linkIdx], cmd, 4))
     		  {
		   	    break;
       		  }
        	}
        	
        	
        	break;
          }
#endif          
        }
        /* Implement fail-to-link policy here. otherwise, listen again. */
      }

      //sNumCurrentPeers++;//increment the number of connected peers
      //if(sNumCurrentPeers == NUM_CONNECTIONS) sNumCurrentPeers = 0; //<?>


      BSP_ENTER_CRITICAL_SECTION(intState);
      sJoinSem--;
      BSP_EXIT_CRITICAL_SECTION(intState);
      //// This is a new device that just linked send it a command to start sampling
      
    }

    /* Have we received a frame on one of the ED connections?
     * No critical section -- it doesn't really matter much if we miss a poll
     */
    if (sPeerFrameSem)
    {
      uint8_t  msg[MAX_APP_PAYLOAD], len, i;
	 
      /* process all frames waiting */
      //for (i=0; i<sNumCurrentPeers; ++i)
      for (i=0; i<NUM_CONNECTIONS && AppConnState[i] == CONNSTATE_CONNECTED; ++i) 
      {
        if (SMPL_SUCCESS == SMPL_Receive_Src(sLID[i], msg, &len, &sAdd, &rcRSSI, &rcLQI, &tractID))
        {
         	#ifdef WIRELESS_REPROGRAM
         	//Send ACK to Clusterhead
         	uint8_t msg_buf[MAX_APP_PAYLOAD];
         	memcpy(msg_buf, msg, len);
         	if (currReprogramming && destED == sLID[i]){
         		if (msg_buf[4] == 'F' && msg_buf[5] == 'I' && msg_buf[6] == 'N'){
         			currReprogramming = 0;
         		}
         		UsbSendString(msg_buf,len);
         		BSP_ENTER_CRITICAL_SECTION(intState);
         		sPeerFrameSem--;
         		BSP_EXIT_CRITICAL_SECTION(intState);
         		continue;
         	}
         	#endif
         	
        	CMTS[0] = RTCNT4;//read the real time clock at this point 
		 	CMTS[1] = RTCNT3;
	     	CMTS[2] = RTCNT2;
		 	CMTS[3] = RTCNT1;
		  
         	processMessage(sLID[i], msg, len, &sAdd, &rcRSSI, &rcLQI, &tractID,CMTS);
         
         	//checkChangeChannel();
         	BSP_ENTER_CRITICAL_SECTION(intState);
         	sPeerFrameSem--;
         	BSP_EXIT_CRITICAL_SECTION(intState);
        }
      }
    }
    
    
   /* 
    while(BufferSize > 0)
    {
    	ch = UsbReceiveBuffer[BufferSize-1];
    	
    	BSP_ENTER_CRITICAL_SECTION(intState);
        BufferSize--;
    	BSP_EXIT_CRITICAL_SECTION(intState);
    	
    	if(ch == 'e')
    	collectData = 1;
    	if(ch == 'd')
    	collectData = 0;
    }*/
#ifdef WIRELESS_REPROGRAM

	if (BufferSize == initPayloadSize && !currReprogramming){	
		uint8_t recvBuf[50];
		uint8_t j, i;
		/*TODO: Check if link is connected before comparing */
		for (i = 0; i < 4; i++){
			destAddr[i] = UsbReceiveBuffer[i];
		}
    	for(j =0; j < NUM_CONNECTIONS; j++) {
    		connInfo_t *pCInfo = nwk_getConnInfo(j);
    		if (destAddr[0] == pCInfo->peerAddr[0] && destAddr[1] == pCInfo->peerAddr[1] && 
    			destAddr[2] == pCInfo->peerAddr[2] && destAddr[3] == pCInfo->peerAddr[3] ) {
    				destED = j;
    						
    				//Send packet to initialize reprogramming in ED
    				recvBuf[0] = 'R';
    				recvBuf[1] = 'P';
   					for(i=0;i<3;i++){
   						if (SMPL_SUCCESS == SMPL_Send(destED, recvBuf, 2)){
     						currReprogramming = 1;
							break;
       					}
       				}
    				break;
    			}	
    	}
    	if (!currReprogramming) {
    		char buf[100];
    		snprintf(buf, 100, "Failed to connect to ED at address 0x %x %x %x %x\n",
    		 		UsbReceiveBuffer[0], UsbReceiveBuffer[1], UsbReceiveBuffer[2], 
    		 		UsbReceiveBuffer[3]); 
        	UsbSendString((uint8_t*)buf, strlen(buf));
        }
        BSP_ENTER_CRITICAL_SECTION(intState);
     	BufferSize = 0;
     	BSP_EXIT_CRITICAL_SECTION(intState); 		
	}
	
	
    if (BufferSize == payloadSize && currReprogramming) {

 		uint8_t i;
 		uint8_t recvBuf[255];
 		
 		// Is this necesarry? (copy could be waste of time)
		for (i = 0; i < payloadSize; i++){
			recvBuf[i] = UsbReceiveBuffer[i];
   		}

   		for (i = 0; i < 3; i++){
  	    	if (SMPL_SUCCESS == SMPL_Send(destED, recvBuf, payloadSize)){
       			break;
   			}
   		}
   		
   		BSP_ENTER_CRITICAL_SECTION(intState);
   		BufferSize = 0;
   		BSP_EXIT_CRITICAL_SECTION(intState); 
    }
#endif
    
#ifdef SLEEP_CYCLE     
    if (BSP_BUTTON1())
    {
      collectData = 1;  
    }
    
    if (BSP_BUTTON2())
    {
      collectData = 0;  
    }
#endif    
//    if (BSP_BUTTON1())
//    {
//      SPIN_ABOUT_A_QUARTER_SECOND;  /* debounce */
//      changeChannel();
//    }
//    else
//    {
//      checkChangeChannel();
//    }
    
    BSP_ENTER_CRITICAL_SECTION(intState);
    if (sBlinky)
    {
      if (++sBlinky >= 0xF)
      {
        sBlinky = 1;
        toggleLED(1);
        toggleLED(2);
      }
    }
    BSP_EXIT_CRITICAL_SECTION(intState);
    
  }
  
}


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

/* Runs in ISR context. Reading the frame should be done in the */
/* application thread not in the ISR thread. */
static uint8_t sCB(linkID_t lid)
{
  if (lid)
  {
    sPeerFrameSem++;
    sBlinky = 0;
  }
  else
  {
    sJoinSem++;
  }
  /* leave frame to be read by application. */
  return 0;
}

static void processMessage(linkID_t lid, uint8_t *msg, uint8_t len, addr_t *sAdd, rssi_t *rssi, uint8_t* lqi, uint8_t *tractid,uint8_t* ts)
{
  
  /* do something useful */
  if (len)
  {
   //UsbSendChar('a');
   UsbSendChar(rssi[0]);
   //UsbSendChar(lqi[0]);
   
  if(sAdd)
  UsbSendString(sAdd->addr,4);
   
  UsbSendChar(tractid[0]);  
  UsbSendChar(ts[0]);  
  UsbSendChar(ts[1]);
  UsbSendChar(ts[2]);
  UsbSendChar(ts[3]);
  
  UsbSendChar(len);
   
  if(len>1)
  UsbSendString(msg,len); 


  //  toggleLED(*msg);
  //  *msg |= NWK_APP_REPLY_BIT;
#ifdef FREQUENCY_AGILITY
    /* send ack frame... */
    SMPL_Send(lid, msg, len);
#endif
  }
  return;
}

static void changeChannel(void)
{
#ifdef FREQUENCY_AGILITY
  freqEntry_t freq;

  if (++sChannel >= NWK_FREQ_TBL_SIZE)
  {
    sChannel = 0;
  }
  freq.logicalChan = sChannel;
  SMPL_Ioctl(IOCTL_OBJ_FREQ, IOCTL_ACT_SET, &freq);
  BSP_TURN_OFF_LED1();
  BSP_TURN_OFF_LED2();
  sBlinky = 1;
#endif
  return;
}

/* implement auto-channel-change policy here... */
static void  checkChangeChannel(void)
{
#ifdef FREQUENCY_AGILITY
  int8_t dbm, inARow = 0;

  uint8_t i;

  memset(sSample, 0x0, SSIZE);
  for (i=0; i<SSIZE; ++i)
  {
    /* quit if we need to service an app frame */
    if (sPeerFrameSem || sJoinSem)
    {
      return;
    }
    NWK_DELAY(1);
    SMPL_Ioctl(IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RSSI, (void *)&dbm);
    sSample[i] = dbm;
    if (dbm > INTERFERNCE_THRESHOLD_DBM)
    {
      if (++inARow == IN_A_ROW)
      {
        changeChannel();
        break;
      }
    }
    else
    {
      inARow = 0;
    }
  }
#endif
  return;
}

