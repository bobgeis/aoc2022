## https://adventofcode.com/2022/day/15
include ../lib/imps

day 15:
  prep:
    proc processdata(p:string):(Tab2i[int],seq[int],seq[int])=
      path.withlines:
        let (_,x1,y1,x2,y2) = line.scantuple("Sensor at x=$i, y=$i: closest beacon is at x=$i, y=$i")
        let
          s = [x1,y1]
          b = [x2,y2]
          d = mdist(s,b)
        result[0][s] = d
        result[1].add s.y - s.x + d + 1
        result[1].add s.y - s.x - d - 1
        result[2].add s.y + s.x + d + 1
        result[2].add s.y + s.x - d - 1

    let (scanners,aa,bb) = path.processdata

    proc mergeranges(rs:seq[(int,int)]):seq[(int,int)] =
      [lcurr,rcurr] ..=^ rs[0]
      for i in 1..rs.high:
        let nxt = rs[i]
        if nxt[0] <= rcurr + 1: # overlap
          if nxt[1] >= rcurr + 1: # push right
            rcurr = nxt[1]
        else: # no overlap
          result.add (lcurr,rcurr)
          [lcurr,rcurr] ..=! rs[i]
      result.add (lcurr,rcurr)

    proc getranges(y:int):seq[(int,int)] =
      for s,d in scanners.pairs:
        let width = d - abs(s.y - y)
        if width >= 0:
          result.add (s.x - width, s.x + width)
      result.sort
      return result.mergeranges

  part 1:
    answers {inp:5_878_678, t1:26}
    let y = if path.inputPathSuffix == "t1": 10
      else: 2_000_000
    getranges(y).mapit(it[1] - it[0]).sum

  part 2:
    answers {inp:11_796_491_041_245, t1:56_000_011}
    let limit = if path.inputPathSuffix == "t1": 20
        else: 4_000_000
    proc walk():Vec2i =
      for a in aa:
        for b in bb:
          if (b - a) mod 2 != 0: continue
          let v = [(b-a) div 2, (a+b) div 2]
          if v.aabb(ori2i, [limit,limit]):
            let rs = getranges(v.y)
            if rs.len > 1: return [rs[0][1] + 1, v.y]
    walk().foldl(a * 4_000_000 + b)

  part 2.1:
    answers {inp:11_796_491_041_245, t1:56_000_011}
    let limit = if path.inputPathSuffix == "t1": 20
      else: 4_000_000
    proc walk():Vec2i =
      for y in countdown(limit,0):
        let rs = getranges(y)
        if rs.len > 1: return [rs[0][1] + 1, y]
    walk().foldl(a * 4_000_000 + b)

  note """
Part 1 took an unusually large amount of time because I misread the initial y value as being 20_000 and not 2_000_000! Once I realized, it was fast.

My initial solution for part 2 took over 900ms to run! It basically ran the code for part 1 over every row until it found a hit. Very slow! It is kept here as Part 2.1 unless/until having it slow everything down gets too annoying.

My second solution to part 2 followed the advice of redditor i_have_no_biscuits. They recommend treating each scanner as a set of four diagonal lines bounding their scanned area. Eg: y = x + a1, y = x +a2, y = -x + b1, y = -x + b2. Then you just need to check the spots where they intersect!
"""