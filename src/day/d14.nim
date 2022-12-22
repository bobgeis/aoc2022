## https://adventofcode.com/2022/day/14
include ../lib/imps

day 14:
  prep:
    proc parseline(ss:string):seq[Vec2i] =
      for s in ss.split(" -> "):
        let (_,x,y) = s.scantuple("$i,$i")
        result.add [x,y]
    proc makemap(ss:seq[seq[Vec2i]]):Tab2i[char] =
      for s in ss:
        for i in 1..s.high:
          for v in countbetween(s[i-1],s[i]):
            result[v] = '#'

    let
      map = path.lines.toseq.mapit(it.parseline).makemap
      initsand = [500,0]
      grav = [[0,1],[-1,1],[1,1]]
      ymax = map.getMinMax[1][1]

    decho map.draw

  part 1:
    answers {inp:808, t1:24}
    var
      map = map
      count = 0
      falling,running = true
    while running:
      falling = true
      var
        sand = initsand
      while falling:
        falling = false
        if sand.y >= ymax:
          running = false
          break
        for dir in grav:
          if dir + sand notin map:
            sand += dir
            falling = true
            break
        if not falling:
          map[sand] = 'O'
          inc count
          break
    count

  part 2:
    answers {inp:26625, t1:93}
    let ymax = ymax + 2
    proc adjs(v:Vec2i):seq[Vec2i] =
      for u in [[1,1],[-1,1],[0,1]]:
        let w = u + v
        if w.y != ymax and w notin map: result.add w
    initsand.dfs(adjs).len

  part 2.1:
    answers {inp:26625, t1:93}
    let ymax = ymax + 2
    var
      map = map
      count = 0
      falling = true
    while true:
      falling = true
      var
        sand = initsand
      if sand in map: break
      while falling:
        falling = false
        if sand.y == ymax:
          map[sand] = 'O'
          break
        for dir in grav:
          if dir + sand notin map:
            sand += dir
            falling = true
            break
        if not falling:
          map[sand] = 'O'
          inc count
          break
    count

  note """
Naive "simulate each sand grain as it falls" works decently. Part 2 took 90-150ms, so slowest by a long shot, but doable. Lots of room for improvement of course... First implementation had little code re-use and the parsing was messy.

Second implementation of part 2 used depth-first-search and improved run time by about 10X. Pretty decent. The first impl is left as "part 2.1"
"""