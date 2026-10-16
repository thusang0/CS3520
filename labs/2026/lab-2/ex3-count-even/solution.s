.data
arr: .word 3, 8, 5, 12, 7, 10, 4, 9
n:   .word 8

.text
main:
    la   t0, arr          # t0 = base address
    la   t1, n
    lw   t1, 0(t1)        # t1 = n
    li   s1, 0            # s1 = count
    li   t2, 0            # t2 = i
loop:
    bge  t2, t1, done     # exit when i >= n
    slli t3, t2, 2        # byte offset = i * 4
    add  t3, t0, t3       # address of arr[i]
    lw   t4, 0(t3)
    andi t5, t4, 1        # low bit: 1 = odd
    bnez t5, skip         # odd: don't count
    addi s1, s1, 1
skip:
    addi t2, t2, 1
    j    loop
done:
    mv   a0, s1
    li   a7, 1
    ecall
    li   a7, 10
    ecall