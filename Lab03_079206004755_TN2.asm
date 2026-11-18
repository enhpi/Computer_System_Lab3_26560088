# Full name: Nguyen Huu Phuc
# Student ID: 26560088

.text
.globl main
main:
    li   $v0, 5                 
    syscall
    add  $a0, $v0, $zero        
    addi $a1, $zero, 0         
    addi $a2, $zero, 100        
    jal  clamp
    add  $a0, $v0, $zero       
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall


clamp:
    slt  $t0, $a0, $a1          
    beq  $t0, $zero, check_hi   
    add  $v0, $a1, $zero        
    jr   $ra
check_hi:
    slt  $t0, $a2, $a0          
    beq  $t0, $zero, in_range  
    add  $v0, $a2, $zero
    jr   $ra
in_range:
    add  $v0, $a0, $zero      
    jr   $ra