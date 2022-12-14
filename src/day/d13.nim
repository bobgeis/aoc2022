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
    expectT 13
    expect 5557
    var total = 0
    for i,pair in jsonPairs:
      let c = compare(pair[0],pair[1])
      if c != 1:
        total += 1 + i
    total

  part 2:
    expectT 140
    expect 22425
    let
      pack1 = %*[[2]]
      pack2 = %*[[6]]
    var jsonAll = jsonPairs.flatten
    jsonall.add pack1
    jsonall.add pack2
    jsonall.sort(compare)
    (jsonall.find(pack1) + 1) * (jsonall.find(pack2) + 1)

  discussion """
    First thought: Can we walk the pairs of strings comparing them
    char by char?

    Second thought: Can we somehow use pegs here?

    Third thought: This is all valid json, let's just parse it!

    I hadn't used the std/json library before, so that took some
    experimentation. Once finished, it worked great and part 2 was
    very quick to code.

    It may be possible to improve performance by using a faster json
    library. Several exist (eg search the nim forum)."""