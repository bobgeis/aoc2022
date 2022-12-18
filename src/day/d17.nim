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

    proc sim(iters:SomeInteger,use_cache: static bool=false):int64 =
      var
        h = 0 # height of the top piece
        boff = 0 # block offset
        coff = 0 # char offset in input
        tower = initSet2i()
      for x in 0..6: tower.incl [x,0]

      proc checkblock(b:seq[Vec2i]):bool =
        if b[0].x < 0 or b[1].x < 0 or b[^1].x > 6 or b[^2].x > 6: return false
        for v in b:
          if v in tower: return false
        return true

      proc drawblocks(b:seq[Vec2i],s:string="") =
        echo &"*** {s} ***"
        echo union(tower,b.tohashset).draw((v) => (
          if v in b: '@'
          elif v in tower: '#'
          else: '.'
        ))
        echo()
        echo &"*** {h} ***"
        pause()

      when use_cache:
        var
          cache = initTab3i[seq[int]]()
          hcache:seq[int] = @[]

        proc cachecalc(n,nprev:int):int64 =
          let
            loopiters = (n - nprev).int64
            loopheight = (hcache[n] - hcache[nprev]).int64
            (loopsleft,remainderiters) = divmod(iters.int64 - n.int64, loopiters.int64)
            remainderheight = (hcache[remainderiters.int + nprev] - hcache[nprev] - 1).int64
          return h + loopsleft * loopheight + remainderheight

      let loops = if iters > 100_000'i64: 100_000.int else: iters.int
      for n in 0..<loops:

        # ready the block
        var b = blocks[boff]
        boff = (boff + 1) mod blocks.len
        for v in b.mitems: v += [2,h + 4]
        let cstart = coff

        # drop the block
        while true:

          # drawblocks(b) # useful for visualization

          # move horizontally
          var move = if input[coff] == '<': [-1,0] else: [1,0]
          coff = (coff + 1) mod input.len
          var b2:seq[Vec2i] = b.mapit(it + move)
          if b2.checkblock: b = b2

          # move vertically
          b2 = b.mapit(it + [0,-1])
          if b2.checkblock: b = b2
          else: # the commit the block and do cache stuff

            # commit the block
            b.doit(tower.incl it)

            # update the height
            h.max= b[^1].y

            when use_cache: # used in part 2
              # cache the height
              hcache.add h

              # the cache key is boff,coff-start and coff-stop
              let key = [boff,cstart,coff]

              if key notin cache: # cache what we just did
                cache[key] = @[n]
              else:
                let cv = cache[key]
                if cv.len == 1:
                  cache[key].add n
                elif cv[^1] - cv[^2] == n - cv[^1]:
                  return cachecalc(n,cv[^1])
            break
      h.int64

  part 1:
    expectT 3068
    expect 3227
    sim(2022)

  part 2:
    expectT 1_514_285_714_288
    expect 1_597_714_285_698

    const iterations = 1_000_000_000_000 # one trillion!

    sim(iterations,use_cache=true)

  note """
Part 1: I took an unsually long amount of time to do part 1 because I had a bug in my height code. Basically I was always taking the max y-coordinate of the last block, even if the last block was _lower_ than the highest block. Because the height was used to spawn the next block, this messed up the tower. I had thought the bug was somewhere in the block movement code so I made procs to draw the block set at every step and it _looked_ right. Only when I went much further did I notice some blocks spawning in the wrong place and figure out what happened.

Part 2: After part 1 I didn't have enough time to do part 2 the same day. From running the part 1 code with visualization, the tower structure repeats. I poked the AoC subreddit and some people inspect it visually, and some people detected repeating patters. I tried to detect a repeating pattern. I have a cache that matches block- and char-offsets to block-number, and another that matches block-number to total height (that's just a seq, since both start at 0). My current solution works but there's a subtle bug that makes it fail for the test data for 2022 iterations.
"""