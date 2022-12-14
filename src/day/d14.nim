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
      input = path.lines.toseq.mapit(it.parseline)
      map = makemap(input)
      initsand = [500,0]
      grav = [[0,1],[-1,1],[1,1]]
      ymax = map.getMinMax[1][1]

    decho map.draw

  part 1:
    expectT 24
    expect 808
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