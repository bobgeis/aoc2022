
## All Days at #f936173
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.11|     0.09|     0.01| ✅ |     0.00| ✅ |
|d01|     0.28|     0.26|     0.00| ✅ |     0.00| ✅ |
|d02|     0.16|     0.15|     0.00| ✅ |     0.00| ✅ |
|d03|     0.28|     0.16|     0.09| ✅ |     0.03| ✅ |
|d04|     0.17|     0.16|     0.00| ✅ |     0.00| ✅ |
|d05|     0.35|     0.14|     0.04| ✅ |     0.16| ✅ |
|d06|     0.64|     0.06|     0.11| ✅ |     0.46| ✅ |
|d07|     0.55|     0.53|     0.01| ✅ |     0.00| ✅ |
|d08|     4.13|     2.09|     1.03| ✅ |     0.98| ✅ |
|d09|     2.63|     0.83|     1.27| ✅ |     0.52| ✅ |
|d10|     0.09|     0.08|     0.00| ✅ |     0.00| ✅ |
|d11|    22.77|     0.24|     0.03| ✅ |    22.49| ✅ |
|d12|     5.96|     1.00|     2.69| ✅ |     2.25| ✅ |
|d13|     1.61|     1.47|     0.04| ✅ |     0.09| ✅ |
|d14|    19.94|     1.02|     2.13| ✅ |    16.77| ✅ |
|Tot|    60.77|


## All Days at #f936173
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.07|
|   1   |     0.01| ✅ |     1      |     1      |
|   2   |     0.00| ✅ |     2      |     2      |
|   3   |     0.00| ❓ |     3      |            |
|  4a   |     0.02| ❌ |   wrong    |   right    |
| Time  |     0.17|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.24|
|   1   |     0.00| ✅ |   68923    |   68923    |
|   2   |     0.00| ✅ |   200044   |   200044   |
| Time  |     0.31|
---

### Day 2 for in/i02.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.00| ✅ |   12276    |   12276    |
|   2   |     0.00| ✅ |    9975    |    9975    |
| Time  |     0.20|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.16|
|   1   |     0.09| ✅ |    7691    |    7691    |
|   2   |     0.03| ✅ |    2508    |    2508    |
| Time  |     0.32|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.16|
|   1   |     0.00| ✅ |    462     |    462     |
|   2   |     0.00| ✅ |    835     |    835     |
| Time  |     0.20|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.02| ✅ | SHMSDGZVC  | SHMSDGZVC  |
|   2   |     0.09| ✅ | VRZGHDFBQ  | VRZGHDFBQ  |
| Time  |     0.30|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.03|
|   1   |     0.06| ✅ |    1210    |    1210    |
|   2   |     0.24| ✅ |    3476    |    3476    |
| Time  |     0.37|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.29|
|   1   |     0.01| ✅ |  1908462   |  1908462   |
|   2   |     0.00| ✅ |  3979145   |  3979145   |
| Time  |     0.34|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.31|
|   1   |     0.35| ✅ |    1854    |    1854    |
|   2   |     0.56| ✅ |   527340   |   527340   |
| Time  |     2.30|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.36|
|   1   |     0.93| ✅ |    6243    |    6243    |
|   2   |     0.48| ✅ |    2630    |    2630    |
| Time  |     1.83|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.06|
|   1   |     0.00| ✅ |   12980    |   12980    |
|   2   |     0.00| ✅ |  BRJLFULP  |  BRJLFULP  |
| Time  |     0.11|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.23|
|   1   |     0.03| ✅ |   110264   |   110264   |
|   2   |    20.53| ✅ |23612457316 |23612457316 |
| Time  |    20.85|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.24|
|   1   |     4.04| ✅ |    534     |    534     |
|   2   |     2.43| ✅ |    525     |    525     |
| Time  |     7.83|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     2.07|
|   1   |     0.05| ✅ |    5557    |    5557    |
|   2   |     0.15| ✅ |   22425    |   22425    |
|  2a   |     0.50| ✅ |   22425    |   22425    |
| Time  |     2.87|

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
| Prep  |     0.67|
|   1   |     2.18| ✅ |    808     |    808     |
|   2   |    13.11| ✅ |   26625    |   26625    |
|  2.1  |    93.19| ✅ |   26625    |   26625    |
| Time  |   109.31|

 Naive 'simulate each sand grain as it falls' works decently. Part 2 took 90-120ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time from ~100 -> ~10 ms. Pretty decent.

---

Total Time:    148.51

