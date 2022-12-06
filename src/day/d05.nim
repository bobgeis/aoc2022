## https://adventofcode.com/2022/day/5
include ../lib/imps

day 5:

  let # this makes a lot of extra allocations...
    input = path.readFile.split("\n\n")
    initStackStrs = input[0].splitLines
    stackCount = initStackStrs[^1][^1].parseint
    moves = collect:
      for m in input[1].splitLines:
        let (_,count,start,dest) = m.scantuple("move $i from $i to $i")
        (count,start - 1,dest - 1)

  proc newStacks():seq[seq[char]] =
    for _ in 0..<stackCount:
      result.add newSeq[char]()
    for j in countdown(initStackStrs.len-2,0):
      let l = initStackStrs[j]
      for i in 0..<stackCount:
        let c = l.getor(i * 4 + 1, ' ')
        if c != ' ':
          result[i].add c

  proc domoves(rev: static bool=true):string =
    var stacks = newStacks()
    for (count,start,dest) in moves:
      when rev:
        for _ in 0..<count:
          stacks[dest].add stacks[start].pop
      else:
        let st = stacks[start]
        stacks[dest].add st[st.len - count .. st.high]
        stacks[start] = st[0 .. st.high - count]
    stacks.doit(result.add it[^1])

  part 1: domoves()

  answer 1: "SHMSDGZVC"
  answer 1, "t1": "CMZ"

  part 2: domoves(rev=false)

  answer 2: "VRZGHDFBQ"
  answer 2, "t1": "MCD"