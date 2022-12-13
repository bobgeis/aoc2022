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
    answerT 2
    answer 462
    contained


  part 2:
    answerT 4
    answer 835
    overlaps
