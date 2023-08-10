#include <avr/io.h>
#include <util/delay.h>

#define PIN     PB5 // Use the appropriate pin for your AVR model

int main(void) {
  
    DDRB = DDRB |(1 << PIN);

    while (1) {
        PORTB = PORTB | (1 << PIN); //HIGH
        _delay_ms(1000);

        PORTB = PORTB & ~(1 << PIN); //LOW
        _delay_ms(1000);
    }

    return 0;
}
