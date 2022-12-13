## https://adventofcode.com/2022/day/2
include ../lib/imps

day 2:

  prep:
    let tonum = {'A':0,'B':1,'C':2,'X':0,'Y':1,'Z':2}.toTable

    var
      score1 = 0
      score2 = 0

    proc round(throw,win:int):int = throw + 1 + (win * 3)

    path.withLines:
      let
        a = tonum[line[0]]
        x = tonum[line[2]]
      score1 += round(x, (x - a + 1).floormod(3))
      score2 += round((a + x - 1).floormod(3),x)

  part 1:
    answerT 15
    answer 12276
    score1


  part 2:
    answer 12
    answer 9975
    score2
