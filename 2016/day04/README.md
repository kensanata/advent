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

