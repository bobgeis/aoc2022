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

  var
    head = [0,0]
    tail = [0,0]
    visited = [tail].toHashSet()

  proc drawC(v:Vec2i):char =
      if v == head: 'H'
      elif v == tail: 'T'
      elif v in visited: '#'
      else: '.'
  # decho visited.draw(drawC)

  proc move(m:(Vec2i,int)) =
    for i in 0..< m[1]:
      let last = head
      head += m[0]
      if dmdist(head,tail) > 1:
        tail = last
        visited.incl tail


  for m in moves:
    m.move



  part 1: visited.card
  answer 1: 6243
  answer 1, "t1": 13




  part 2: 2
  # answer 2:
  answer 2, "t1": 36