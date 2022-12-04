## https://adventofcode.com/2022/day/4
include ../lib/imps

day 4:

  var
    contained = 0
    overlaps = 0

  path.withLines:
    let (success,low1,high1,low2,high2) = line.scanTuple("$i-$i,$i-$i")

    # get contained count for part 1
    if low1 in low2..high2 and high1 in low2..high2: inc contained
    elif low2 in low1..high1 and high2 in low1..high1: inc contained

    # get overlaps count for part 2
    if low1 in low2..high2 or high1 in low2..high2: inc overlaps
    elif low2 in low1..high1 or high2 in low1..high1: inc overlaps

  part 1:
    contained

  answer 1: 462
  answer 1, "t1": 2

  part 2:
    overlaps

  answer 2: 835
  answer 2, "t1": 4