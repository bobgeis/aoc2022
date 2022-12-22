## https://adventofcode.com/2022/day/20
include ../lib/imps

import std/lists

day 20:
  prep:

    proc todata(path:string):(seq[int],Table[int,int])=
      var id = 0
      for dist in path.lines:
        result[0].add id
        result[1][id] = dist.parseint
        inc id
    var (ids,dists) = path.todata

    proc move(ids: var seq[int],id:int) =
      let
        start = ids.find(id)
        dest = (start + dists[id]).floormod(ids.high)
      if start == dest: return
      ids.delete(start)
      if dest == 0: ids.add id
      else: ids.insert(id,dest)

    proc final(ids:seq[int]):int =
      let
        ints = ids.mapit(dists[it])
        z = ints.find(0)
      [1000,2000,3000].mapit(ints[(it + z) mod ids.len]).sum

  part 1:
    answers {inp:2827, t1:3}
    var ids = ids
    for id in 0..ids.high: ids.move(id)
    final ids

  part 2:
    answers {inp:7_834_270_093_909, t1:1_623_178_306}
    const dkey = 811_589_153
    for key,value in dists: dists[key] = value * dkey
    for _ in 1..10:
      for id in 0..ids.high: ids.move(id)
    final ids

  note """
Part 1: This _should_ have been straightforward, but I messed up calculating the final answer and was sure the problem was in my move logic. I was looking in an array of ids (the initial offsets) instead of the true values, and they happened to coincidentally sum to the correct answer for the test data some of the time.

Part 2: Once part 1 was working, part 2 was very quick. Bumping up the sizes of numbers can cause issues in nim (eg int -> int64 or int128) but it didn't happen this time. My implementation is pretty slow, but after d16 my standards for "too slow" have relaxed a lot.
"""