#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>

int main(void){

    //control Register
    DDRB |= 0b00100000;
    
    while(true){
        
        PORTB |= 0b00100000;
        _delay_ms(1000);

        PORTB &= ~0b00100000;
        _delay_ms(1000);
    }
    return 0;
}
