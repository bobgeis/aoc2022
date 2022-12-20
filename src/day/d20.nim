## https://adventofcode.com/2022/day/20
include ../lib/imps

import std/lists

day 20:
  prep:
    let input = path.lines.toseq.mapit(parseint(it))

    var intTab = initTable[int,int]()
    var ids:seq[int] = @[]
    for id,n in input:
      ids.add id
      intTab[id] = n

    proc move(ids: var seq[int],id:int) =
      let
        start = ids.find(id)
        dist = inttab[id]
        dest = (start + dist).floormod(ids.high)
      if start == dest: return
      ids.delete(start)
      if dest == 0: ids.add id
      else: ids.insert(id,dest)

  part 1:
    expectT 3
    expect 2827
    var ids = ids
    for id in 0..ids.high: ids.move(id)
    let ints = ids.mapit(inttab[it])
    let
      z = ints.find(0)
      a = ints[(z + 1000) mod (ids.len)]
      b = ints[(z + 2000) mod (ids.len)]
      c = ints[(z + 3000) mod (ids.len)]
    a + b + c

  part 2:
    expectT 1_623_178_306
    expect 7834270093909
    const dkey = 811_589_153
    for key,value in inttab:
      inttab[key] = value * dkey
    for _ in 1..10:
      for id in 0..ids.high: ids.move(id)
    let
      ints = ids.mapit(inttab[it])
      z = ints.find(0)
      a = ints[(z + 1000) mod (ids.len)]
      b = ints[(z + 2000) mod (ids.len)]
      c = ints[(z + 3000) mod (ids.len)]
    a + b + c

  note """
Part 1: This _should_ have been straightforward, but I insisted on looking for number in the distance map, instead of in the final array, but decided the bug must have been an issue with the move proc due to the fact that I'd sometimes get the right answer anyway (lots of small ints all in the same range can coincientally add to the same sum).

Part 2: Once part 1 was working, part 2 was very quick. Bumping up the sizes of numbers can cause issues in nim (eg int -> int64 or int128) but it didn't happen this time. My implementation is pretty slow, but after d16 my standards for "too slow" have relaxed a lot.
"""