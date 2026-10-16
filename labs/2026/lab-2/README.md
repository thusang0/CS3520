 Lab 2: Step 2 discussion 

1. Why is the loop test inverted (`bge`, not `i < n`)?

A branch instruction jumps when its condition is true, and otherwise execution
falls through to the next instruction. In the assembly the loop body sits
directly after the test, so falling through means "keep looping". The jump
must therefore be the *exit* path. The C++ condition for staying in the loop is
`i < n`, so the condition for leaving it is the opposite, `i >= n`, which is
`bge t1, a1, done`.

Writing it the C++ way (`blt` to the body) would need a second instruction, an
unconditional jump to the exit, for the not-taken case. The inverted form needs
only one test per iteration, plus the jump back at the bottom of the loop.

The same idea appears inside the loop. The C++ says `if (arr[i] > max)` do the
assignment. The assembly branches *over* the assignment when the opposite holds:
`ble t4, s1, skip`.

2. The pseudo-instructions: what they become, and why they exist

| Pseudo-instruction | Real instruction(s) |
|---|---|
| `li t1, 1` (also `li a7, 4`) | `addi t1, x0, 1`: adds the immediate to the zero register |
| `mv s0, a0` | `addi s0, a0, 0`: adds 0 to copy the value |
| `la a0, array` | `auipc a0, <upper 20 bits>` then `addi a0, a0, <lower 12 bits>`: builds the address relative to the PC (a 32-bit address doesn't fit in one 12-bit immediate) |
| `ble t4, s1, skip` | `bge s1, t4, skip`: the operands are swapped, because RISC-V has `bge` and `blt` but no `ble` |

(`lw a1, n` in `main` is also a pseudo form: the assembler emits an `auipc`
followed by a `lw` using the address of `n`. `beq x0, x0, loop` is an
unconditional jump, since x0 always equals itself, and `jalr x0, ra, 0` is the
return.)

The assembler provides them for the programmer's benefit. RISC-V keeps the real
instruction set small and regular, which keeps the hardware simple. Common
patterns such as "load a constant", "copy a register" and "branch if less or
equal" are built from existing instructions (using `x0` as a constant 0, or
swapping operands), so no extra hardware is needed, while the source stays
readable.

3. Why `find_max` saves `s1` but not `ra`

`s1`: it is a callee-saved register, so the caller (`main`) is entitled to
assume `s1` has the same value after the call as before it. `find_max` uses
`s1` for the running maximum, which would overwrite the caller's value, so it
pushes `s1` on the stack on entry (`addi sp, sp, -4` and `sw s1, 0(sp)`) and
restores it before returning (`lw s1, 0(sp)` and `addi sp, sp, 4`). Saving it
is the callee's responsibility.

`ra`: `main` sets `ra` with `jal` when it calls `find_max`. `ra` only gets
destroyed if the procedure makes a call of its own, because that would
overwrite it with a new return address. `find_max` calls nothing (it is a leaf
procedure), so `ra` still holds the return address when it reaches
`jalr x0, ra, 0`. Saving it would cost two extra memory accesses for no benefit.

The other registers it uses (`t1` to `t4`, `a0`, `a1`) are caller-saved
(temporaries and arguments), so the caller can't expect them to survive the
call and `find_max` needn't preserve them.