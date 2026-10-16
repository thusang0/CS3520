Ex5: Greatest common divisor (Euclid's algorithm)

'main' loads two integers, 48 and 18, from the '.data'
section, calls a 'gcd' procedure, and prints the result. Output: '6'.

- 'a0': first argument 'a'; it also holds the result when the procedure returns
- 'a1': second argument 'b'
- 'ra': return address, set by 'jal' in 'main', used by 'jr ra' to return
- 't0': scratch in 'main', holds the address of each variable
- 'a7': ecall number (1 = print int, 10 = exit)

- 'main' puts the two arguments in 'a0' and 'a1' and calls with 'jal ra, gcd'.
- 'gcd' leaves the answer in 'a0' and goes back with 'jr ra'.

None. 'gcd' is a leaf procedure that only touches 'a0' and 'a1',
which are argument registers the caller does not expect to survive the call. It
uses no 's' registers, so there is nothing to save, and it makes no calls, so
'ra' is never overwritten.

Euclid by repeated subtraction, mirroring the C++ model:
- 'beq a0, a1, gdone': when 'a == b`, that value is the GCD.
- 'blt a0, a1, gless': when 'a < b', subtract 'a' from 'b'.
- otherwise 'a > b', so subtract 'b' from 'a'.
- Then jump back and repeat.
It uses subtraction instead of 'rem', so it doesn't depend on the M extension.
It only terminates for positive inputs: if either value were 0, the
subtraction would never make 'a' and 'b' equal and the loop would run forever.