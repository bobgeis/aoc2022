## https://adventofcode.com/2022/day/13
include ../lib/imps

import std/[json]

day 13:

  prep:
    let input = path.readFile.split("\n\n").mapit(it.splitlines)

    # echo input

    for piece in input:
      let
        left = parsejson(piece[0])
        right = parsejson(piece[1])
      dump (left , right)

  part 1:
    answerT 13
    1

  discussion """
    First thoughts: Can we walk the pairs of strings
    comparing them char by char?

    Second thought: Can we use pegs here?

    Third thought: This is all valid json, let's parse it!
  """