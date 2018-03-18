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
numGuessTest: .asciz "it took you this many tries: "
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
    mov r6, #3
    str r6, [r5]

WHILEnot:
    ldr r5, addOfCount
    ldr r6, [r5]
    add r6, r6, #1
    str r6, [r5]

    ldr r0, addrOfPrompt
    push {lr}
    bl printf
    pop {lr}

    ldr r0, addrOfFormatStr
    ldr r1, addrOfGuess
    push {lr}
    bl scanf
    pop {lr}
    ldr r1, addrOfGuess
    ldr r2, [r1]

    ldr r5, addrOfRand
    ldr r6, [r5]

    cmp r2, r6
    bne WHILEnot

ldr r0, addrOfYes
push {lr}
bl printf
pop {lr}

ldr r0, addOfNewLine
push {lr}
bl printf
pop {lr}

ldr r0, addOfNumGuessText
push {lr}
bl printf
pop {lr}

ldr r0, addrOfFormatStr 
ldr r5, addOfCount
ldr r1, [r5]
push {lr}
bl printf
pop {lr}

end:
    bx lr

.global printf
.global scanf
@ .global random

addrOfPrompt: .word prompt
addrOfGuess: .word guess
addrOfRand: .word rand
addrOfReturn: .word return
addrOfLow: .word low
addrOfHigh: .word high
addrOfYes: .word yes
addrOfFormatStr: .word formatStr
addOfCount: .word count
addOfNumGuessText: .word numGuessTest
addOfNewLine: .word newline

