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
    answers {inp:4314, t1:64}

    var surface = 0
    for v in cubes:
      for d in dirs3d6:
        if v + d notin cubes: inc surface

    surface

  part 2:
    answers {inp:2444, t1:58}
    let (c1,c2) = cubes.getminmax
    let bound1 = c1 - [1,1,1]
    let bound2 = c2 + [1,1,1]

    var exposed = 0
    proc adjs(v:Vec3i):seq[Vec3i] =
      for m in dirs3d6:
        let u = v + m
        if u.aabb(bound1,bound2):
          if u in cubes: inc exposed
          else: result.add u
    discard c1.bfs(adjs)
    exposed

  note """
Part 1: After the last couple days, part 1 was trivial. I was afraid I'd missed a trick... Just parse the x,y,z coordinates, and then for each coordinate count it's neighbors. There's certainly a faster running implementation, but it's already much better than day 16!

Part 2: Part 2 took slightly more thought that part 1 (where the naive solution worked well enough). In part 2 I did a bfs around the outside of the cube set, and then did the surface calculation using the set of exterior water cubes as check. There's probably room to make a faster implementation and/or approach, but the first thing worked well enough. I expect harder 3D puzzles in the near future.

Part 2.2: There is a minor improvement where the exposed surfaces are counted during the bfs around the exterior of the droplet, instead of afterwards.
"""