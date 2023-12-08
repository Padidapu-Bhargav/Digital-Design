;using assembly language for 
;displaying number on
;seven segment display
;.global delay
.include "/sdcard/internship/Assembly/m328Pdef.inc"

Start: 
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
  call wait
  
  ldi r17,0b01111111;dummy
  out PortD,r17
  call wait

  ldi r17,0b01000000;0
  out PortD,r17
  call wait

	
  ldi r17,0b01111111;dummy
  out PortD,r17
  call wait


  ldi r17,0b01000000;0
  out PortD,r17
  call wait


  ldi r17,0b01111111;dummy
  out PortD,r17
  call wait

  ldi r17,0b00110000;3
  out PortD,r17
  call wait
  rjmp Start

wait:
  push r16
  push r17
 push r18
 ldi r16,0x50
 ldi r17,0x00
 ldi r18,0x00

w0:
 dec r18
 brne w0
 dec r17
  brne w0
  dec r16
 brne w0
 pop r16
 pop r17
  pop r16
  ret

;delay:
;  ldi r16,0b10000000
;  ldi r18,0b00000001
; sub r16,r18
;  cp r16,0b00000000
;  brne delay
 ; ret 
