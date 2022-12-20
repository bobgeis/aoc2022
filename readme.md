
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


## All Days at #40e59e4
- optimized release
- skipping extra parts

|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |
|---|--------:|--------:|--------:|:--:|--------:|:--:|
|d00|     0.23|     0.21|     0.00| ✅ |     0.00| ✅ |
|d01|     0.54|     0.51|     0.00| ✅ |     0.00| ✅ |
|d02|     0.34|     0.33|     0.00| ✅ |     0.00| ✅ |
|d03|     0.51|     0.34|     0.12| ✅ |     0.05| ✅ |
|d04|     0.38|     0.37|     0.00| ✅ |     0.00| ✅ |
|d05|     0.52|     0.40|     0.02| ✅ |     0.09| ✅ |
|d06|     0.47|     0.18|     0.06| ✅ |     0.23| ✅ |
|d07|     0.52|     0.50|     0.01| ✅ |     0.00| ✅ |
|d08|     2.29|     1.41|     0.36| ✅ |     0.51| ✅ |
|d09|     2.07|     0.63|     0.95| ✅ |     0.48| ✅ |
|d10|     0.19|     0.17|     0.00| ✅ |     0.00| ✅ |
|d11|    21.05|     0.34|     0.03| ✅ |    20.67| ✅ |
|d12|     6.97|     1.25|     2.47| ✅ |     3.22| ✅ |
|d13|     2.30|     2.13|     0.04| ✅ |     0.11| ✅ |
|d14|    16.66|     0.85|     2.00| ✅ |    13.79| ✅ |
|d15|     1.01|     0.22|     0.01| ✅ |     0.77| ✅ |
|d16| 46994.76|     0.92|   931.21| ✅ | 46062.59| ✅ |
|d17|    20.43|     0.32|     7.15| ✅ |    12.94| ✅ |
|d18|     9.19|     1.20|     0.34| ✅ |     7.64| ✅ |
|d19|  2012.86|     0.26|  1132.76| ✅ |   879.82| ✅ |
|d20|   258.23|     1.79|    22.81| ✅ |   233.62| ✅ |
|All| 61708.25|


## All Days at #40e59e4
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
| Time  |     0.28|

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
| Prep  |     0.24|
|   1   |     0.00| ✅ |   12276    |            |
|   2   |     0.00| ✅ |    9975    |            |
| Time  |     0.28|
---

### Day 3 for in/i03.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.27|
|   1   |     0.08| ✅ |    7691    |            |
|   2   |     0.03| ✅ |    2508    |            |
| Time  |     0.42|
---

### Day 4 for in/i04.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.25|
|   1   |     0.00| ✅ |    462     |            |
|   2   |     0.00| ✅ |    835     |            |
| Time  |     0.29|
---

### Day 5 for in/i05.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.29|
|   1   |     0.02| ✅ | SHMSDGZVC  |            |
|   2   |     0.10| ✅ | VRZGHDFBQ  |            |
| Time  |     0.45|
---

### Day 6 for in/i06.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.09|
|   1   |     0.06| ✅ |    1210    |            |
|   2   |     0.24| ✅ |    3476    |            |
| Time  |     0.44|
---

### Day 7 for in/i07.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.38|
|   1   |     0.00| ✅ |  1908462   |            |
|   2   |     0.00| ✅ |  3979145   |            |
| Time  |     0.43|

 The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!

---

### Day 8 for in/i08.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.26|
|   1   |     0.36| ✅ |    1854    |            |
|   2   |     0.50| ✅ |   527340   |            |
| Time  |     2.15|

 In retrospect, part 1 and part 2 could probably have each used the same kind of `ray` function. But instead I did part 1 by walking across the whole forest from each direction and then part 2 by walking out from each spot. There's probably improvements that can be done here.

---

### Day 9 for in/i09.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.39|
|   1   |     0.90| ✅ |    6243    |            |
|   2   |     0.50| ✅ |    2630    |            |
| Time  |     1.84|

 My first implementation had a bug where it didn't correctly account for intermediate knots being pulled diagonally.

---

### Day 10 for in/i10.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.17|
|   1   |     0.00| ✅ |   12980    |            |
|   2   |     0.00| ✅ |  BRJLFULP  |            |
| Time  |     0.22|

 Aha! A day where the output is an image that you have to look at.

---

### Day 11 for in/i11.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.32|
|   1   |     0.03| ✅ |   110264   |            |
|   2   |    19.59| ✅ |23612457316 |            |
| Time  |    20.01|

 My first implementation used scanTuple for parsing and it quickly became cumbersome. Scanf is actually much cleaner when you have multiple potential strings to match and it works well with doAssert.

