/*----------------------------------------------
/
/	Author:		Beau Shirdavani
/	Date:		March 6, 2018
/	Description:	CS 351
/			HW 03 part 1
/			nested loop with ARM - v2
/
/----------------------------------------------*/

/* Data Section */
.data
guess: .word 0
rand: .word 0
return: .word 0
count: .word 0
prompt: .asciz "guess random number (3):"
low: .asciz "too low...guess again"
high: .asciz "too high...guess again"
yes: .asciz "CORRECT!"
formatStr: .asciz "%d"
newline: .asciz "\n"

/* Code Section */
.text
.global main
main:
	ldr r1, addrOfReturn
	str lr, [r1]

    ldr r5, addrOfRand
    ldr r6, [r5]
    ldr r0, addrOfPrompt
    push {lr}
    bl printf
    pop {lr}



end:
    bx lr

.global printf
.global scanf
@ .global rand()

addrOfPrompt: .word prompt
addrOfGuess: .word guess
addrOfRand: .word rand
addrOfReturn: .word return
addrOfLow: .word low
addrOfHigh: .word high
addrOfYes: .word yes
addrOfFormatStr: .word formatStr
addOfCount: .word count

