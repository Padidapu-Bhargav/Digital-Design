;hello
;using assembly language for turning LED on


.include "/sdcard/internship/Assembly/m328Pdef.inc"


  ldi r16,0b11111000
  out DDRB,r16
Start:
	in r17,PINB
	in r18,PINB
	in r19,PINB

	in r20,PINB
	in r21,PINB

	in r22,PINB
	in r23,PINB

	lsl r17
	lsl r18
	lsl r18
	lsl r19
	lsl r19
	lsl r19
	and r17,r19
	com r18
        and r17,r18

	lsl r20
	lsl r21
	lsl r21
	lsl r21
	com r20
	com r21
	and r20,r21

	lsl r22
	lsl r22
	lsl r23
	lsl r23
	lsl r23
	com r23
	and r22,r23

	or r17,r20
	or r17,r22


	out PORTB, r17



  rjmp Start
