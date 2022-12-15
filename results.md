
## All Days at #9d63b8a
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.09|     0.07|     0.01| ✅ |     0.00| ✅ |
|d01|     0.30|     0.27|     0.00| ✅ |     0.00| ✅ |
|d02|     0.16|     0.15|     0.00| ✅ |     0.00| ✅ |
|d03|     0.29|     0.17|     0.09| ✅ |     0.03| ✅ |
|d04|     0.17|     0.16|     0.00| ✅ |     0.00| ✅ |
|d05|     0.25|     0.13|     0.02| ✅ |     0.09| ✅ |
|d06|     0.45|     0.08|     0.07| ✅ |     0.29| ✅ |
|d07|     0.35|     0.33|     0.00| ✅ |     0.00| ✅ |
|d08|     2.06|     1.20|     0.35| ✅ |     0.50| ✅ |
|d09|     1.81|     0.41|     0.90| ✅ |     0.49| ✅ |
|d10|     0.08|     0.07|     0.00| ✅ |     0.00| ✅ |
|d11|    21.64|     0.23|     0.03| ✅ |    21.37| ✅ |
|d12|     6.57|     1.83|     2.53| ✅ |     2.19| ✅ |
|d13|     1.54|     1.40|     0.03| ✅ |     0.09| ✅ |
|d14|    17.87|     0.61|     2.07| ✅ |    15.18| ✅ |
|All|    54.54|


## All Days at #9d63b8a
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.11|
|   1   |     0.01| ✅ |     1      |            |
|   2   |     0.00| ✅ |     2      |            |
|   3   |     0.00| ❓ |     3      |            |
|  4a   |     0.01| ❌ |   wrong    |   right    |
| Time  |     0.30|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.41|
|   1   |     0.00| ✅ |   68923    |            |
|   2   |     0.00| ✅ |   200044   |            |
| Time  |     0.49|
---

### Day 2 for in/i02.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.22|
|   1   |     0.00| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.30|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.30|
|   1   |     0.09| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.47|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.34|
|   1   |     0.01| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.40|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.25|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.09| ✅ | VRZGHDFBQ  |            |
| Time  |     0.41|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.07|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.23| ✅ |    3476    |            |
| Time  |     0.41|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.33|
|   1   |     0.01| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.39|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.29|
|   1   |     0.39| ✅ |    1854    |            |
|   2   |     0.55| ✅ |   527340   |            |
| Time  |     2.33|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.55|
|   1   |     0.93| ✅ |    6243    |            |
|   2   |     0.52| ✅ |    2630    |            |
| Time  |     2.04|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.19|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.00| ✅ |  BRJLFULP  |            |
| Time  |     0.23|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.77|
|   1   |     0.03| ✅ |   110264   |            |
|   2   |    21.27| ✅ |23612457316 |            |
| Time  |    22.16|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.94|
|   1   |     2.19| ✅ |    534     |            |
|   2   |     2.47| ✅ |    525     |            |
| Time  |     5.68|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.64|
|   1   |     0.03| ✅ |    5557    |            |
|   2   |     0.10| ✅ |   22425    |            |
|  2a   |     0.50| ✅ |   22425    |            |
| Time  |     2.33|

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
| Prep  |     0.73|
|   1   |     1.98| ✅ |    808     |            |
|   2   |    16.18| ✅ |   26625    |            |
|  2.1  |    96.89| ✅ |   26625    |            |
| Time  |   115.92|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

Total Time:    155.03

