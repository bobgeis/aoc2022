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
        if rparts.len > 1:
          [monk1,op,monk2] ..= rparts
          ops[monk] = (monk1,monk2,op)
        else: nums[monk] = rparts[0].parseint

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
          when T is int: return n1 div n2
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
      lhs = nums2.recur(ops["root"][0])
      rhs = nums2.recur(ops["root"][1])
    abs((lhs.re - rhs.re)/(lhs.im + rhs.im)).int

  note """
Part 1: First thought: make a graph and walk it! Wait it's just a tree. Can we do that recursively or will we go too deep? I wrote a naively simple recursive proc, but it worked first try.

Part 2: Poking the AoC subbreddit I found suggestions for using complex numbers in python (Credit: redditors Biggergig and Anton31Kah). The idea is to set the "humn" number to 1i, and then run the recursion for the left and right half. To find the answer, take the difference of the real components divided by the sum of the imaginary components. Note that there's a potential complication if something like "humn * humn" ever appears, but it didn't. I was using ints, so first I tried using arrays of 2 ints but then I found I didn't want to implement complex division, so I switched to std/complex which worked great.
"""