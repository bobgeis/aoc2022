## https://adventofcode.com/2022/day/18
include ../lib/imps

day 18:
  prep:

    proc getCubes(s:string):Set3i =
      path.withlines:
        let (_,x,y,z) = line.scantuple("$i,$i,$i")
        result.incl [x,y,z]

    let cubes = path.getCubes

  part 1:
    expectT 64
    expect 4314

    var surface = 0
    for v in cubes:
      for d in dirs3d6:
        if v + d notin cubes: inc surface

    surface

  note """
Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!
"""