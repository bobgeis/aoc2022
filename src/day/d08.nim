## https://adventofcode.com/2022/day/8
include ../lib/imps

day 8:
  let
    input = path.readFile.splitlines.toSeq2iChar.mapit(it.map(parseint))
    width = input[0].high
    height = input.high

  part 1:
    var visible = [[0,0],[0,height],[width,0],[width,height]].toHashSet

    for y in 1..<height:
      var h = -1
      for x in 0..width:
        if input[x,y] > h:
          visible.incl [x,y]
          h = input[x,y]
      h = -1
      for x in countdown(width,0):
        if input[x,y] > h:
          visible.incl [x,y]
          h = input[x,y]

    for x in 1..<width:
      var h = -1
      for y in 0..height:
        if input[x,y] > h:
          visible.incl [x,y]
          h = input[x,y]
      h = -1
      for y in countdown(height,0):
        if input[x,y] > h:
          visible.incl [x,y]
          h = input[x,y]

    decho visible.drawSetSimple
    visible.card

  answer 1: 1854
  answer 1, "t1": 21

  part 2:
    let corner = [width,height]
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
            pos = start
          while true:
            pos += dir
            if not pos.aabb(ori2i, corner): break
            count += 1
            if input[pos] >= h: break
          curr = curr * count
        if curr > best:
          best = curr

    best
  answer 2: 527340
  answer 2, "t1": 8