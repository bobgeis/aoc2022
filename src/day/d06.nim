## https://adventofcode.com/2022/day/6
include ../lib/imps

day 6:

  prep:
    let input = path.readFile

    proc walk(n:int):int =
      for i in 0..input.len-n:
        if n == input[i..i+n-1].tobitset.card:
          return i + n

  part 1:
    answers {inp:1210, t1:7}
    walk(4)


  part 2:
    answers {inp:3476, t1:19}
    walk(14)