#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <math.h>
#include "serial.h"
#include "ED.h"

uint8_t sendBuf[70];
uint8_t recvBuf[70];
uint32_t IMAGE_SIZE;

#define ACK_SIZE 5
#define PAYLOAD_SIZE 66
#define PACKET_SIZE 70
#define INIT_PACKET_SIZE 4
#define INFO_PACKET_SIZE 6

int main(){
	int fd = open_port();
	uint32_t i = 0;
	uint8_t done = 0;
	uint32_t offset = 0;
	uint32_t seqNum = 0;


	//Send first packet to initialize reprogramming state
	sendBuf[0] = 0x44;
	sendBuf[1] = 0x55;
	sendBuf[2] = 0xAA;
	sendBuf[3] = 0xAA;	
	tx_data(sendBuf, fd, INIT_PACKET_SIZE);

	//Wait for ACK	
	rx_data(recvBuf, fd);
	if (recvBuf[4] != 'A' || recvBuf[5] != 'C' || recvBuf[6] != 'K'){
		printf("Link failed \n");
		return;	
	}

	//Second packet contains reprogramming info
	uint16_t startAddr = image_Addr[5];
	IMAGE_SIZE = image_Size[5];
	sendBuf[0] = startAddr >> 8;
	sendBuf[1] = startAddr & 0xFF;
	sendBuf[2] = IMAGE_SIZE >> 24;
	sendBuf[3] = (IMAGE_SIZE >> 16)	& 0xFF;
	sendBuf[4] = (IMAGE_SIZE >> 8) & 0xFF;
	sendBuf[5] =  IMAGE_SIZE & 0xFF;

	//Add padding to rest of info packet	
	for (i = 6; i < PACKET_SIZE; i++){
		sendBuf[i] = 0xFF;
	}
	tx_data(sendBuf, fd, PACKET_SIZE);

	//Wait for ACK
	rx_data(recvBuf, fd);
	if (recvBuf[4] != 'A' || recvBuf[5] != 'C' || recvBuf[6] != 'K'){
		printf("Info Packet failed \n");
		return;	
	}
	
	while (!done){
		sendBuf[0] = seqNum >> 24;
		sendBuf[1] = (seqNum >> 16) & 0xFF;
		sendBuf[2] = (seqNum >> 8) & 0xFF;
		sendBuf[3] = seqNum & 0xFF;

		offset = PAYLOAD_SIZE * seqNum;
		for (i = 0; i < PAYLOAD_SIZE; i++){
			if (i+offset >= IMAGE_SIZE){
				done = 1;
				sendBuf[i+4] = 0xFF;			
			}
			else{
				unsigned int val = i + offset;
				sendBuf[i+4] = image_5[val];
			}	
		}		
		tx_data(sendBuf, fd, PACKET_SIZE);

		rx_data(recvBuf, fd);

		uint32_t recvSeq = (recvBuf[0] << 24) | (recvBuf[1] << 16) | (recvBuf[2] << 8) | recvBuf[3];
		if (recvSeq == seqNum && recvBuf[4] == 'A' && recvBuf[5] == 'C' && recvBuf[6] == 'K'){
			printf("ACK %d Received\n", seqNum);
			fflush(stdout);
		}
		else{
			printf("Bad ACK expected: %d, received %d \n", seqNum, recvSeq);
			return;		
		}

		seqNum++;

		//sleep for 0.1 second	
		usleep(100000);

	}
	printf ("Succesfully Sent Image!\n");

	
}

