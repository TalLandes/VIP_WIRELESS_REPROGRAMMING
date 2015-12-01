//----------------------------------------------------------------------------
// Demo Application for SimpliciTI
//
// L. Friedman
// Texas Instruments, Inc.
//----------------------------------------------------------------------------

/**********************************************************************************************
Copyright 2004-2007 Texas Instruments Incorporated. All rights reserved.

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


**************************************************************************************************/

#include "bsp.h"
#include "mrfi.h"
#include "nwk_types.h"
#include "nwk_api.h"
#include "nwk.h"

void halBoardInit(void);
static void linkTo(void);
static void reprogram(void);
static uint8_t sCB(linkID_t);

static volatile uint8_t  sPeerFrameSem = 0;
static volatile uint8_t  BcastMsgSem  = 0;
static  linkID_t sLinkID1 = 0;

#define SPIN_ABOUT_A_SECOND   NWK_DELAY(1000)


const unsigned char * INFOMEM = (unsigned char *) 0x5C7E;
const unsigned char * START_LOC = (unsigned char*) 0x5D32;

const uint16_t image_Addr[6] = {
    0x5c52,	// Address segment0
    0x5c5c,	// Address segment1
    0x5c64,	// Address segment2
    0x5c74,	// Address segment3
    0x5c78,	// Address segment4
    0x5c7e,	// Address segment5
};

const uint8_t image_0[] = {
0x5c,0x5d,
};

const uint8_t image_1[] = {
0xb2,0x5d,0x98,0x5d,
};

const uint8_t image_2[] = {
0x80,0x5c,
};

const uint8_t image_3[] = {
0x7a,0x5d,
};

const uint8_t image_4[] = {
0xcc,0x5d,
};

#define FLASH_UNLOCK    FCTL3 = FWKEY; FCTL1 = FWKEY + WRT;
#define FLASH_LOCK      FCTL1 = FWKEY; FCTL3 = FWKEY +  LOCK;
#define SW_RESET()      PMMCTL0 = PMMPW + PMMSWPOR + (PMMCTL0 & 0x0003);  
int save(uint8_t data, uint32_t offset);
int savev2(uint8_t data, uint32_t offset, uint16_t addr);
void erase(uint16_t address);

typedef struct{
	uint16_t jump_to_app;
	uint16_t reprogram;
}rp_data_t;


rp_data_t* rp_data = (rp_data_t*)0x1900;

void main (void)
{

   if (rp_data->jump_to_app == 1){
   	((void (*)()) START_LOC) ();   	
   }
   BSP_Init();
    
    // keep trying to join until successful. toggle LEDS to indicate that
    // joining has not occurred. LED3 is red but labeled LED 4 on the EXP
    // board silkscreen. LED1 is green.
   while (SMPL_SUCCESS != SMPL_Init(sCB))
   {
    SPIN_ABOUT_A_SECOND;
   }
    
    // unconditional link to AP which is listening due to successful join.
    linkTo();
    
    while (1) ;
    
}



static void linkTo()
{
  uint8_t recvBuf[255];
  uint8_t recvLen;
  addr_t  sAdd;
  bspIState_t intState;


  while (SMPL_SUCCESS != SMPL_Link(&sLinkID1))
  {
    SPIN_ABOUT_A_SECOND;
  }


  SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_AWAKE, 0);
  SMPL_Ioctl( IOCTL_OBJ_RADIO, IOCTL_ACT_RADIO_RXON, 0);

  //enable general interrupts
  __bis_SR_register(GIE);
  
  while(rp_data->reprogram != 1){
  	while (!sPeerFrameSem);
	BSP_ENTER_CRITICAL_SECTION(intState);
    sPeerFrameSem--;
    BSP_EXIT_CRITICAL_SECTION(intState);
	if (SMPL_SUCCESS == SMPL_Receive_Src(sLinkID1, recvBuf, &recvLen, &sAdd, 0, 0, 0)){
		if (recvBuf[0] == 'R' && recvBuf[1] == 'P'){
			erase(0x1900);
			FLASH_UNLOCK;
			rp_data->reprogram = 1;
			FLASH_LOCK;
		}
	}  
  }
  
  
  int i;

  
  reprogram();

}
    
