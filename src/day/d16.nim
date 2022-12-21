## https://adventofcode.com/2022/day/16
include ../lib/imps

day 16:
  prep:

    proc todata(path:string):(Table[string,int],Table[string,seq[string]]) =
      var rates = initTable[string,int]()
      var graph = initTable[string,seq[string]]()
      for line in path.lines:
        let (_,valve,rate,valves) = line.scantuple("Valve $w has flow rate=$i; tunnels lead to valves $*")
        rates[valve] = rate
        if valves.len > 0: graph[valve] = valves.split(", ")
        else: # "valves" != "valve": we need the last 2 chars
          graph[valve] = @[line[^2..^1]]
      return (rates,graph)

    let
      (rates,graph) = path.todata
      valves = rates.pairs.toseq.filterit(it[1]>0).mapit(it[0])
      valveset = valves.tohashset
      dists = block:
        var dists = initTable[string,Table[string,int]]()
        proc adjs(v:string):seq[string] = graph[v]
        let paths = "AA".bfs(adjs)
        dists["AA"] = collect(initTable()):
          for m in valves: {m:paths[m][0] + 1}
        for n in valves:
          let paths = n.bfs(adjs)
          dists[n] = collect(initTable()):
            for m in valves: {m:paths[m][0] + 1}
        dists

  part 1:
    expectT 1651
    expect 1850

    proc walk(curr:string,time:int,vs:HashSet[string],elephant:bool=false):int {.memoized.}=
      let vs = vs - curr
      for v in vs:
        let t = time - dists[curr][v]
        if t > 0: result.max=(rates[v] * t + walk(v,t,vs,elephant))
      # this was used for part 2 originally but it was very slow!
      if elephant: result.max=(walk("AA", 26, vs, false))

    walk("AA",30,valveset)

  part 2:
    expectT 1707
    expect 2306

    var presses = initCountTable[HashSet[string]]()
    proc calcpress(curr:string,time,press:int,vs,done:HashSet[string]) =
      presses[done] = max(press,presses.getordefault(done,0))
      for v in vs:
        let t = time - dists[curr][v]
        if t <= 0: continue
        calcpress(v,t,press + t * rates[v],vs - v,done + v)

    calcpress("AA",26,0,valveset,initHashSet[string]())
    presses.sort
    let ps = presses.pairs.toseq
    var best = 0
    for i,p in ps:
      let (k1,v1) = p
      if v1 * 2 < best: break
      for j in i..ps.high:
        var subbest = 0
        let (k2,v2) = ps[j]
        if disjoint(k1,k2):
          if v1 + v2 < subbest: break
          subbest = v1 + v2
          if subbest > best: best = subbest
    best

  note """
Part 1.1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2.1: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

Part 2.2: The walk proc was actually pretty fast for part 1, but very very slow for part 2 (~50 seconds!). The 2.2 solution is actually a bit slower on part 1, but much much faster on part 2! The approach is to do a recursive walk very similar to part 1, but instead of returning the max pressure, safe the pressures to a count table keyed on valve state. Then sort the keys by count and find the pair of disjoint valve states that yield the highest sum.

"""