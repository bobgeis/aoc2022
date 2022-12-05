## https://adventofcode.com/2022/day/4
include ../lib/imps

day 4:

  var
    contained = 0
    overlaps = 0

  path.withLines:
    let (success,low1,high1,low2,high2) = line.scanTuple("$i-$i,$i-$i")

    if (low1 >= low2 and high1 <= high2) or
        (low1 <= low2 and high1 >= high2):
      inc contained

    if low1 <= high2 and high1 >= low2:
      inc overlaps

  part 1:
    contained

  answer 1: 462
  answer 1, "t1": 2

  part 2:
    overlaps

  answer 2: 835
  answer 2, "t1": 4