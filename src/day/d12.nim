## https://adventofcode.com/2022/day/12
include ../lib/imps

day 12:

  prep:
    let input = path.lines.toseq
    var
      start: Vec2i
      finish: Vec2i
      map = initTab2i[int]()

    for y,l in input:
      for x,c in l:
        case c:
          of 'S':
            map[x,y] = 0
            start = [x,y]
          of 'E':
            map[x,y] = 25
            finish = [x,y]
          else: map[x,y] = c.ord - 'a'.ord

    proc adjs(v:Vec2i):seq[Vec2i] =
      let h = map[v]
      for u in v.getAdj4:
        if u in map and map[u] >= h - 1: result.add u

  part 1:
    answerT 31
    answer 534
    proc fin(paths:Table[Vec2i,(int,Vec2i)], v:Vec2i):bool =
      v == start
    bfs(finish,adjs,fin)[start][0]

  part 2:
    answerT 29
    answer 525
    var dist:int
    proc fin(paths:Table[Vec2i,(int,Vec2i)],v:Vec2i):bool =
      if map[v] == 0:
        dist = paths[v][0]
        return true
      else: return false
    discard bfs(finish,adjs,fin)
    dist

  discussion """
    A chance to use graphwalk.bfs!

    There was a bug with my initial implementation that
    made part 1 take way too long.

    There's still lots of room for improvement, but it works
    decently for now.
  """