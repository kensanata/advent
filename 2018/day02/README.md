# Day 1

## First Part

Given a list of strings, count the number of strings that contain
exactly two of any letter, count the number of strings that contain
exactly three of any letter, and multiply the two numbers.

Example:

```
    String Doubles Triples
    abcdef    0       0
    bababc    1       1
    abbcde    1       0
    abcccd    0       1
    aabcdd    1       0
    abcdee    1       0
    ababab    0       1
    ------ ------ --------
    Sums      4       3
    
    Result: 4 × 3 = 12
```

## Second Part

Given a list of strings, find the two strings that differ in exactly
one position and return the common characters.

Example:

```
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
```

The result is `fgij`.

My first attempt at a solution failed as soon as the string `aaaaa`
was added to the input. So do check for that. 🙂
