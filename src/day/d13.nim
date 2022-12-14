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
      for i in 0..<min(left.len,right.len):
        let c = compare(left[i],right[i])
        if c != 0: return c
      return cmp(left.len,right.len)

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
    var off1,off2 = 1
    for i,pack in jsonPairs.flatten:
      if compare(pack,pack1) < 1: inc off1
      if compare(pack,pack2) < 1: inc off2
    off1 * (off2 + 1)

  part "2a":
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

  note """
First thought: Can we walk the pairs of strings comparing themchar by char?

Second thought: Can we somehow use pegs here?

Third thought: This is all valid json, let's just parse it!

I hadn't used the std/json library before, so that took some experimentation. Once finished, it worked great and part 2 was very quick to code.

For part 2 I first used the built-in sort and was well pleased with it, but it can be much faster. You don't actually have to sort the seq of JsonNodes, you just need to know how many nodes would be to the left of the two dividers _if_ they were sorted.
You can do this just by looping through the array once.

I've preserved my sorting solution as part "2a".

It may be possible to improve parsing performance by using a faster json library. Several exist (eg search the nim forum).
"""