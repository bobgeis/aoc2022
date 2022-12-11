## https://adventofcode.com/2022/day/11
include ../lib/imps

day 11:
  type
    Opk = enum oAd, oMu, oSq
    Monkey = object
      stuff: seq[int]
      op: Opk
      opo, divtest, iftrue, iffalse, count: int

  proc parseMonkey(ss:seq[string]):Monkey =
    result.stuff = ss[1].parseInts
    if ss[2].scanf("  Operation: new = old + $i",result.opo):
      result.op = oAd
    elif ss[2].scanf("  Operation: new = old * $i",result.opo):
      result.op = oMu
    else: result.op = oSq
    doAssert ss[3].scanf("  Test: divisible by $i",result.divtest)
    doAssert ss[4].scanf("    If true: throw to monkey $i",result.iftrue)
    doAssert ss[5].scanf("    If false: throw to monkey $i",result.iffalse)

  let monkeys = path.readFile.split("\n\n").mapit(it.splitlines.parseMonkey)

  proc business(ms: seq[Monkey],rs:int, wrap: static bool):int =
    var ms = ms
    when wrap:
      let wmax = ms.foldl(a * b.divtest,1)
    for _ in 1..rs:
      for m in ms.mitems:
        m.count += m.stuff.len
        for v in m.stuff:
          var w = case m.op:
            of oAd: m.opo + v
            of oMu: m.opo * v
            of oSq: v * v
          when wrap: w = w mod wmax
          else: w = w div 3
          let target = if w mod m.divtest == 0: m.iftrue else: m.iffalse
          ms[target].stuff.add w
        m.stuff.setlen 0
    ms.mapit(it.count).sorted[^2..^1].foldl(a * b)

  part 1: monkeys.business(20,wrap=false)
  answer 1: 110264
  answer 1, "t1": 10605

  part 2: monkeys.business(10_000,wrap=true)
  answer 2: 23_612_457_316
  answer 2, "t1": 2_713_310_158