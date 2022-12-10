## https://adventofcode.com/2022/day/9
include ../lib/imps

day 9:

  let
    input = path.readFile.splitlines
    moves = collect():
      for line in input:
        let
          (_,a,x) = line.scantuple("$w $i")
          dir = case a:
            of "U": [0,-1]
            of "D": [0,1]
            of "R": [1,0]
            else: [-1,0]
        (dir,x)

  part 1:

    var
      head = [0,0]
      tail = [0,0]
      visited = [tail].toHashSet()

    proc move(m:(Vec2i,int)) =
      for i in 0..< m[1]:
        let last = head
        head += m[0]
        if dmdist(head,tail) > 1:
          tail = last
          visited.incl tail

    for m in moves:
      m.move

    visited.card

  answer 1: 6243
  answer 1, "t1": 13

  part 2:

    var
      rope = (0..9).mapit(ori2i)
      visited2 = [rope[0]].toHashSet()

    proc step(d:Vec2i) =
      rope[0] += d
      for i in 1..rope.high:
        let diff = rope[i-1] - rope[i]
        if dmdist(diff) <= 1: break
        let change = [diff[0].cmp(0),diff[1].cmp(0)]
        rope[i] += change
        if i == rope.high:
          visited2.incl rope[i]

    proc move2(m:(Vec2i,int)) =
      for i in 0..<m[1]:
        step(m[0])

    for m in moves:
      m.move2

    visited2.card

  answer 2: 2630
  answer 2, "t2": 36