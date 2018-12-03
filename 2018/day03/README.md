# Day 3

## First Part

The input is a list of items with an id, coordinates, and dimensions.
Example:

```
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
```

Some of these rectangles overlap. What area has overlap? Given the
example above, here's an image:

```
........
...2222.
...2222.
.11XX22.
.11XX22.
.111133.
.111133.
........
```

The correct answer would be 4: the are where id #1 and #2 overlap is
marked with an X.
