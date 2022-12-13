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
      if u in map and map[u] <= h + 1: result.add u

  proc fin(paths:Table[Vec2i,(int,Vec2i)], v:Vec2i):bool =
    v == finish

  part 1:
    bfs(start,adjs,fin)[finish][0]
  answer 1: 534
  answer 1, "t1": 31