I used a trick from earlier years where you multiply all the period of all the loops together to get the period of a much larger loop. This larger period is big, but it still fits into an int, so we don't worry about overflow.

Also remember that args known at compile time can be defined as `static` to save a little bit of work at run-time.

---

### Day 12 for in/i12.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.04|
|   1   |     2.31| ✅ |    534     |            |
|   2   |     2.80| ✅ |    525     |            |
| Time  |     6.26|

 A chance to use graphwalk.bfs!

There was a bug with my initial implementation that made part 1 take way too long.

My first part 1 solution did bfs from start to finish, but part 2 is easier to do via bfs from the finish towards any 'a', so I reversed part 1 to allow them to share code.

There's still lots of room for improvement, but it works decently for now.

---

### Day 13 for in/i13.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     2.05|
|   1   |     0.05| ✅ |    5557    |            |
|   2   |     0.10| ✅ |   22425    |            |
|  2a   |     0.54| ✅ |   22425    |            |
| Time  |     2.82|

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
| Prep  |     2.00|
|   1   |     3.22| ✅ |    808     |            |
|   2   |    14.84| ✅ |   26625    |            |
|  2.1  |   117.07| ✅ |   26625    |            |
| Time  |   137.30|

 Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"

---

### Day 15 for in/i15.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.20|
|   1   |     0.02| ✅ |  5878678   |            |
|   2   |     0.85| ✅ |11796491041245|            |
|  2.1  |   851.76| ✅ |11796491041245|            |
| Time  |   853.00|

 Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!

---

### Day 16 for in/i16.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.70|
|   1   |   871.69| ✅ |    1850    |            |
|   2   | 50249.24| ✅ |    2306    |            |
| Time  | 51121.99|

 Part 1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

TODO: speed up part 2.

---

### Day 17 for in/i17.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.23|
|   1   |     4.23| ✅ |    3227    |            |
|   2   |     8.31| ✅ |1597714285698|            |
| Time  |    12.92|

 Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2 the same day. From running the part 1 code with visualization, the tower structure repeats. I poked the AoC subreddit and some people inspect it visually, and some people detected repeating patters. I tried to detect a repeating pattern. I have a cache that matches block- and char-offsets to block-number, and another that matches block-number to total height (that's just a seq, since both start at 0). My current solution works but there's a subtle bug that makes it fail for the test data for 2022 iterations.

---

### Day 18 for in/i18.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.98|
|   1   |     0.39| ✅ |    4314    |            |
|   2   |     7.50| ✅ |    2444    |            |
| Time  |     8.96|

 Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!

Part 2: Part 2 took slightly more thought that part 1 (where the naive solution worked well enough). In part 2 I did a bfs around the outside of the cube set, and then did the surface calculation using the set of exterior water cubes as check. There's probably room to make a faster implementation and/or approach, but the first thing worked well enough. I expect harder 3D puzzles in the near future.

Part 2.2: There is a minor improvement where the exposed surfaces are counted during the bfs around the exterior of the droplet, instead of afterwards.

---

### Day 19 for in/i19.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     0.24|
|   1   |  1160.29| ✅ |    1487    |            |
|   2   |   884.22| ✅ |   13440    |            |
| Time  |  2044.92|

 Part 1: Apparently others used various solvers, but I did a brute force bfs over the possible siimulation states. Just define each node of a graph as a possible state, and each adjacent node are the states reachable from it (eg get more resources, get more resources and build each kind of bot, etc). Slight optimizations are to cap the amount of excess resources so degenerate states map to the same node, and if you can build a geode bot always and only do that.

Part 2: This was really easy after part 1! Just run it for longer on fewer blueprints!

---

### Day 20 for in/i20.txt
| Part  |Time(ms) | ?  |   Answer   |  Expected  |
|:-----:|--------:|:--:|------------|------------|
| Prep  |     1.81|
|   1   |    23.03| ✅ |    2827    |            |
|   2   |   220.54| ✅ |7834270093909|            |
| Time  |   245.59|

 Part 1: This _should_ have been straightforward, but I insisted on looking for number in the distance map, instead of in the final array, but decided the bug must have been an issue with the move proc due to the fact that I'd sometimes get the right answer anyway (lots of small ints all in the same range can coincientally add to the same sum).

Part 2: Once part 1 was working, part 2 was very quick. Bumping up the sizes of numbers can cause issues in nim (eg int -> int64 or int128) but it didn't happen this time. My implementation is pretty slow, but after d16 my standards for "too slow" have relaxed a lot.

---

Total Time:  67583.53

