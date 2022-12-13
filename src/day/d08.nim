## https://adventofcode.com/2022/day/8
include ../lib/imps

day 8:
  let # extra allocations here...
    input = path.readFile.splitlines.toSeq2iChar.mapit(it.map(parseint))
    width = input[0].high
    height = input.high
    corner = [width,height]

  part 1:
    answerT 21
    answer 1854
    var visible = initSet2i()

    proc walk(start,dir:Vec2i) =
      var
        pos = start
        h = -1
      while pos.aabb(ori2i,corner):
        if input[pos] > h:
          h = input[pos]
          visible.incl pos
        pos += dir

    for y in 0..height:
      walk [0,y], [1,0]
      walk [width,y], [-1,0]
    for x in 0..width:
      walk [x,0], [0,1]
      walk [x,height], [0,-1]

    decho visible.draw
    visible.card

  part 2:
    answer 527340
    answerT 8
    var best = 1
    for y in 1..<height:
      for x in 1..<width:
        var curr = 1
        let
          start = [x,y]
          h = input[start]
        if h < 4: continue
        for dir in dirs2d4:
          var
            count = 0
            pos = start + dir
          while pos.aabb(ori2i, corner):
            inc count
            if input[pos] >= h: break
            pos += dir
          curr *= count
        if curr > best:
          best = curr
    best