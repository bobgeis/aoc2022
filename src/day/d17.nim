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

  note """
Hmmm.
"""