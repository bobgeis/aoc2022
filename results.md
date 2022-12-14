
## All Days at #3ee907a
- optimized release
- skipping extra parts

d00:   0.09ms   pr:   0.07ms   p1:   0.00ms ✅   p2:   0.00ms ✅
d01:   0.29ms   pr:   0.27ms   p1:   0.00ms ✅   p2:   0.00ms ✅
d02:   0.17ms   pr:   0.16ms   p1:   0.00ms ✅   p2:   0.00ms ✅
d03:   0.30ms   pr:   0.18ms   p1:   0.09ms ✅   p2:   0.03ms ✅
d04:   0.17ms   pr:   0.16ms   p1:   0.00ms ✅   p2:   0.00ms ✅
d05:   0.45ms   pr:   0.27ms   p1:   0.02ms ✅   p2:   0.14ms ✅
d06:   0.33ms   pr:   0.04ms   p1:   0.05ms ✅   p2:   0.23ms ✅
d07:   0.30ms   pr:   0.29ms   p1:   0.01ms ✅   p2:   0.00ms ✅
d08:   2.51ms   pr:   1.31ms   p1:   0.50ms ✅   p2:   0.66ms ✅
d09:   3.42ms   pr:   0.89ms   p1:   1.91ms ✅   p2:   0.61ms ✅
d10:   0.10ms   pr:   0.08ms   p1:   0.00ms ✅   p2:   0.00ms ✅
d11:  23.03ms   pr:   0.40ms   p1:   0.05ms ✅   p2:  22.56ms ✅
d12:   5.76ms   pr:   1.36ms   p1:   2.24ms ✅   p2:   2.14ms ✅
d13:   1.59ms   pr:   1.45ms   p1:   0.03ms ✅   p2:   0.09ms ✅
d14: 106.87ms   pr:   0.61ms   p1:   2.47ms ✅   p2: 103.79ms ✅
---
Total Time:  146.42ms
---


## All Days at #3ee907a
- optimized release
- including notes

### Day 0 for in/i00.txt
  Prep:   0.07ms
  Pt 1:   0.01ms ✅ 1
  Pt 2:   0.00ms ✅ 2
  Pt 3:   0.00ms ❓ 3
  Pt4a:   0.01ms ❌ wrong -> right
  Time:   0.16ms
  Note
    d00 is a trivial example. It's time represents a noisy lower bound
    for a day.

### Day 1 for in/i01.txt
  Prep:   0.28ms
  Pt 1:   0.00ms ✅ 68923
  Pt 2:   0.00ms ✅ 200044
  Time:   0.33ms

### Day 2 for in/i02.txt
  Prep:   0.14ms
  Pt 1:   0.00ms ✅ 12276
  Pt 2:   0.00ms ✅ 9975
  Time:   0.19ms

### Day 3 for in/i03.txt
  Prep:   0.16ms
  Pt 1:   0.09ms ✅ 7691
  Pt 2:   0.03ms ✅ 2508
  Time:   0.31ms

### Day 4 for in/i04.txt
  Prep:   0.15ms
  Pt 1:   0.00ms ✅ 462
  Pt 2:   0.00ms ✅ 835
  Time:   0.19ms

### Day 5 for in/i05.txt
  Prep:   0.14ms
  Pt 1:   0.02ms ✅ SHMSDGZVC
  Pt 2:   0.09ms ✅ VRZGHDFBQ
  Time:   0.28ms

### Day 6 for in/i06.txt
  Prep:   0.02ms
  Pt 1:   0.06ms ✅ 1210
  Pt 2:   0.23ms ✅ 3476
  Time:   0.35ms

### Day 7 for in/i07.txt
  Prep:   0.28ms
  Pt 1:   0.00ms ✅ 1908462
  Pt 2:   0.00ms ✅ 3979145
  Time:   0.33ms
  Note
    The input recursively walks the dirs, calling `ls` exactly once
    in each. It could have been much worse!

### Day 8 for in/i08.txt
  Prep:   1.17ms
  Pt 1:   0.37ms ✅ 1854
  Pt 2:   0.53ms ✅ 527340
  Time:   2.13ms
  Note
    In retrospect, part 1 and part 2 could probably have each used
    the same kind of `ray` function. But instead I did part 1 by
    walking across the whole forest from each direction and then part
    2 by walking out from each spot. There's probably improvements
    that can be done here.

### Day 9 for in/i09.txt
  Prep:   0.39ms
  Pt 1:   0.89ms ✅ 6243
  Pt 2:   0.53ms ✅ 2630
  Time:   1.89ms
  Note
  My first implementation had a bug where it didn't correctly account
  for intermediate knots being pulled diagonally.

### Day 10 for in/i10.txt
  Prep:   0.09ms
  Pt 1:   0.00ms ✅ 12980
  Pt 2:   0.01ms ✅ BRJLFULP
  Time:   0.15ms
  Note
  Aha! A day where the output is an image that you have to look at.

### Day 11 for in/i11.txt
  Prep:   0.26ms
  Pt 1:   0.03ms ✅ 110264
  Pt 2:  20.88ms ✅ 23612457316
  Time:  21.25ms
  Note
    My first implementation used scanTuple for parsing and it quickly
    became cumbersome. Scanf is actually much cleaner when you have
    multiple potential strings to match and it works well with
    doAssert.

    I used a trick from earlier years where you multiply all the
    period of all the loops together to get the period of a much
    larger loop. This larger period is big, but it still fits into
    an int, so we don't worry about overflow.

    Also remember that args known at compile time can be defined
    as `static` to save a little bit of work at run-time.

### Day 12 for in/i12.txt
  Prep:   0.90ms
  Pt 1:   3.08ms ✅ 534
  Pt 2:   2.97ms ✅ 525
  Time:   7.08ms
  Note
    A chance to use graphwalk.bfs!

    There was a bug with my initial implementation that made part 1
    take way too long.

    My first part 1 solution did bfs from start to finish, but part 2
    is easier to do via bfs from the finish towards any 'a', so
    I reversed part 1 to allow them to share code.

    There's still lots of room for improvement, but it works decently
    for now.

### Day 13 for in/i13.txt
  Prep:   1.67ms
  Pt 1:   0.07ms ✅ 5557
  Pt 2:   0.10ms ✅ 22425
  Pt2a:   0.52ms ✅ 22425
  Time:   2.48ms
  Note
    First thought: Can we walk the pairs of strings comparing them
    char by char?

    Second thought: Can we somehow use pegs here?

    Third thought: This is all valid json, let's just parse it!

    I hadn't used the std/json library before, so that took some
    experimentation. Once finished, it worked great and part 2 was
    very quick to code.

    For part 2 I first used the built-in sort and was well pleased
    with it, but it can be much faster. You don't actually have to
    sort the seq of JsonNodes, you just need to know how many nodes
    would be to the left of the two dividers _if_ they were sorted.
    You can do this just by looping through the array once.

    I've preserved my sorting solution as part "2a".

    It may be possible to improve parsing performance by using a
    faster json library. Several exist (eg search the nim forum).

### Day 14 for in/i14.txt
  Prep:   0.66ms
  Pt 1:   2.21ms ✅ 808
  Pt 2:  96.30ms ✅ 26625
  Time:  99.24ms
  Note
    Naive 'simulate each sand grain as it falls' works decently. Lots
    of room for improvement of course... First implementation had
    little code re-use.

---
Total Time:  137.27ms
---