static void reprogram(){
	//receive packet then send ack all we need to do for now
	bspIState_t intState;
	uint8_t recvBuf[255];
	uint8_t recvLen;
	uint8_t ackSize = 7;
	uint8_t ackBuf[10];
	uint32_t offset = 0;
	uint32_t i = 0;
	uint32_t seqNum = 0;
	addr_t sAdd;
	
	ackBuf[0] = 0;
	ackBuf[1] = 0;
	ackBuf[2] = 0;
	ackBuf[3] = 0;
	ackBuf[4] = 'A';
	ackBuf[5] = 'C';
	ackBuf[6] = 'K';
	
	while(SMPL_SUCCESS != SMPL_Send(sLinkID1, ackBuf, ackSize)){
		continue;
	}
	
	uint32_t imageSize;
	uint16_t startAddr;
	
	while (!sPeerFrameSem);
	BSP_ENTER_CRITICAL_SECTION(intState);
    sPeerFrameSem--;
    BSP_EXIT_CRITICAL_SECTION(intState);
    if (SMPL_SUCCESS == SMPL_Receive_Src(sLinkID1, recvBuf, &recvLen, &sAdd, 0, 0, 0)){
    	startAddr = (recvBuf[0] << 8) | recvBuf[1];
    	imageSize = recvBuf[2];
    	imageSize = imageSize << 24;
    	uint32_t temp = recvBuf[3];
    	imageSize |= temp << 16;
    	temp = recvBuf[4];
    	imageSize |= temp << 8;
    	imageSize |= recvBuf[5];
    }
    
    //need to make sure Reprogrammer is not overwritten here
    
    for (i = 0; i < imageSize; i+= 512){
    	erase(startAddr+i);
    }
    
    for(i = 0; i < 2; i++){
		savev2(image_0[i], i, image_Addr[0]);
  	} 
  	for(i = 0; i < 4; i++){
		savev2(image_1[i], i, image_Addr[1]);
  	} 
  	for(i = 0; i < 2; i++){
		savev2(image_2[i], i, image_Addr[2]);
  	} 
  	for(i = 0; i < 2; i++){
		savev2(image_3[i], i, image_Addr[3]);
  	} 
  	for(i = 0; i < 2; i++){
		savev2(image_4[i], i, image_Addr[4]);
  	} 
   
    while(SMPL_SUCCESS != SMPL_Send(sLinkID1, ackBuf, ackSize)){
		continue;
	}
       		  	
	while (1){
		//spin until next packet received;
		while (!sPeerFrameSem);
		BSP_ENTER_CRITICAL_SECTION(intState);
        sPeerFrameSem--;
        BSP_EXIT_CRITICAL_SECTION(intState);
		
		if (SMPL_SUCCESS == SMPL_Receive_Src(sLinkID1, recvBuf, &recvLen, &sAdd, 0, 0, 0)){
		  
		  //there has got to be a better way to do this
		  uint32_t recvSeq = recvBuf[0];
    	  recvSeq = recvSeq << 24;
     	  uint32_t temp = recvBuf[1];
    	  recvSeq |= temp << 16;
    	  temp = recvBuf[2];
    	  recvSeq |= temp << 8;
    	  recvSeq |= recvBuf[3];
		  if (recvSeq != seqNum){
		  	continue;
		  }
		  offset = seqNum * (recvLen - 4);
		 
		  for (i = 0; i < (recvLen - 4); i++){
		  		save(recvBuf[i+4], i+offset);
		  }
		}
		ackBuf[0] = seqNum >> 24;
		ackBuf[1] = (seqNum >> 16) & 0xFF;
		ackBuf[2] = (seqNum >> 8) & 0xFF;
		ackBuf[3] = seqNum & 0xFF;
		
		if (offset + 66 >= imageSize){
			ackBuf[4] = 'F';
			ackBuf[5] = 'I';
			ackBuf[6] = 'N';
		}
		
		while(SMPL_SUCCESS != SMPL_Send(sLinkID1, ackBuf, ackSize)){
			continue;
		}
			
		if (offset + 66 >= imageSize){
			for(i=0;i<3;i++) {
      			if (SMPL_SUCCESS == SMPL_Unlink(sLinkID1)){
      				break;
      			}
  			}
  			erase(0x1900);
  			FLASH_UNLOCK;
			rp_data->jump_to_app = 1;
			FLASH_LOCK;
			SW_RESET();
		}
		
		seqNum++;	
	}

}

static uint8_t sCB(linkID_t lid)
{
  if (lid == sLinkID1) // a unicast message has been received
  {
    sPeerFrameSem++;
    return 0;
  }
  else if(lid == SMPL_LINKID_USER_UUD) //a broadcast message has been received 
  {
  	BcastMsgSem++;
  	return 0;
  }
  return 1;
}

void halBoardInit(void)
{  
  // Tie unused ports
  PAOUT  = 0; PADIR  = 0xFFFF; PASEL  = 0;
  PBOUT  = 0; PBDIR  = 0xFFFF; PBSEL  = 0;
  PCOUT  = 0; PCDIR  = 0xFFFF; PCSEL  = 0;  
  PDOUT  = 0; PDDIR  = 0xFFFF; PDSEL  = 0;  
  // P10.0 to USB RST pin, if enabled with J5
  PEOUT  = 0; PEDIR  = 0xFEFF; PESEL  = 0;  
  P11OUT = 0; P11DIR = 0xFF;   P11SEL = 0;  
  PJOUT  = 0; PJDIR  = 0xFF;
     
  P6OUT = 0x40;                             // Shut down audio output amp
  P5DIR &= ~0x80;                           // USB RX Pin, Input with 
                                            // ...pulled down Resistor
  P5OUT &= ~0x80;
  P5REN |= 0x80;
}

// Save a byte to the information memory
int savev2(uint8_t data, uint32_t offset, uint16_t addr)
{
    char * segment = (char*) addr;
	while(FCTL3 & BUSY);   
    FLASH_UNLOCK;
    segment[offset] = data; // Write byte
    while(FCTL3 & BUSY); // Wait for write to complete
    FLASH_LOCK;
    return offset;
}

int save(uint8_t data, uint32_t offset)
{
    char * segment = (char *) INFOMEM;
	while(FCTL3 & BUSY);   
    FLASH_UNLOCK;
    segment[offset] = data; // Write byte
    while(FCTL3 & BUSY); // Wait for write to complete
    FLASH_LOCK;
    return offset;
}



void erase(uint16_t address){
	uint8_t* Flash_ptr = (uint8_t *) address; 
	while (FCTL3 & BUSY);
	FCTL3 = FWKEY;
	FCTL1 = FWKEY + ERASE;
	*Flash_ptr = 0;
	FCTL1 = FWKEY;
	FCTL3 = FWKEY + LOCK;
	while(FCTL3 & BUSY);
}

