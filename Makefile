#Compiler opts
CC=avr-gcc
CFLAGS= -Os -DF_CPU=16000000UL -mmcu=atmega328p
TARGET=blink

#compiling
all: blink.out install.$(TARGET)

#detect port of mcu
USBPORT=$(shell ls /dev/ttyACM0)

%.out: %.c
	$(CC) $(CFLAGS) -o $@ $^

%.hex: %.out
	avr-objcopy -O ihex -R .eeprom $^ $@

#upload to board
install.%: %.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P $(USBPORT) -b 115200 -U flash:w:$<

