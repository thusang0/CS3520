.data
a:  .word 17
b:  .word 25

.text
main:
    la   t0, a
    lw   s0, 0(t0)        # s0 = a
    la   t0, b
    lw   s1, 0(t0)        # s1 = b
    bge  s0, s1, print    # a >= b: a is already the larger
    mv   s0, s1           # otherwise larger = b
print:
    mv   a0, s0
    li   a7, 1            # print integer
    ecall
    li   a7, 10           # exit
    ecall