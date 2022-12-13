## https://adventofcode.com/2022/day/12
include ../lib/imps

day 12:

  let input = path.lines.toseq
  var
    start: Vec2i
    finish: Vec2i
    map = initTab2i[int]()

  for y,l in input:
    for x,c in l:
      if c == 'S':
        map[x,y] = 0
        start = [x,y]
      elif c == 'E':
        map[x,y] = 25
        finish = [x,y]
      else: map[x,y] = c.ord - 'a'.ord

  proc adjs(v:Vec2i):seq[Vec2i] =
    let h = map[v]
    for u in v.getAdj4:
      if u in map and map[u] >= h - 1: result.add u

  part 1:
    proc fin(paths:Table[Vec2i,(int,Vec2i)], v:Vec2i):bool =
      v == start
    bfs(finish,adjs,fin)[start][0]
  answer 1: 534
  answer 1, "t1": 31

  part 2:
    var dist:int
    proc fin(paths:Table[Vec2i,(int,Vec2i)],v:Vec2i):bool =
      if map[v] == 0:
        dist = paths[v][0]
        return true
      else: return false
    discard bfs(finish,adjs,fin)
    dist
  answer 2: 525
  answer 2, "t1": 29