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