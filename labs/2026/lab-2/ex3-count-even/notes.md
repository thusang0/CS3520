Ex3: Count the even elements of an array

Walks through an 8-element array in the '.data' section and
counts how many elements are even. Output: '4' (the evens are 8, 12, 10, 4).


- 't0': base address of 'arr'
- 't1': 'n', the number of elements
- 't2': loop index 'i'
- 't3': byte offset, then the address of 'arr[i]'
- 't4': the current element 'arr[i]'
- 't5': result of the bit test ('arr[i] & 1')
- 's1': the running count of even elements
- 'a0' / 'a7': print ecall argument and ecall number (1 = print int, 10 = exit)

- Loop test is inverted from the C++ ('i < n' becomes 'bge t2, t1, done').
- Array indexing: each element is a 4-byte word, so the address of 'arr[i]' is
  'base + i*4'. 'slli t3, t2, 2' computes 'i*4' (shift left by 2).
- Even test: 'andi t5, t4, 1' isolates the lowest bit. A number is even when
  that bit is 0, so 'bnez' skips the increment for odd numbers.