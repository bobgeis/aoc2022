## https://adventofcode.com/2022/day/21
include ../lib/imps

day 21:
  prep:

    type MonkOp = (string,string,string)
    var ops = initTable[string,MonkOp]()
    var nums = initTable[string,int]()
    proc todata(path:string) =
      for line in path.lines:
        let
          parts = line.split(": ")
          monk = parts[0]
          rparts = parts[1].split(" ")
        if rparts.len == 1:
          nums[monk] = rparts[0].parseint
        else:
          [monk1,op,monk2] ..= rparts
          ops[monk] = (monk1,monk2,op)

    path.todata

    proc recur(monk:string):int =
      if monk in nums: return nums[monk]
      let
        (m1,m2,op) = ops[monk]
        n1 = recur(m1) # omg my depths!
        n2 = recur(m2)
      case op:
        of "+": return n1 + n2
        of "-": return n1 - n2
        of "*": return n1 * n2
        of "/": return n1 div n2

  part 1:
    expectT 152
    expect 160_274_622_817_992
    recur("root")

  part 2:
    expectT 301
    # expect "?"
    "?"

  note """
Part 1: First thought: make a graph and walk it! Wait it's just a tree. Can we do that recursively or will we go too deep? I wrote a naively simple recursive proc, but it worked first try.
"""