## https://adventofcode.com/2022/day/7
include ../lib/imps

day 7:

  prep:
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
    expectT 95_437
    expect 1_908_462
    sizes.values.toseq.foldl(if b < 100_000: a + b else: a,0)

  let bound = sizes[""] - 40_000_000

  part 2:
    expect 3_979_145
    expectT 24_933_642
    sizes.values.toseq.foldl(if b <= a and b >= bound: b else: a, int.high)

  note """
The input recursively walks the dirs, calling `ls` exactly once in each. It could have been much worse!
"""