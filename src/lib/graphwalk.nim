
import std/[algorithm, deques, heapqueue, math, sets, sugar, tables]

import bedrock, shenanigans

proc bfs*[T](
    start:T,
    adjs:(T) -> seq[T],
    fin:(Table[T,(int,T)],T) -> bool = alwaysFalse) =
  ## breadth-first-search: give a start node, a callback to get a list of adjacent nodes, and an optional early end callback. Returns a paths table that maps every reachable node to its distance from the start node and the node it was reached from.
  var
    marked = initHashSet[T]()
    q = initDeque[(int,T)]()
    paths = initTable[T,(int,T)]()
  paths[start] = (0,start)
  q.addLast((0,start))
  while q.len > 0:
    let (cost,n) = q.popFirst
    if paths.fin(n): return
    else: marked.incl n
    for m in n.adjs:
      if m in marked: continue
      paths[m] = (cost + 1, n)
      q.addLast((cost + 1, m))
  return paths

proc walkPath*[A:SomeNumber;T](paths:Table[T,(A,T)],stop:T):seq[T] =
  ## Give a paths table (like from `bfs`) and a stop node, get the full path from the paths table's start node to the stop node, if it has been found.
  if stop notin paths: return @[]
  result.add stop
  var (_,curr) = paths[stop]
  while true:
    (_,curr) ..=! paths[curr]
    if curr == result[^1]: break
    result.add curr
  result.reverse
