
import std/[algorithm, deques, heapqueue, math, sets, sugar, tables]

import bedrock, shenanigans

type
  Paths*[T] = Table[T,(int,T)]

proc bfs*[T](
    start:T,
    adjs:(T) -> seq[T],
    fin:(Paths[T],T) -> bool = alwaysFalse
    ):Paths[T] =
  ## breadth-first-search: Given a start node, a callback to get a list of adjacent nodes, and an optional early end callback. Returns a paths table that maps every reachable node to its distance from the start node and the node it was reached from.
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

proc dfs*[T](
    start:T,
    adjs:(T) -> seq[T],
    fin:(Paths[T],T) -> bool = alwaysFalse
    ):Paths[T] =
  ## depth-first-search: Given a start node, a callback to get a list of adjacent nodes, and an optional early end callback. Returns a paths table that maps every reachable node to its distance from the start node and the node it was reached from.
  var q = initDeque[(int,T)]()
  result[start] = (0,start)
  q.addLast((0,start))
  while q.len > 0:
    let (cost,n) = q.popLast
    for m in n.adjs:
      if m in result: continue
      result[m] = (cost + 1, n)
      if result.fin(m): return
      q.addLast((cost + 1, m))
  return result

type
  DjPaths*[A,T] = Table[T,(A,T)]
  DjPair*[A,T] = (A,T) ## This is used to disambiguate which `<` is used by the heapqueue.

proc djPair[A,T](a:A,t:T):DjPair[A,T] {.inline.} = (a,t)
proc `<`*[A,T](a,b:DjPair[A,T]):bool = a[0] < b[0]

proc dijkstra*[A,T](
    start:T,
    adjs:(T) -> seq[(A,T)],
    fin:(DjPaths[A,T],T) -> bool = alwaysFalse
    ): DjPaths[A,T] =
  var
    marked = initHashSet[T]()
    q = initHeapQueue[DjPair[A,T]]()
    paths = initTable[T,(A,T)]()
  paths[start] = (A.default,start)
  q.push(djPair(A.default,start))
  while q.len > 0:
    let (cost,n) = q.pop
    if n in marked: continue
    elif paths.fin(n): return paths
    else:
      marked.incl n
    for (c,m) in n.adjs:
      let
        newCost = cost + c
        (oldCost,_) = paths.getOrDefault(m,(A.high,start))
      if newCost < oldCost:
        paths[m] = (newCost,n)
        q.push(djPair(newCost,m))
  return paths

proc walkPath*[A:SomeNumber;T](paths:Table[T,(A,T)],stop:T):seq[T] =
  ## Given a paths table (like from `bfs`) and a stop node, get the full path from the paths table's start node to the stop node, if it has been found.
  if stop notin paths: return @[]
  result.add stop
  var (_,curr) = paths[stop]
  while true:
    (_,curr) ..=! paths[curr]
    if curr == result[^1]: break
    result.add curr
  result.reverse
