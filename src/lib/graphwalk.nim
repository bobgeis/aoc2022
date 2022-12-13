
import std/[algorithm, deques, heapqueue, math, sets, sugar, tables]

import bedrock, shenanigans

proc bfs*[T](
    start:T,
    adjs:(T) -> seq[T],
    fin:(Table[T,(int,T)],T) -> bool = alwaysFalse):
    Table[T,(int,T)] =
  ## breadth-first-search: give a start node, a callback to get a list of adjacent nodes, and an optional early end callback. Returns a paths table that maps every reachable node to its distance from the start node and the node it was reached from.
  var q = initDeque[(int,T)]()
  result[start] = (0,start)
  q.addLast((0,start))
  while q.len > 0:
    let (cost,n) = q.popFirst
    for m in n.adjs:
      if m in result: continue
      result[m] = (cost + 1, n)
      if result.fin(m): return
      q.addLast((cost + 1, m))
  return result

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
