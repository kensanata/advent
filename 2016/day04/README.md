# Day 4

## Part 1

Your input is a list of strings. Each string has the form
NAME-ID[CHECKSUM]. NAME consists of lowercase letters separated by
dashes, ID is a number and CHECKSUM are the five most common letters
in NAME, sorted by frequency with ties broken by alphabetical sorting.
What is the sums of all the IDs where the CHECKSUM is correct?

This checksum is valid, for example and thus the sum would be 123:

```
zzzyyyxxxwwva-123[xyzwa]
```

## Part 2

For every string with correct CHECKSUM, rotate the letters in NAME but
the ID. The example given shows how the letter `q` in a NAME with ID
343 would end up a `v`. To find the actual answer asked for in the
question, grep the result for a line containing "north".
