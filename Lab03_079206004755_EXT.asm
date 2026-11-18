# Full name: Nguyen Huu Phuc
# Student ID: 26560088


.data
classA:  .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB:  .word 45, 81, 66, 50, 92, 38, 70, 59
minAMsg: .asciiz "Class A min: "
maxAMsg: .asciiz "Class A max: "
minBMsg: .asciiz "Class B min: "
maxBMsg: .asciiz "Class B max: "
nl:      .asciiz "\n"

.text
.globl main
main:

    la   $a0, classA
    addi $a1, $zero, 10
    jal  min_max             
    add  $s0, $v0, $zero
    add  $s1, $v1, $zero

    la   $a0, minAMsg
    add  $a1, $s0, $zero
    jal  show

    la   $a0, maxAMsg
    add  $a1, $s1, $zero
    jal  show


    la   $a0, classB
    addi $a1, $zero, 8
    jal  min_max                
    add  $s0, $v0, $zero
    add  $s1, $v1, $zero

    la   $a0, minBMsg
    add  $a1, $s0, $zero
    jal  show

    la   $a0, maxBMsg
    add  $a1, $s1, $zero
    jal  show

    li   $v0, 10
    syscall


min_max:
    lw   $v0, 0($a0)           
    lw   $v1, 0($a0)           
    addi $t0, $zero, 1       
mm_loop:
    slt  $t1, $t0, $a1
    beq  $t1, $zero, mm_end
    sll  $t2, $t0, 2
    add  $t2, $t2, $a0
    lw   $t3, 0($t2)            

    slt  $t4, $t3, $v0         
    beq  $t4, $zero, check_max
    add  $v0, $t3, $zero      

check_max:
    slt  $t4, $v1, $t3         
    beq  $t4, $zero, mm_next
    add  $v1, $t3, $zero       

mm_next:
    addi $t0, $t0, 1
    j    mm_loop
mm_end:
    jr   $ra


show:
    li   $v0, 4
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra