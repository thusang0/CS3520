.data
n:  .word 10

.text
main:
    la   t0, n
    lw   s0, 0(t0)        # s0 = N
    li   s1, 0            # s1 = sum
    li   t1, 1            # t1 = i
loop:
    bgt  t1, s0, done     # inverted test: exit when i > N
    add  s1, s1, t1
    addi t1, t1, 1
    j    loop
done:
    mv   a0, s1
    li   a7, 1
    ecall
    li   a7, 10
    ecall