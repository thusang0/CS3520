Ex4: Factorial as a procedure

 'main' loads N (5) from the '.data' section, calls a
'factorial' procedure, and prints the value it returns. Output: '120'.

- 'a0': argument N going in, and the return value coming out
- 's1': running product inside 'factorial' (starts at 1)
- 'ra': return address, set by 'jal' in 'main', used by 'jr ra' to return
- 'sp': stack pointer, used to save and restore 's1'
- 't0': scratch in 'main', holds the address of 'n'
- 'a7':+ ecall number (1 = print int, 10 = exit)

- 'main' puts the argument in 'a0' and calls with 'jal ra, factorial'.
- 'factorial' returns its result in 'a0' and goes back with 'jr ra'
  ('jalr x0, 0(ra)').

- 's1' is a callee-saved register, so 'factorial' must give it back unchanged.
  It pushes 's1' on entry ('addi sp, sp, -4' then 'sw') and pops it before
  returning ('lw' then 'addi sp, sp, 4').
- 'ra' is not saved because 'factorial' is a leaf procedure: it makes no calls,
  so nothing overwrites 'ra'.
- 'main' does not need to preserve 'ra' either, because it ends with an exit
  ecall instead of returning.

Mirrors the C++ loop 'while (n > 0) { result *= n; n--; }'. The
exit test is 'ble a0, zero, fdone' (leave when n <= 0), which also makes
'factorial(0)' return 1. 'mul' needs the M extension, which Ripes' default
RV32IM processor provides.