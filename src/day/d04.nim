## https://adventofcode.com/2022/day/4
include ../lib/imps

day 4:

  prep:
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
    answers {inp:462, t1:2}
    contained


  part 2:
    answers {inp:835, t1:4}
    overlaps
