# Day 8: Go

## Part 1

You are given a grid of 50x6 pixels and input consisting of the
following commands:

```
rect 3x2
rotate column x=1 by 1
rotate row y=0 by 4
rotate column x=1 by 1
```

Here is some example input:

```
rect 1x5
rotate row y=0 by 3
rotate row y=1 by 3
rotate row y=2 by 3
rotate row y=3 by 3
rotate row y=4 by 3
rotate column x=3 by 1
rect 1x5
rotate column x=0 by 1
rect 2x1
rotate row y=0 by 1
rotate column x=1 by 2
rotate column x=2 by 2
rect 2x1
rotate row y=0 by 1
```

The result:

```
.##...............................................
#..#..............................................
####..............................................
#..#..............................................
#..#..............................................
#..#..............................................
```

## Part 2

The code also helps you solve part 2 which is to type the text shown.
In the example above, that would be "A".
