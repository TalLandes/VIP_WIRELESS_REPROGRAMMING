#ifndef SERIAL_H
#define SERIAL_H

int open_port(void);
int tx_data(char *, int, int);
int rx_data(char*, int);

#endif
