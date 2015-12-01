#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "unistd.h"                          
#include "fcntl.h"
#include "termios.h"
#include "serial.h"
#include "errno.h"

#define SERIAL_PORT "/dev/mote0"

#define BAUD_RATE B230400

int open_port(){
	int fd;
	static struct termios options;
	
	fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NONBLOCK);
	if(fd == -1){
		printf("Could not open port %s \n",SERIAL_PORT);
		return(fd);
	}
	else{
		fcntl(fd, F_SETFL, 0);
	}	
  tcgetattr(fd, &options); //load current port settings
  cfsetispeed(&options, BAUD_RATE); // Set incoming baud rate 
  cfsetospeed(&options, BAUD_RATE); // Set outgoing baud rate 
  options.c_cflag |= (CLOCAL | CREAD);
  options.c_cflag &= ~PARENB;
  options.c_cflag &= ~CSTOPB;
  options.c_cflag &= ~CSIZE;
  options.c_oflag &= ~ONLCR; /// We do not want this!!!!: Map NL to CR-NL on output
  options.c_iflag &= IGNCR;
  options.c_cflag |= CS8;
  options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
  options.c_cc[VMIN] = 200;
  options.c_cc[VTIME] = 100;
  tcsetattr(fd, TCSANOW, &options);//save port setting	
  printf("opened port %s\n",SERIAL_PORT);  
	return (fd);
}

int tx_data(char* tx_string, int fd, int len){
  int tx_status;
  tx_status = write(fd, tx_string, len);
  if(tx_status < 0)
    printf("failed to send data");
  return (tx_status);
}

int rx_data(char* rx_string, int fd){
  int len = 0;
  char buffer[250];
  len = read(fd,buffer,7);
  memcpy(rx_string, buffer, len);
  return len;
}
