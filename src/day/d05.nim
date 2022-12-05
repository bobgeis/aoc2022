## https://adventofcode.com/2022/day/5
include ../lib/imps

day 5:

  let # this makes a lot of extra allocations...
    input = path.readFile.split("\n\n")
    initStackStrs = input[0].splitLines
    moveLines = input[1].splitLines
    stackCount = initStackStrs[^1][^1].parseint

  proc newStacks():seq[seq[char]] =
    for i in 0..<stackCount:
      result.add newSeq[char]()
    for j in countdown(initStackStrs.len-2,0):
      let l = initStackStrs[j]
      for i in 0..<stackCount:
        let c = l.getor(i * 4 + 1, ' ')
        if c != ' ':
          result[i].add c

  proc getAnswer(stacks:seq[seq[char]]):string =
    stacks.doit(result.add it[^1])

  var moves = newSeq[(int,int,int)]()
  for m in moveLines:
    let (success,count,start,dest) = m.scantuple("move $i from $i to $i")
    moves.add (count,start - 1,dest - 1)

  part 1:

    var stacks = newStacks()
    for (count,start,dest) in moves:
      for i in 0 ..< count:
        stacks[dest].add stacks[start].pop
    stacks.getAnswer

  answer 1: "SHMSDGZVC"
  answer 1, "t1": "CMZ"

  part 2:

    var stacks2 = newStacks()
    for (count,start,dest) in moves:
      let st = stacks2[start]
      stacks2[dest].add st[st.len - count .. st.high]
      stacks2[start] = st[0 .. st.high - count]
    stacks2.getAnswer

  answer 2: "VRZGHDFBQ"
  answer 2, "t1": "MCD"