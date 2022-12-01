## https://adventofcode.com/2022/day/1
include ../lib/imps

day 1:
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
  part 1: elves.max
  answer 1, "t1": 24000
  answer 1: 68923

  elves.sort
  part 2: elves[^3..^1].sum
  answer 2, "t1": 45000
  answer 2: 200044