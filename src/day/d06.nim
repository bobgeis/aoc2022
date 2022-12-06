## https://adventofcode.com/2022/day/6
include ../lib/imps

day 6:
  let input = path.readFile

  proc walk(n:int):int =
    for i in 0..input.len-n:
      let bs = input[i..i+n-1].tobitset
      if bs.card == n:
        return i + n
    return -1

  part 1: walk(4)

  answer 1: 1210
  answer 1, "t1": 7

  part 2: walk(14)

  answer 2: 3476
  answer 2, "t1": 19