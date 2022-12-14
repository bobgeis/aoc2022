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
    expectT 2
    expect 462
    contained


  part 2:
    expectT 4
    expect 835
    overlaps
