## https://adventofcode.com/2022/day/1
include ../lib/imps

day 1:

  prep:
    let input = path.readFile.splitLines
    var
      elf = 0
      elves: seq[int] = @[]
    for line in input:
      if line == "":
        elves.add elf
        elf = 0
      else:
        elf += line.parseInt
    elves.add elf

  part 1:
    answers {inp:68923, t1:24000}
    elves.max

  elves.sort
  part 2:
    answers {inp:200044, t1:45000}
    elves[^3..^1].sum