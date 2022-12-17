
## All Days at #3ec06e1
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.21|     0.18|     0.00| ✅ |     0.00| ✅ |
|d01|     0.63|     0.60|     0.00| ✅ |     0.00| ✅ |
|d02|     0.47|     0.46|     0.00| ✅ |     0.00| ✅ |
|d03|     0.58|     0.46|     0.09| ✅ |     0.03| ✅ |
|d04|     0.41|     0.40|     0.00| ✅ |     0.00| ✅ |
|d05|     0.51|     0.39|     0.02| ✅ |     0.09| ✅ |
|d06|     0.72|     0.15|     0.09| ✅ |     0.46| ✅ |
|d07|     0.75|     0.72|     0.01| ✅ |     0.01| ✅ |
|d08|     4.07|     2.71|     0.79| ✅ |     0.55| ✅ |
|d09|     3.16|     1.03|     1.37| ✅ |     0.72| ✅ |
|d10|     0.28|     0.26|     0.00| ✅ |     0.01| ✅ |
|d11|    21.16|     0.37|     0.03| ✅ |    20.74| ✅ |
|d12|     5.40|     1.10|     2.17| ✅ |     2.12| ✅ |
|d13|     1.96|     1.83|     0.03| ✅ |     0.10| ✅ |
|d14|    15.74|     0.92|     1.80| ✅ |    13.00| ✅ |
|d15|     1.02|     0.27|     0.01| ✅ |     0.73| ✅ |
|d16| 45931.82|     0.67|   936.98| ✅ | 44994.13| ✅ |
|All| 58161.73|


## All Days at #3ec06e1
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.17|
|   1   |     0.00| ✅ |     1      |            |
|   2   |     0.00| ✅ |     2      |            |
|   3   |     0.00| ❓ |     3      |            |
|  4a   |     0.01| ❌ |   wrong    |   right    |
| Time  |     0.29|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.37|
|   1   |     0.00| ✅ |   68923    |            |
|   2   |     0.00| ✅ |   200044   |            |
| Time  |     0.45|
---

### Day 2 for in/i02.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.30|
|   1   |     0.01| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.37|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.42|
|   1   |     0.09| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.60|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.27|
|   1   |     0.00| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.34|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.36|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.10| ✅ | VRZGHDFBQ  |            |
| Time  |     0.54|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.12|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.23| ✅ |    3476    |            |
| Time  |     0.46|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.43|
|   1   |     0.01| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.50|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.39|
|   1   |     0.34| ✅ |    1854    |            |
|   2   |     0.51| ✅ |   527340   |            |
| Time  |     2.30|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.54|
|   1   |     0.87| ✅ |    6243    |            |
|   2   |     0.47| ✅ |    2630    |            |
| Time  |     1.94|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.21|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.00| ✅ |  BRJLFULP  |            |
| Time  |     0.26|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.30|
|   1   |     0.04| ✅ |   110264   |            |
|   2   |    20.53| ✅ |23612457316 |            |
| Time  |    20.96|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.06|
|   1   |     2.58| ✅ |    534     |            |
|   2   |     2.66| ✅ |    525     |            |
| Time  |     6.42|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.64|
|   1   |     0.05| ✅ |    5557    |            |
|   2   |     0.11| ✅ |   22425    |            |
|  2a   |     0.53| ✅ |   22425    |            |
| Time  |     2.42|

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
| Prep  |     1.15|
|   1   |     1.93| ✅ |    808     |            |
|   2   |    15.86| ✅ |   26625    |            |
|  2.1  |   102.76| ✅ |   26625    |            |
| Time  |   121.90|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.30|
|   1   |     0.01| ✅ |  5878678   |            |
|   2   |     0.82| ✅ |11796491041245|            |
|  2.1  |   845.98| ✅ |11796491041245|            |
| Time  |   847.28|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

### Day 16 for in/i16.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.64|
|   1   |   915.44| ✅ |    1850    |            |
|   2   | 47948.34| ✅ |    2306    |            |
| Time  | 48864.80|

 Part 1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

TODO: speed up part 2.

---

Total Time:  62812.67

