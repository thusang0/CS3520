.data
x:  .word 48
y:  .word 18

.text
main:
    la   t0, x
    lw   a0, 0(t0)
    la   t0, y
    lw   a1, 0(t0)
    jal  ra, gcd
    li   a7, 1
    ecall
    li   a7, 10
    ecall

gcd:                          # leaf procedure: uses only a0, a1
gloop:
    beq  a0, a1, gdone
    blt  a0, a1, gless
    sub  a0, a0, a1           # a > b
    j    gloop
gless:
    sub  a1, a1, a0           # b > a
    j    gloop
gdone:
    jr   ra                   # result already in a0