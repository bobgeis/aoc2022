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
    expectT 24000
    expect 68923
    elves.max

  elves.sort
  part 2:
    expectT 45000
    expect 200044
    elves[^3..^1].sum