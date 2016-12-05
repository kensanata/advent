# Day 5

## Part 1

You start with a string such as "abc" and append an index, then
compute the MD5 hash, and if its hex representation starts with five
zeroes, then the sixth character is a letter in your password. Keep
increasing the index until you have eight letters for your password.
Using "abc" as the example, the first match would be "abc3231929"
which produces a hash of "00000155f8105dff7f56ee10fa9b9abd" and thus
the first letter of the password would be "1".

## Part 2

Same as before, but now the the sixth character indicates the
*position* of the seventh character. In the example above, this means
that position 1 has the number "5". The password is zero indexed.
Ignore positions outside the password and don't overwrite characters
you've alreay found.
