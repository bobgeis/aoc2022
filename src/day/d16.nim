## https://adventofcode.com/2022/day/16
include ../lib/imps

day 16:
  prep:

    var voff = 1'i8
    var valveset = initHashSet[string]()
    var vtoint = initTable[string,int8]()
    var vset:set[int8] = {}
    var vrates = initTable[int8,int]()
    var graph = initTable[string,seq[string]]()
    proc todata(path:string)=
      for line in path.lines:
        let (_,valve,rate,valves) = line.scantuple("Valve $w has flow rate=$i; tunnels lead to valves $*")
        if rate > 0:
          let v = voff
          inc voff
          valveset.incl valve
          vtoint[valve] = v
          vset.incl v
          vrates[v] = rate
        if valves.len > 0: graph[valve] = valves.split(", ")
        else: # "valves" != "valve": we need the last 2 chars
          graph[valve] = @[line[^2..^1]]

    path.todata

    proc adjs(valve:string):seq[string] = graph[valve]
    var vdists = initTable[int8,Table[int8,int]]()

    block:
      let paths = "AA".bfs(adjs)
      var tab = initTable[int8,int]()
      for valve in valveset:
        let
          v = vtoint[valve]
          d = paths[valve][0] + 1
        tab[v] = d
      vdists[0] = tab
    for valve1 in valveset:
      let
        paths = valve1.bfs(adjs)
        v1 = vtoint[valve1]
      var tab = initTable[int8,int]()
      for valve2 in valveset:
        let
          v2 = vtoint[valve2]
          d = paths[valve2][0] + 1
        tab[v2] = d
      vdists[v1] = tab



  part 1:
    expectT 1651
    expect 1850

    # use the memoized version to make this work for part 2
    # but the memoization doesn't get used for part 1 and slows it down
    # proc walk(curr:int8,time:int,valves:set[int8],elephant:bool=false):int {.memoized.}=
    proc walk(curr:int8,time:int,valves:set[int8],elephant:bool=false):int=
      let valves = valves - {curr}
      for v in valves:
        let t = time - vdists[curr][v]
        if t > 0: result.max=(vrates[v] * t + walk(v,t,valves,elephant))
      if elephant: result.max=(walk(0, 26, valves, false))
    walk(0,30,vset)

  part 2:
    expectT 1707
    expect 2306

    var presses = initCountTable[set[int8]]()
    proc calcpress(curr:int8,time,press:int,vs,done:set[int8]) =
      presses[done] = max(press,presses.getordefault(done,0))
      for v in vs:
        let t = time - vdists[curr][v]
        if t <= 0: continue
        calcpress(v,t,press + t * vrates[v],vs - {v},done + {v})
    calcpress(0'i8,26,0,vset,{})
    presses.sort
    let ps = presses.pairs.toseq
    var best = 0
    for i,p in ps:
      let (k1,v1) = p
      if v1 * 2 < best: break
      for j in i..ps.high:
        var subbest = 0
        let (k2,v2) = ps[j]
        if (k1 * k2).card == 0:
          if v1 + v2 < subbest: break
          subbest = v1 + v2
          if subbest > best: best = subbest
    best

  note """
Part 1.1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2.1: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes. Credit to MichalMarsalek who has many excellent Nim solutions). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

Part 2.2: The walk proc was actually pretty fast for part 1, but very very slow for part 2 (~50 seconds!). The 2.2 solution is actually a bit slower on part 1, but much much faster on part 2! The approach is to do a recursive walk very similar to part 1, but instead of returning the max pressure, save the pressures to a count table keyed on valve state. Then sort the keys by count and find the pair of disjoint valve states that yield the highest sum.

Part 1.3 & 2.3: Refactored the sets to be set[int8] instead of HashSet[string]. This improved the run-time! Before (last timing): 912.69ms for part 1, and 753.24ms for part 2, now: ~85ms for part 1 and ~78ms for part 2! So current perf progression:

- version 1: part 1: 500-1500ms, part 2: ~50 seconds
- version 2: part 1: ~900ms, part 2: ~~750ms
- version 3: part 1: ~85ms, part 2: ~78ms
"""