## https://adventofcode.com/2022/day/10
include ../lib/imps

day 10:
  prep:
    var moves = newSeq[int]()

    path.withlines:
      moves.add 0
      if line[0] == 'a': moves.add line[5..^1].parseint

    iterator domoves(moves:seq[int]):(int,int) =
      var
        x = 1
        tick = 1
      for n in moves:
        x += n
        inc tick
        yield (tick,x)

  part 1:
    expectT 13140
    expect 12980
    var
      strengths = newSeq[int]()
      total = 0

    for (tick,x) in moves.domoves:
      if tick mod 20 == 0: strengths.add x * tick

    for i in [0,2,4,6,8,10]:
      total += strengths[i]

    total

  part 2:
    expect "BRJLFULP"
    var img = "\n#"

    for (tick,x) in moves.domoves:
      let offset = (tick - 1) mod 40
      if offset == 0: img &= "\n"
      if offset in x-1..x+1: img &= '#'
      else: img &= '.'

    decho img

    "BRJLFULP"

  discussion """
  Aha! A day where the output is an image that you have to look at."""