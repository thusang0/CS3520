.data
n:  .word 5

.text
main:
    la   t0, n
    lw   a0, 0(t0)        # argument in a0
    jal  ra, factorial    # call; return value comes back in a0
    li   a7, 1            # print result
    ecall
    li   a7, 10
    ecall

factorial:
    addi sp, sp, -4       # s1 is callee-saved, so preserve it
    sw   s1, 0(sp)
    li   s1, 1            # s1 = result
fl:
    ble  a0, zero, fdone  # exit when n <= 0
    mul  s1, s1, a0
    addi a0, a0, -1
    j    fl
fdone:
    mv   a0, s1           # return value in a0
    lw   s1, 0(sp)        # restore s1
    addi sp, sp, 4
    jr   ra               # return (jalr x0, 0(ra))