## https://adventofcode.com/2022/day/2
include ../lib/imps

day 2:
  let tonum = {'A':0,'B':1,'C':2,'X':0,'Y':1,'Z':2}.toTable

  var
    score1 = 0
    score2 = 0

  proc round(throw,win:int):int = throw + 1 + (win * 3)

  path.withLines:
    let
      a = tonum[line[0]]
      x = tonum[line[2]]
    score1 += round(x, (x - a + 4) mod 3)
    score2 += round((a + x + 2) mod 3,x)

  part 1: score1

  answer 1, "t1": 15
  answer 1: 12276

  part 2: score2

  answer 2, "t1": 12
  answer 2: 9975