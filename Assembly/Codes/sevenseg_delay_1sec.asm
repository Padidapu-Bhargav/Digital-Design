;using assembly language for 
;displaying number on
;seven segment display
;.global delay
.include "/sdcard/internship/Assembly/m328Pdef.inc"

;DDRD is used to define whether the pin in a port is output or input
;1 for output and 0 for input
Start: 

;Configuring pins 0-7 (PD2-PD7) of Arduino as output
  ldi r16,0b11111111
  out DDRD,r16

;seven segment display
  ldi r17,0b01111001; display 1
  out PortD,r17
  call wait  ; call for delay of 1 sec
  
  ldi r17,0b01111111; display nothing
  out PortD,r17
  call wait  ; call for delay of 1 sec

  ldi r17,0b01000000;display zero
  out PortD,r17
  call wait  ; call for delay of 1 sec

	
  ldi r17,0b01111111; display nothing
  out PortD,r17
  call wait  ; call for delay of 1 sec


  ldi r17,0b01000000;display 0
  out PortD,r17
  call wait  ; call for delay of 1 sec


  ldi r17,0b01111111;display nothing
  out PortD,r17
  call wait ; call for delay of 1 sec

  ldi r17,0b00110000;display 3
  out PortD,r17
  call wait  ; call for delay of 1 sec

  rjmp Start

; used for 1 second delay 
;extracted from gadepall/digital design/assembly/sevenseg/timer/count_delay

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


