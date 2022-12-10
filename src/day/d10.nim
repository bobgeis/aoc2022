## https://adventofcode.com/2022/day/10
include ../lib/imps

day 10:

  var moves = newSeq[int]()

  path.withlines:
    moves.add 0
    if line[0] == 'a':
      let (_,_,n) = line.scantuple("$w $i")
      moves.add n

  part 1:
    var
      x = 1
      tick = 1
      strengths = newSeq[int]()
      total = 0

    for n in moves:
      x += n
      inc tick
      if tick mod 20 == 0:
        strengths.add x * tick

    for i in [0,2,4,6,8,10]:
      total += strengths[i]

    total
  answer 1: 12980
  answer 1, "t1": 13140

  part 2:
    var
      x2 = 1
      tick2 = 0
      img = "\n"

    for n in moves:
      x2 += n
      inc tick2
      if tick2 in x2-1..x2+1:
        img &= '#'
      else:
        img &= '.'
      if tick2 mod 40 == 0:
        tick2 = 0
        img &= "\n"

    decho img

    "BRJLFULP"
  answer 2: "BRJLFULP"

