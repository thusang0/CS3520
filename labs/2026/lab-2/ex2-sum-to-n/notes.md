Ex2: Sum of the first N integers

Reads N (10) from the '.data' section and computes
1 + 2 + ... + N using a counted loop. Output: '55'.

- 's0': N, loaded from memory
- 's1': running sum (starts at 0)
- 't1': loop counter 'i' (starts at 1)
- 't0': scratch, holds the address of 'n'
- 'a0': value passed to the print ecall; 'a7': ecall number (1 = print int, 10 = exit)

Mirrors the C++ loop 'for (i = 1; i <= n; i++) sum += i'. The C++
test is 'i <= n', but the assembly exits the loop when the opposite is true, so
the branch is 'bgt t1, s0, done' (exit when 'i > N'). Otherwise the body adds 'i'
to the sum, increments 'i', and jumps back to the top of the loop.