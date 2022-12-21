## https://adventofcode.com/2022/day/21
include ../lib/imps

import std/complex

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

    proc recur[T:int or Complex64](nums:Table[string,T],monk:string):T =
      if monk in nums: return nums[monk]
      let
        (m1,m2,op) = ops[monk]
        n1 = nums.recur(m1) # omg my depths!
        n2 = nums.recur(m2)
      case op:
        of "+": return n1 + n2
        of "-": return n1 - n2
        of "*": return n1 * n2
        of "/":
          when $typeof(T) == "int": return n1 div n2
          else: return n1 / n2

  part 1:
    expectT 152
    expect 160_274_622_817_992
    nums.recur("root")

  part 2:
    expectT 301
    expect 3_087_390_115_721

    func tocomp[A](n:A):Complex64 = complex(n.float64,0.0)

    var nums2: Table[string,Complex64] = nums.pairs.toseq
      .mapit((it[0],it[1].tocomp)).totable
    nums2["humn"] = complex(0.0,1.0)

    let
      lhs = recur(nums2,ops["root"][0])
      rhs = recur(nums2,ops["root"][1])
      (r,z) = if lhs.im == 0.0: (lhs,rhs) else: (rhs,lhs)

    ((r - z.re)/z.im).re.int

  note """
Part 1: First thought: make a graph and walk it! Wait it's just a tree. Can we do that recursively or will we go too deep? I wrote a naively simple recursive proc, but it worked first try.

Part 2: Poking the AoC subbreddit I found suggestions for using complex numbers in python (redditors Biggergig and Anton31Kah). I was using ints, so first I tried using arrays of 2 ints but then I found I didn't want to define complex division, so I switched to std/[complex].
"""