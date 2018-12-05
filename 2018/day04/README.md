# Day 04

## Part 1

Your input is a record of guard behaviour. They fall asleep on a
particular minute between 0:00 and 1:00 and they wake up on a
particular minute.

Example:

```
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
```

Or visually:

```
Date   ID   Minute
            000000000011111111112222222222333333333344444444445555555555
            012345678901234567890123456789012345678901234567890123456789
11-01  #10  .....####################.....#########################.....
11-02  #99  ........................................##########..........
11-03  #10  ........................#####...............................
11-04  #99  ....................................##########..............
11-05  #99  .............................................##########.....
```

Find the guard that's been sleeping the most minutes. In this example
that would be guard 10 as it sleeps 20 + 25 + 5 = 50min.

Find the most likely minute this guard would spend asleep and multiply
it by the guard id. In this example guard 10 spends minute 24 asleep
on two days, so the answer would be 10 * 24 = 240.

The records need to be sorted, first. If you reverse the input, it
must still work.

## Part 2

Find the guard that is the most frequently asleep on the same minute.
In this example that would be guard 99 on minute 45 (3 times).
Multiply the minute and id again, so in this case the answer would be
99 * 45 = 4455.

