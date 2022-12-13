## https://adventofcode.com/2022/day/7
include ../lib/imps

day 7:

  part 0: """The input recursively walks the dirs,
    calling `ls` exactly once in each.
    It could have been much worse!"""

  var
    curr = ""
    sizes = initCountTable[string]()
    size: int
    name: string

  proc popdir() =
    let size = sizes[curr]
    curr.delete(curr.rfind('/'),curr.high)
    sizes.inc curr,size
  proc pushdir(d:string) = curr.add &"/{d}"

  path.withLines:
    if line == "$ cd /": discard
    elif line == "$ cd ..": popdir()
    elif line.scanf("$$ cd $+",name): pushdir(name)
    elif line.scanf("$i $+",size,name): sizes.inc curr,size
  while curr != "": popdir()

  part 1:
    answerT 95_437
    answer 1_908_462
    sizes.values.toseq.foldl(if b < 100_000: a + b else: a,0)

  let bound = sizes[""] - 40_000_000

  part 2:
    answer 3_979_145
    answerT 24_933_642
    sizes.values.toseq.foldl(if b <= a and b >= bound: b else: a, int.high)