## https://adventofcode.com/2022/day/17
include ../lib/imps

import std/[rdstdin]

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
    # expect 0
    "?"
