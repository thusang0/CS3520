Ex1: Larger of two integers

Loads two integers `a` (17) and `b` (25) from the `.data`
section and prints the larger one. Output: `25`.

- `t0`: scratch, holds the address of each variable in turn
- `s0`: `a`, and afterwards the result (the larger value)
- `s1`: `b`
- `a0`: value passed to the print ecall; `a7`: ecall number (1 = print int, 10 = exit)

 The result starts out as `a`. A single `bge` skips the overwrite
when `a >= b`, so only the "b is larger" case executes the extra `mv`.
This matches the C++ ternary `(a >= b) ? a : b`.
