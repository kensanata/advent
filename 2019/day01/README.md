# Day 1

1. Read the numbers ("mass") in the data file. For each one compute a
   number ("fuel") as follows: divide by three, round down, subtract
   2. Add them all up. The correct answer for the given data file is
   656 (14/3-2 is 2, 1969/3-2 is 654).

2. The same as before, but recursively, ignoring negative results
   ("add the fuel to transport the fuel"). The correct answer for the
   given data file is 968 (14/3-2 is 2, 2/3-2 is less than 0, 1969/3-2
   is 654, 654/3-2 is 216, 216/3-2 is 70, 70/3-2 is 21, 21/3-2 is 5,
   5/3-2 is less than 0).

The solutions in this directory use
[Racket](https://racket-lang.org/).
