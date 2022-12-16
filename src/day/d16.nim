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
        if valves.len > 0:
          graph[valve] = valves.split(", ")
        else: # "valves" != "valve": we need the last 2 chars
          graph[valve] = @[line[^2..^1]]
      return (rates,graph)

    let (rates,graph) = path.process

    dump (rates["II"],rates["JJ"])
    dump (graph["II"],graph["JJ"])

  part 1:
    expectT 1651
    # expect 0
    "?"

