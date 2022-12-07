## https://adventofcode.com/2022/day/7
include ../lib/imps

day 7:

  # In practice, the input calls ls in a dir, then cds into each dir inside it in turn, recursively walking the whole tree and calling ls just once in each dir.
  var
    curr = newSeq[string]()
    sizes = initCountTable[string]()

  proc handleCommand(line:string) =
    if line[2] != 'c': return
    elif line == "$ cd ..":
      let size = sizes[curr.join("/")]
      discard curr.pop
      sizes.inc curr.join("/"), size
    elif line == "$ cd /": curr = @[]
    else: curr.add line[5..^1]

  proc handleFile(line:string) =
    let (success,size,name) = line.scanTuple("$i $+")
    sizes.inc curr.join("/"), size

  path.withLines:
    let c = line[0]
    if c == '$': line.handleCommand
    elif c == 'd': continue
    else: line.handleFile
  for _ in 0..curr.high:
    handleCommand "$ cd .."

  var total = 0
  for size in sizes.values:
    if size < 100_000:
      total += size

  part 1: total
  answer 1: 1_908_462
  answer 1, "t1": 95_437

  let bound = sizes[""] - 40_000_000
  var smallest = int.high
  for size in sizes.values:
    if size <= smallest and size >= bound:
      smallest = size

  part 2: smallest
  answer 2: 3_979_145
  answer 2, "t1": 24_933_642