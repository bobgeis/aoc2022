## https://adventofcode.com/2022/day/9
include ../lib/imps

day 9:

  let moves = collect:
    for line in path.readFile.splitlines:
      let (_,a,x) = line.scantuple("$w $i")
      (a.todir,x)

  proc domoves(n:int):int =
    var
      rope = (1..n).mapit(ori2i)
      visited = [ori2i].toHashSet
    for m in moves:
      for _ in 0..<m[1]:
        rope[0] += m[0]
        for i in 1..rope.high:
          let diff = rope[i-1] - rope[i]
          if dmdist(diff) <= 1: break
          let change = [diff[0].cmp(0),diff[1].cmp(0)]
          rope[i] += change
          if i == rope.high:
            visited.incl rope[i]
    visited.card

  part 1: domoves(2)

  answer 1: 6243
  answer 1, "t1": 13

  part 2: domoves(10)

  answer 2: 2630
  answer 2, "t2": 36