## https://adventofcode.com/2022/day/7
include ../lib/imps

day 7:

  # In practice, the input calls ls in a dir, then cds into each dir inside it in turn, recursively walking the whole tree and calling ls just once in each dir.
  var
    curr = newSeq[string]()
    sizes = initCountTable[seq[string]]()
    size: int
    name: string

  path.withLines:
    if line == "$ cd /": discard
    elif line == "$ cd ..": discard curr.pop
    elif line.scanf("$$ cd $+",name): curr.add name
    elif line.scanf("$i $+",size,name):
      for i in 0..curr.len: # curr[0..<0] == @[]
        sizes.inc(curr[0..<i],size)
    else: discard

  var total = 0
  for size in sizes.values:
    if size < 100_000:
      total += size

  part 1: total
  answer 1: 1_908_462
  answer 1, "t1": 95_437

  let bound = sizes[@[]] - 40_000_000
  var smallest = int.high
  for size in sizes.values:
    if size <= smallest and size >= bound:
      smallest = size

  part 2: smallest
  answer 2: 3_979_145
  answer 2, "t1": 24_933_642