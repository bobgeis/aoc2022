
# Advent of Code 2022

[This repo](https://github.com/bobgeis/aoc2022) contains solutions to [Advent of Code 2022](https://adventofcode.com/2022) written in [nim](https://nim-lang.org/).

## Links

- [Advent of Code 2022](https://adventofcode.com/2022)
- [Awesome Advent of Code](https://github.com/Bogdanp/awesome-advent-of-code#nim)
- [aoc subreddit](https://old.reddit.com/r/adventofcode/)
- [Advent of Nim](https://forum.nim-lang.org/t/9678)

## Nim References

- [nim lang](https://nim-lang.org/)
- [nim forum](https://forum.nim-lang.org/)
- [nim compiler](https://nim-lang.org/docs/nimc.html)
- [nim manual](https://nim-lang.org/docs/manual.html)
- [nim std lib](https://nim-lang.org/docs/lib.html)
- [nimscript](https://nim-lang.org/docs/nimscript.html)
- [nimble](https://nimble.directory/)
- [itertools](https://github.com/narimiran/itertools)
- [memo](https://github.com/andreaferretti/memo)
- [stint](https://github.com/status-im/nim-stint)
- [stew](https://github.com/status-im/nim-stew)

## [repo](https://github.com/bobgeis/aoc2022)

I'm using vscode with [nim](https://marketplace.visualstudio.com/items?itemName=kosz78.nim) and [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) extensions. Plus other not nim-specific ones.

For nimble packages, the `stint` package is vital for dealing with very large ints. `memo` and `itertools` are sometimes very helpful and convenient.

I have a `lib` dir of helper code assembled from previous years. `aocu` has utils for working in the repo. `bedrock` has misc utilities. `graphwalk` is for graph traversal algorithms. `imps` is a file to include to import a lot of common libraries into a file. `shenanigans` is for experimenting with macros.`tibia` and `vecna` are for working with 2D & 3D points/vectors (which happens a _lot_ in advent of code); `vecna` is for the vectors themselves and `tibia` is for using them as keys in datastructures.

There are scripts in the `config.nims` file that exist to streamline common tasks. For example `nim di 1` to init a new day, and `nim dr last` to run the highest day. Use `nim help` to list the tasks.

---

## Spoilers below

___


## All Days at #8896b6e
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.09|     0.07|     0.00| ✅ |     0.00| ✅ |
|d01|     0.26|     0.24|     0.00| ✅ |     0.00| ✅ |
|d02|     0.15|     0.15|     0.00| ✅ |     0.00| ✅ |
|d03|     0.28|     0.16|     0.09| ✅ |     0.03| ✅ |
|d04|     0.17|     0.16|     0.00| ✅ |     0.00| ✅ |
|d05|     0.26|     0.14|     0.02| ✅ |     0.10| ✅ |
|d06|     0.39|     0.07|     0.08| ✅ |     0.24| ✅ |
|d07|     0.32|     0.30|     0.01| ✅ |     0.00| ✅ |
|d08|     2.37|     1.45|     0.39| ✅ |     0.51| ✅ |
|d09|     1.88|     0.44|     0.95| ✅ |     0.48| ✅ |
|d10|     0.09|     0.07|     0.00| ✅ |     0.00| ✅ |
|d11|    20.91|     0.26|     0.03| ✅ |    20.60| ✅ |
|d12|     5.16|     0.85|     2.16| ✅ |     2.14| ✅ |
|d13|     1.53|     1.40|     0.03| ✅ |     0.09| ✅ |
|d14|    15.52|     0.60|     2.86| ✅ |    12.05| ✅ |
|d15|     0.82|     0.06|     0.00| ✅ |     0.74| ✅ |
|d16|   150.21|     0.51|    78.48| ✅ |    71.21| ✅ |
|d17|    11.69|     0.05|     3.73| ✅ |     7.90| ✅ |
|d18|    12.07|     0.74|     0.40| ✅ |    10.91| ✅ |
|d19|  1712.71|     0.09|   973.02| ✅ |   739.58| ✅ |
|d20|   233.89|     1.31|    23.07| ✅ |   209.50| ✅ |
|d21|     1.95|     1.40|     0.19| ✅ |     0.33| ✅ |
|All|  2174.13|


## All Days at #8896b6e
- optimized release
- including notes

### Day 0 for in/i00.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.06|
|   1    |     0.01| ✅ |       1        |                |
|   2    |     0.00| ✅ |       2        |                |
|   3    |     0.00| ❓ |       3        |                |
|  4.1   |     0.01| ❌ |     wrong      |     right      |
|  Time  |     0.17|

 d00 is a trivial example. It's time represents a noisy lower bound for a day.

---

### Day 1 for in/i01.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.24|
|   1    |     0.00| ✅ |     68923      |                |
|   2    |     0.00| ✅ |     200044     |                |
|  Time  |     0.29|
---

### Day 2 for in/i02.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.14|
|   1    |     0.00| ✅ |     12276      |                |
|   2    |     0.00| ✅ |      9975      |                |
|  Time  |     0.17|
---

### Day 3 for in/i03.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.16|
|   1    |     0.08| ✅ |      7691      |                |
|   2    |     0.03| ✅ |      2508      |                |
|  Time  |     0.30|
---

### Day 4 for in/i04.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.15|
|   1    |     0.00| ✅ |      462       |                |
|   2    |     0.00| ✅ |      835       |                |
|  Time  |     0.18|
---

### Day 5 for in/i05.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.14|
|   1    |     0.02| ✅ |   SHMSDGZVC    |                |
|   2    |     0.09| ✅ |   VRZGHDFBQ    |                |
|  Time  |     0.28|
---

### Day 6 for in/i06.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.02|
|   1    |     0.06| ✅ |      1210      |                |
|   2    |     0.23| ✅ |      3476      |                |
|  Time  |     0.34|
---

### Day 7 for in/i07.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.29|
|   1    |     0.00| ✅ |    1908462     |                |
|   2    |     0.00| ✅ |    3979145     |                |
|  Time  |     0.33|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     1.15|
|   1    |     0.38| ✅ |      1854      |                |
|   2    |     0.51| ✅ |     527340     |                |
|  Time  |     2.07|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.33|
|   1    |     0.95| ✅ |      6243      |                |
|   2    |     0.48| ✅ |      2630      |                |
|  Time  |     1.81|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.06|
|   1    |     0.00| ✅ |     12980      |                |
|   2    |     0.00| ✅ |    BRJLFULP    |                |
|  Time  |     0.10|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.23|
|   1    |     0.03| ✅ |     110264     |                |
|   2    |    19.85| ✅ |  23612457316   |                |
|  Time  |    20.18|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.85|
|   1    |     2.19| ✅ |      534       |                |
|   2    |     2.16| ✅ |      525       |                |
|  Time  |     5.25|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     1.39|
|   1    |     0.03| ✅ |      5557      |                |
|   2    |     0.09| ✅ |     22425      |                |
|  2.1   |     0.50| ✅ |     22425      |                |
|  Time  |     2.06|

 First thought: Can we walk the pairs of strings comparing themchar by char?

Second thought: Can we somehow use pegs here?

Third thought: This is all valid json, let's just parse it!

I hadn't used the std/json library before, so that took some experimentation. Once finished, it worked great and part 2 was very quick to code.

For part 2 I first used the built-in sort and was well pleased with it, but it can be much faster. You don't actually have to sort the seq of JsonNodes, you just need to know how many nodes would be to the left of the two dividers _if_ they were sorted.
You can do this just by looping through the array once.

I've preserved my sorting solution as part 2.1.

It may be possible to improve parsing performance by using a faster json library. Several exist (eg search the nim forum).

---

### Day 14 for in/i14.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.63|
|   1    |     1.82| ✅ |      808       |                |
|   2    |    13.70| ✅ |     26625      |                |
|  2.1   |   108.15| ✅ |     26625      |                |
|  Time  |   124.42|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.07|
|   1    |     0.01| ✅ |    5878678     |                |
|   2    |     0.75| ✅ | 11796491041245 |                |
|  2.1   |   836.17| ✅ | 11796491041245 |                |
|  Time  |   837.06|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

### Day 16 for in/i16.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.56|
|   1    |    78.70| ✅ |      1850      |                |
|   2    |    73.67| ✅ |      2306      |                |
|  Time  |   153.01|

 Part 1.1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2.1: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes. Credit to MichalMarsalek who has many excellent Nim solutions). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

Part 2.2: The walk proc was actually pretty fast for part 1, but very very slow for part 2 (~50 seconds!). The 2.2 solution is actually a bit slower on part 1, but much much faster on part 2! The approach is to do a recursive walk very similar to part 1, but instead of returning the max pressure, save the pressures to a count table keyed on valve state. Then sort the keys by count and find the pair of disjoint valve states that yield the highest sum.

Part 1.3 & 2.3: Refactored the sets to be set[int8] instead of HashSet[string]. This improved the run-time! Before (last timing): 912.69ms for part 1, and 753.24ms for part 2, now: ~85ms for part 1 and ~78ms for part 2! So current perf progression:

- version 1: part 1: 500-1500ms, part 2: ~50 seconds (memoized walk)
- version 2: part 1: ~900ms, part 2: ~~750ms (walk and calcpress)
- version 3: part 1: ~85ms, part 2: ~78ms (`HashSet[string]` -> `set[int8]`)

---

### Day 17 for in/i17.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.06|
|   1    |     3.75| ✅ |      3227      |                |
|   2    |     8.06| ✅ | 1597714285698  |                |
|  Time  |    11.93|

 Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2 the same day. From running the part 1 code with visualization, the tower structure repeats. I poked the AoC subreddit and some people inspect it visually, and some people detected repeating patters. I tried to detect a repeating pattern. I have a cache that matches block- and char-offsets to block-number, and another that matches block-number to total height (that's just a seq, since both start at 0). My current solution works but there's a subtle bug that makes it fail for the test data for 2022 iterations.

---

### Day 18 for in/i18.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.76|
|   1    |     0.33| ✅ |      4314      |                |
|   2    |     5.61| ✅ |      2444      |                |
|  Time  |     6.74|

 Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!

Part 2: Part 2 took slightly more thought that part 1 (where the naive solution worked well enough). In part 2 I did a bfs around the outside of the cube set, and then did the surface calculation using the set of exterior water cubes as check. There's probably room to make a faster implementation and/or approach, but the first thing worked well enough. I expect harder 3D puzzles in the near future.

Part 2.2: There is a minor improvement where the exposed surfaces are counted during the bfs around the exterior of the droplet, instead of afterwards.

---

### Day 19 for in/i19.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     0.07|
|   1    |   982.36| ✅ |      1487      |                |
|   2    |   820.76| ✅ |     13440      |                |
|  Time  |  1803.30|

 Part 1: Apparently others used various solvers, but I did a brute force bfs over the possible siimulation states. Just define each node of a graph as a possible state, and each adjacent node are the states reachable from it (eg get more resources, get more resources and build each kind of bot, etc). Slight optimizations are to cap the amount of excess resources so degenerate states map to the same node, and if you can build a geode bot always and only do that.

Part 2: This was really easy after part 1! Just run it for longer on fewer blueprints!

---

### Day 20 for in/i20.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     1.33|
|   1    |    23.34| ✅ |      2827      |                |
|   2    |   220.59| ✅ | 7834270093909  |                |
|  Time  |   245.35|

 Part 1: This _should_ have been straightforward, but I messed up calculating the final answer and was sure the problem was in my move logic. I was looking in an array of ids (the initial offsets) instead of the true values, and they happened to coincidentally sum to the correct answer for the test data some of the time.

Part 2: Once part 1 was working, part 2 was very quick. Bumping up the sizes of numbers can cause issues in nim (eg int -> int64 or int128) but it didn't happen this time. My implementation is pretty slow, but after d16 my standards for "too slow" have relaxed a lot.

---

### Day 21 for in/i21.txt
|  Part  | Time(ms)| ?  |     Answer     |    Expected    |
|:------:|--------:|:--:|----------------|----------------|
|  Prep  |     1.41|
|   1    |     0.19| ✅ |160274622817992 |                |
|   2    |     0.34| ✅ | 3087390115721  |                |
|  Time  |     2.00|

 Part 1: First thought: make a graph and walk it! Wait it's just a tree. Can we do that recursively or will we go too deep? I wrote a naively simple recursive proc, but it worked first try.

Part 2: Poking the AoC subbreddit I found suggestions for using complex numbers in python (Credit: redditors Biggergig and Anton31Kah). The idea is to set the "humn" number to 1i, and then run the recursion for the left and right half. To find the answer, take the difference of the real components divided by the sum of the imaginary components. Note that there's a potential complication if something like "humn * humn" ever appears, but it didn't. I was using ints, so first I tried using arrays of 2 ints but then I found I didn't want to implement complex division, so I switched to std/complex which worked great.

---

Total Time:   3218.68ms

