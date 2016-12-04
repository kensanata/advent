# Day 3: C

## Part 1

The question is this: given three numbers per line, count the
potential triangles. “In a valid triangle, the sum of any two sides
must be larger than the remaining side.”

## Part 2

In part two, we count vertical triangle candidates. In other words, we
read three rows and get three potential triangles. Here’s the example
given:

```
101 301 501
102 302 502
103 303 503
201 401 601
202 402 602
203 403 603
```

This counts as 6 triangles, because `[101 102 103]` is a triangle,
`[201 202 203]` is a triangle, etc.
