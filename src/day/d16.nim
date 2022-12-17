## https://adventofcode.com/2022/day/16
include ../lib/imps

day 16:
  prep:
    proc process(path:string):(Table[string,int],Table[string,seq[string]]) =
      var rates = initTable[string,int]()
      var graph = initTable[string,seq[string]]()
      path.withlines:
        let (_,valve,rate,valves) = line.scantuple("Valve $w has flow rate=$i; tunnels lead to valves $*")
        rates[valve] = rate
        if valves.len > 0: graph[valve] = valves.split(", ")
        else: # "valves" != "valve": we need the last 2 chars
          graph[valve] = @[line[^2..^1]]
      return (rates,graph)
    let (rates,graph) = path.process

    let nodes = rates.pairs.toseq.filterit(it[1]>0).mapit(it[0])
    var dists = initTable[string,Table[string,int]]()
    proc adjs(v:string):seq[string] = graph[v]

    block:
      let paths = "AA".bfs(adjs)
      dists["AA"] = collect(initTable()):
        for m in nodes: {m:paths[m][0] + 1}
    for n in nodes:
      let paths = n.bfs(adjs)
      dists[n] = collect(initTable()):
        for m in nodes: {m:paths[m][0] + 1}

    proc walk(curr:string,time:int,valves:HashSet[string],elephant:bool=false):int {.memoized.}=
      let valves = valves.difference([curr].toHashSet)
      for v in valves:
        let t = time - dists[curr][v]
        if t > 0: result.max=(rates[v] * t + walk(v,t,valves,elephant))
      if elephant: result.max=(walk("AA", 26, valves, false))

  part 1:
    expectT 1651
    expect 1850
    walk("AA",30,nodes.toHashSet)

  part 2:
    expectT 1707
    expect 2306
    walk("AA",26,nodes.toHashSet,elephant=true)


  note """
Part 1:
There are a lot of valves with 0 rates. This reminded me of 2019 day 18 a bit, but I wasn't immediately sure how to make use of them. Next I tried using algorithms.nextPermutation to try every combination of valves with non-zero rates. This worked fine for the test input but didn't finish on the actual input. Next I tried a recursive walk proc, and that worked, but it was slow (3.7 seconds on actual input!). I used bfs to create distance tables for the important valves, and that took it down to ~0.5 seconds.

Part 2: I was stuck for a while here, so I looked at others' answers online (cheating I know, so it goes). My answer is still very very slow. On the upside, I finally got to use the memo dep! It actually slows down part 1, but lets part 2 eventually finish.

TODO: speed up part 2.
"""