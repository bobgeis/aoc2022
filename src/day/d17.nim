## https://adventofcode.com/2022/day/17
include ../lib/imps

day 17:
  prep:
    let input = path.readFile

    const blocks:seq[seq[Vec2i]] = @[
      @[[0,0],[1,0],[2,0],[3,0]], # -
      @[[1,0],[0,1],[1,1],[2,1],[1,2]], # +
      @[[0,0],[1,0],[2,0],[2,1],[2,2]], # backwards L
      @[[0,0],[0,1],[0,2],[0,3]], # |
      @[[0,0],[1,0],[0,1],[1,1]], # square
    ]

    var cache = initTab2i[int]()

  part 1:
    expectT 3068
    expect 3227
    var
      h = 0
      boff = 0
      coff = 0
      rest = initSet2i()

    for x in 0..6: rest.incl [x,0]

    proc checkblock(b:seq[Vec2i]):bool =
      if b[0].x < 0 or b[1].x < 0 or b[^1].x > 6 or b[^2].x > 6: return false
      for v in b:
        if v in rest: return false
      return true

    proc drawrest(b:seq[Vec2i],s:string="") =
      echo &"*** {s} ***"
      echo union(rest,b.tohashset).draw((v) => (
        if v in b: '@'
        elif v in rest: '#'
        else: '.'
      ))
      echo()
      echo &"*** {h} ***"
      pause()

    for _ in 1..2022:
      var b = blocks[boff]
      boff = (boff + 1) mod blocks.len
      for v in b.mitems: v += [2,h + 4]

      while true:

        # drawrest(b)

        var move = if input[coff] == '<': [-1,0] else: [1,0]
        coff = (coff + 1) mod input.len
        var b2:seq[Vec2i] = b.mapit(it + move)
        if b2.checkblock: b = b2

        b2 = b.mapit(it + [0,-1])
        if b2.checkblock: b = b2
        else:
          b.doit(rest.incl it)
          h.max= b[^1].y
          break
    h

  part 2:
    expectT 1_514_285_714_288
    # expect 0

    const iterations = 1_000_000_000_000 # one trillion!
    "?"

  note """
Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2. After running the part 1 code with visualization for long enough patterns emerge. I think I'll making a cache of [block-offset,char-offset] -> delta-height and see if something like that can make be made both accurate and fast.

TODO: Solve part 2.
"""