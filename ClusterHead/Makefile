CC=gcc
CFLAGS=-I. -lrt
DEPS = serial.h
OBJ = reprogram.o serial.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

reprogram: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)

clean:
	rm -f reprogram.o reprogram serial.o

