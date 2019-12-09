# Day 2

1. Your input is a list of numbers describing a program. The
   instructions consist of opcodes and some parameters. The opcode 99
   has no parameters and indicates that the end has been reached. The
   opcode 1 means addition and 2 means multiplication. They both take
   three parameters, namely addresses into the same, 0-indexed list:
   the addresses of the two operands and the address of the result.
   The answer is the number in address 0 when the program ends.

What follows is an example input and how it changes with each step.
The arrow is the current execution pointer.

| 0        | 1 | 2  | 3      | 4   | 5 | 6  | 7 | 8    | 9  | 10 | 11 |
|----------|---|----|--------|-----|---|----|---|------|----|----|----|
| → 1      | 9 | 10 | 3      | 2   | 3 | 11 | 0 | 99   | 30 | 40 | 50 |
| 1        | 9 | 10 | **70** | → 2 | 3 | 11 | 0 | 99   | 30 | 40 | 50 |
| **3500** | 9 | 10 | 70     | 2   | 3 | 11 | 0 | → 99 | 30 | 40 | 50 |

2. Search for the values to put in addresses 1 and 2 between 0 and 11
   inclusive, such that the program ends with 3500 at address 0.
   Multiply the value at address 1 by 100 and add the value at address
   2 to get the result. In the example given above, the correct answer
   would be either 910 or 1009 (as the order doesn't matter in this
   particular case).
   
The original second part of the problem involved a program that was
over 100 elements long and was looking for values in the range 0 to 99
inclusive.
