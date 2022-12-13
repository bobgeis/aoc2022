## https://adventofcode.com/2022/day/13
include ../lib/imps

import std/[json]

day 13:

  prep:
    proc tojson(ss:string):seq[JsonNode] =
      for s in ss.splitlines: result.add parsejson(s)

    let
      input = path.readFile
      jsonPairs = input.split("\n\n").mapit(it.tojson)
      jsonAll = jsonPairs.flatten

    proc compare(left,right:JsonNode):int =
      if left.kind == JInt and right.kind == JInt:
        return cmp(left.num,right.num)
      let
        left = if left.kind == JArray: left else: %[left]
        right = if right.kind == JArray: right else: %[right]
      if left.len == 0: return cmp(left.len, right.len)
      for i in 0..<left.len:
        if i + 1 > right.len: return 1
        let c = compare(left[i],right[i])
        if c != 0: return c
      return 0

  part 1:
    answerT 13
    answer 5557
    var total = 0
    for i,piece in jsonPairs:
      let
        left = piece[0]
        right = piece[1]
        c = compare(left,right)
      if c != 1:
        total += 1 + i
    total

  part 2:
    answerT 140

    ddump jsonall

    2

  discussion """
    First thoughts: Can we walk the pairs of strings
    comparing them char by char?

    Second thought: Can we use pegs here?

    Third thought: This is all valid json, let's parse it!
  """