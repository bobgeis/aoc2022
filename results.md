
## All Days at #0557a09
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.09|     0.07|     0.00| ✅ |     0.00| ✅ |
|d01|     0.32|     0.29|     0.00| ✅ |     0.00| ✅ |
|d02|     0.17|     0.16|     0.00| ✅ |     0.00| ✅ |
|d03|     0.37|     0.18|     0.13| ✅ |     0.04| ✅ |
|d04|     0.17|     0.16|     0.00| ✅ |     0.00| ✅ |
|d05|     0.26|     0.14|     0.02| ✅ |     0.09| ✅ |
|d06|     0.32|     0.03|     0.05| ✅ |     0.23| ✅ |
|d07|     0.30|     0.29|     0.00| ✅ |     0.00| ✅ |
|d08|     2.16|     1.21|     0.45| ✅ |     0.49| ✅ |
|d09|     2.32|     0.45|     1.24| ✅ |     0.62| ✅ |
|d10|     0.31|     0.28|     0.01| ✅ |     0.01| ✅ |
|d11|    22.91|     0.40|     0.04| ✅ |    22.46| ✅ |
|d12|     5.41|     0.91|     2.32| ✅ |     2.17| ✅ |
|d13|     1.58|     1.44|     0.03| ✅ |     0.09| ✅ |
|d14|    15.26|     0.61|     1.82| ✅ |    12.82| ✅ |
|d15|     0.80|     0.08|     0.00| ✅ |     0.71| ✅ |
|All|    54.04|


## All Days at #0557a09
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.07|
|   1   |     0.00| ✅ |     1      |            |
|   2   |     0.00| ✅ |     2      |            |
|   3   |     0.00| ❓ |     3      |            |
|  4a   |     0.01| ❌ |   wrong    |   right    |
| Time  |     0.15|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.28|
|   1   |     0.00| ✅ |   68923    |            |
|   2   |     0.00| ✅ |   200044   |            |
| Time  |     0.34|
---

### Day 2 for in/i02.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.00| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.19|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.16|
|   1   |     0.08| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.31|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.00| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.19|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.14|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.09| ✅ | VRZGHDFBQ  |            |
| Time  |     0.29|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.03|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.23| ✅ |    3476    |            |
| Time  |     0.34|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.28|
|   1   |     0.01| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.33|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.39|
|   1   |     0.36| ✅ |    1854    |            |
|   2   |     0.49| ✅ |   527340   |            |
| Time  |     2.31|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.35|
|   1   |     0.95| ✅ |    6243    |            |
|   2   |     0.50| ✅ |    2630    |            |
| Time  |     1.84|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.06|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.00| ✅ |  BRJLFULP  |            |
| Time  |     0.10|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.23|
|   1   |     0.03| ✅ |   110264   |            |
|   2   |    19.89| ✅ |23612457316 |            |
| Time  |    20.21|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.93|
|   1   |     2.13| ✅ |    534     |            |
|   2   |     2.42| ✅ |    525     |            |
| Time  |     5.55|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.55|
|   1   |     0.06| ✅ |    5557    |            |
|   2   |     0.13| ✅ |   22425    |            |
|  2a   |     0.59| ✅ |   22425    |            |
| Time  |     2.45|

 First thought: Can we walk the pairs of strings comparing themchar by char?

Second thought: Can we somehow use pegs here?

Third thought: This is all valid json, let's just parse it!

I hadn't used the std/json library before, so that took some experimentation. Once finished, it worked great and part 2 was very quick to code.

For part 2 I first used the built-in sort and was well pleased with it, but it can be much faster. You don't actually have to sort the seq of JsonNodes, you just need to know how many nodes would be to the left of the two dividers _if_ they were sorted.
You can do this just by looping through the array once.

I've preserved my sorting solution as part "2a".

It may be possible to improve parsing performance by using a faster json library. Several exist (eg search the nim forum).

---

### Day 14 for in/i14.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.68|
|   1   |     2.57| ✅ |    808     |            |
|   2   |    14.42| ✅ |   26625    |            |
|  2.1  |    99.05| ✅ |   26625    |            |
| Time  |   116.95|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.07|
|   1   |     0.01| ✅ |  5878678   |            |
|   2   |     0.70| ✅ |11796491041245|            |
|  2.1  |   782.85| ✅ |11796491041245|            |
| Time  |   783.72|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

Total Time:    936.44

