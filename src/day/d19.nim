## https://adventofcode.com/2022/day/19
include ../lib/imps

day 19:
  prep:
# Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 18 clay. Each geode robot costs 4 ore and 9 obsidian.

    type State = (Vec4i,Vec4i)
    const initState:State = ([1,0,0,0],[0,0,0,0]) # (bots,res)
    type Blue = object
      id: int
      costs: array[4,Vec4i]
      limits: Vec4i
    proc getdata(path:string):seq[Blue] =
      path.withlines:
        let (succ,
          id,
          ore4oreb,
          ore4clayb,
          ore4obsb,
          clay4obsb,
          ore4geob,
          obs4geob
          ) = line.scantuple("Blueprint $i: Each ore robot costs $i ore. Each clay robot costs $i ore. Each obsidian robot costs $i ore and $i clay. Each geode robot costs $i ore and $i obsidian.")
        let costs = [
          [ore4oreb,0,0,0],
          [ore4clayb,0,0,0],
          [ore4obsb,clay4obsb,0,0],
          [ore4geob,0,obs4geob,0],
          ]
        let limits = [
          mmax(ore4oreb,ore4clayb,ore4obsb,ore4geob),
          clay4obsb,
          obs4geob,
          100,
        ]
        result.add Blue(id:id, costs:costs, limits:limits)

    let blues = path.getdata

    proc doblue(blue:Blue,turns:int): int =
      {id,costs,limits} ..= blue
      var geodes = 0

      proc cap(v:Vec4i):Vec4i =
        ## this limits the total number of states to search by throwing away precise resource values after some maximum
        for i in 0..3:
          result[i] = min(v[i],limits[i]*2)

      proc adjs(s:State):seq[State] =
        let (bots,res) = s
        if res >= costs[3]: # if you can build a geob, do only that
          result.add (bots + [0,0,0,1],cap(res + bots - costs[3]))
        else:
          for i in 0..3: # try building every kind of robot you can
            if res >= costs[i] and bots[i] < limits[i]:
              result.add (bots + basis4i[i],cap(res + bots - costs[i]))
          result.add (bots,cap(res + bots))

      proc fin(paths:Paths[State],s:State):bool =
        if paths[s][0] > turns: return true
        geodes.max=(s[1][3])
        false

      discard initState.bfs(adjs,fin)
      geodes


  part 1:
    expectT 33
    expect 1487
    blues.mapit(it.id * it.doblue(24)).sum

