
## All Days at #0cfea95
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.31|     0.28|     0.01| ✅ |     0.00| ✅ |
|d01|     0.40|     0.37|     0.00| ✅ |     0.00| ✅ |
|d02|     0.29|     0.28|     0.00| ✅ |     0.00| ✅ |
|d03|     0.49|     0.37|     0.09| ✅ |     0.03| ✅ |
|d04|     0.26|     0.25|     0.00| ✅ |     0.00| ✅ |
|d05|     0.35|     0.23|     0.02| ✅ |     0.09| ✅ |
|d06|     0.45|     0.14|     0.06| ✅ |     0.24| ✅ |
|d07|     0.61|     0.59|     0.01| ✅ |     0.01| ✅ |
|d08|     2.72|     1.77|     0.38| ✅ |     0.54| ✅ |
|d09|     2.80|     1.11|     1.14| ✅ |     0.52| ✅ |
|d10|     0.48|     0.45|     0.01| ✅ |     0.01| ✅ |
|d11|    20.91|     0.35|     0.03| ✅ |    20.52| ✅ |
|d12|     5.68|     1.07|     2.35| ✅ |     2.25| ✅ |
|d13|     1.81|     1.68|     0.03| ✅ |     0.09| ✅ |
|d14|    14.97|     0.76|     1.80| ✅ |    12.40| ✅ |
|d15|     0.93|     0.17|     0.01| ✅ |     0.75| ✅ |
|d16| 45622.06|     0.59|   807.37| ✅ | 44814.06| ✅ |
|d17|    15.83|     0.46|     7.09| ✅ |     8.25| ✅ |
|d18|    10.38|     1.60|     0.66| ✅ |     8.09| ✅ |
|All| 59061.19|


## All Days at #0cfea95
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.18|
|   1   |     0.01| ✅ |     1      |            |
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
| Prep  |     0.28|
|   1   |     0.00| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.34|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.36|
|   1   |     0.08| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.53|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.26|
|   1   |     0.00| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.32|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.29|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.09| ✅ | VRZGHDFBQ  |            |
| Time  |     0.45|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.13|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.23| ✅ |    3476    |            |
| Time  |     0.47|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.45|
|   1   |     0.00| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.51|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.32|
|   1   |     0.43| ✅ |    1854    |            |
|   2   |     0.50| ✅ |   527340   |            |
| Time  |     2.35|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.49|
|   1   |     0.87| ✅ |    6243    |            |
|   2   |     0.50| ✅ |    2630    |            |
| Time  |     1.90|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.01| ✅ |  BRJLFULP  |            |
| Time  |     0.20|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.29|
|   1   |     0.03| ✅ |   110264   |            |
|   2   |    19.52| ✅ |23612457316 |            |
| Time  |    19.88|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.03|
|   1   |     2.83| ✅ |    534     |            |
|   2   |     3.10| ✅ |    525     |            |
| Time  |     7.09|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.70|
|   1   |     0.06| ✅ |    5557    |            |
|   2   |     0.13| ✅ |   22425    |            |
|  2a   |     0.59| ✅ |   22425    |            |
| Time  |     2.59|

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
| Prep  |     0.96|
|   1   |     1.86| ✅ |    808     |            |
|   2   |    13.42| ✅ |   26625    |            |
|  2.1  |    83.00| ✅ |   26625    |            |
| Time  |    99.40|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.27|
|   1   |     0.02| ✅ |  5878678   |            |
|   2   |     1.60| ✅ |11796491041245|            |
|  2.1  |   814.36| ✅ |11796491041245|            |
| Time  |   816.40|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

### Day 16 for in/i16.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.77|
|   1   |   884.39| ✅ |    1850    |            |
|   2   | 48237.63| ✅ |    2306    |            |
| Time  | 49123.25|

 Part 1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

TODO: speed up part 2.

---

### Day 17 for in/i17.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.46|
|   1   |     7.48| ✅ |    3227    |            |
|   2   |    11.70| ✅ |1597714285698|            |
| Time  |    19.87|

 Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2 the same day. From running the part 1 code with visualization, the tower structure repeats. I poked the AoC subreddit and some people inspect it visually, and some people detected repeating patters. I tried to detect a repeating pattern. I have a cache that matches block- and char-offsets to block-number, and another that matches block-number to total height (that's just a seq, since both start at 0). My current solution works but there's a subtle bug that makes it fail for the test data for 2022 iterations.

---

### Day 18 for in/i18.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.50|
|   1   |     0.52| ✅ |    4314    |            |
|   2   |    14.05| ✅ |    2444    |            |
| Time  |    16.24|

 Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!

Part 2: Part 2 took slightly more thought that part 1 (where the naive solution worked well enough). In part 2 I did a bfs around the outside of the cube set, and then did the surface calculation using the set of exterior water cubes as check. There's probably room to make a faster implementation and/or approach, but the first thing worked well enough. I expect harder 3D puzzles in the near future.

Part 2.2: There is a minor improvement where the exposed surfaces are counted during the bfs around the exterior of the droplet, instead of afterwards.

---

Total Time:  63739.35

