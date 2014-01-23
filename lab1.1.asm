.data 0x10000000
msg1:       .asciiz "Please enter an integer number: "
            .text
            .globl main
# Inside main there are some calls (syscall) which will change the
# value in $31 ($ra) which initially contains the return address
# from main. This needs to be saved.
main:       addu $s0, $ra, $0
            li $v0, 4
            la $a0, msg1
            syscall
# now get an integer from the user
            li $v0, 5
# save $31 in $16
# system call for print_str
# address of string to print
# system call for read_int
# the integer placed in $v0
            syscall
# do some computation here with the number
            addu $t0, $v0, $0
            sll $t0, $t0, 2
# print the result
            li $v0, 1
            addu $a0, $t0, $0
            syscall
# move the number in $t0 # last digit of your SSN instead of 2
# system call for print_int
# move number to print in $a0
# restore now the return address in $ra and return from main
            addu $ra, $0, $s0       # return address back in $31
            jr $ra                  # return from main
