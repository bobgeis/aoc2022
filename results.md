
## All Days at #e2b5d96
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.26|     0.24|     0.01| ✅ |     0.00| ✅ |
|d01|     0.53|     0.51|     0.00| ✅ |     0.00| ✅ |
|d02|     0.28|     0.27|     0.00| ✅ |     0.00| ✅ |
|d03|     0.49|     0.37|     0.09| ✅ |     0.03| ✅ |
|d04|     0.28|     0.26|     0.00| ✅ |     0.00| ✅ |
|d05|     0.47|     0.35|     0.02| ✅ |     0.10| ✅ |
|d06|     0.42|     0.13|     0.05| ✅ |     0.23| ✅ |
|d07|     0.41|     0.40|     0.01| ✅ |     0.00| ✅ |
|d08|     2.27|     1.38|     0.37| ✅ |     0.51| ✅ |
|d09|     2.49|     0.99|     0.98| ✅ |     0.51| ✅ |
|d10|     0.22|     0.21|     0.00| ✅ |     0.00| ✅ |
|d11|    20.93|     0.38|     0.03| ✅ |    20.51| ✅ |
|d12|     6.85|     1.02|     2.36| ✅ |     3.45| ✅ |
|d13|     2.55|     2.28|     0.09| ✅ |     0.17| ✅ |
|d14|    21.23|     1.11|     2.72| ✅ |    17.38| ✅ |
|d15|     1.01|     0.19|     0.01| ✅ |     0.79| ✅ |
|d16| 44310.28|     1.54|   896.57| ✅ | 43412.13| ✅ |
|d17|     4.55|     0.30|     4.24| ✅ |     0.00| ❓ |
|d18|    10.82|     0.98|     0.34| ✅ |     9.48| ✅ |
|All| 56409.51|


## All Days at #e2b5d96
- optimized release
- including notes

### Day 0 for in/i00.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.15|
|   1   |     0.01| ✅ |     1      |            |
|   2   |     0.00| ✅ |     2      |            |
|   3   |     0.00| ❓ |     3      |            |
|  4a   |     0.01| ❌ |   wrong    |   right    |
| Time  |     0.27|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.33|
|   1   |     0.00| ✅ |   68923    |            |
|   2   |     0.00| ✅ |   200044   |            |
| Time  |     0.41|
---

### Day 2 for in/i02.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.24|
|   1   |     0.00| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.30|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.54|
|   1   |     0.09| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.71|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.37|
|   1   |     0.00| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.43|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.32|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.10| ✅ | VRZGHDFBQ  |            |
| Time  |     0.49|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.12|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.25| ✅ |    3476    |            |
| Time  |     0.48|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.39|
|   1   |     0.01| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.45|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.36|
|   1   |     0.35| ✅ |    1854    |            |
|   2   |     0.53| ✅ |   527340   |            |
| Time  |     2.31|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.43|
|   1   |     0.96| ✅ |    6243    |            |
|   2   |     0.47| ✅ |    2630    |            |
| Time  |     1.92|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.16|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.00| ✅ |  BRJLFULP  |            |
| Time  |     0.21|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.27|
|   1   |     0.03| ✅ |   110264   |            |
|   2   |    19.52| ✅ |23612457316 |            |
| Time  |    19.86|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.89|
|   1   |     2.17| ✅ |    534     |            |
|   2   |     2.15| ✅ |    525     |            |
| Time  |     5.26|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.62|
|   1   |     0.04| ✅ |    5557    |            |
|   2   |     0.10| ✅ |   22425    |            |
|  2a   |     0.51| ✅ |   22425    |            |
| Time  |     2.35|

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
| Prep  |     0.94|
|   1   |     2.00| ✅ |    808     |            |
|   2   |    16.24| ✅ |   26625    |            |
|  2.1  |    92.26| ✅ |   26625    |            |
| Time  |   111.63|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.17|
|   1   |     0.01| ✅ |  5878678   |            |
|   2   |     0.88| ✅ |11796491041245|            |
|  2.1  |   800.52| ✅ |11796491041245|            |
| Time  |   801.71|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

### Day 16 for in/i16.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.74|
|   1   |   842.26| ✅ |    1850    |            |
|   2   | 44199.39| ✅ |    2306    |            |
| Time  | 45042.80|

 Part 1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

TODO: speed up part 2.

---

### Day 17 for in/i17.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.37|
|   1   |     4.32| ✅ |    3227    |            |
|   2   |     0.01| ❓ |     ?      |            |
| Time  |     4.81|

 Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2. After running the part 1 code with visualization for long enough patterns emerge. I think I'll making a cache of [block-offset,char-offset] -> delta-height and see if something like that can make be made both accurate and fast.

TODO: Solve part 2.

---

### Day 18 for in/i18.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.88|
|   1   |     0.34| ✅ |    4314    |            |
|   2   |     7.61| ✅ |    2444    |            |
| Time  |     8.92|

 Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!

Part 2: Part 2 took slightly more thought that part 1 (where the naive solution worked well enough). In part 2 I did a bfs around the outside of the cube set, and then did the surface calculation using the set of exterior water cubes as check. There's probably room to make a faster implementation and/or approach, but the first thing worked well enough. I expect harder 3D puzzles in the near future.

---

Total Time:  59617.66

