;using assembly language for 
;displaying number on
;seven segment display
;.global delay
.include "/sdcard/internship/Assembly/m328Pdef.inc"

  
;Configuring pins 2-7 (PD2-PD7) of Arduino
;as output
  ldi r16,0b11111111
  out DDRD,r16
;Configuring pin 8 (PB0) of Arduino
;as output 

;Writing the number 2 on the 
;seven segment display
  ldi r17,0b01111001;1
  out PortD,r17
  rjmp delay
  
  ldi r17,0b01000000;0
  out PortD,r17
  rjmp delay

  ldi r17,0b01000000;0
  out PortD,r17
  rjmp delay

Start:
  rjmp Start

delay:
  ldi r18,1000
  rjmp delay_loop
  ret

delay_loop:
  dec r18
  brne delay_loop
  ret 
