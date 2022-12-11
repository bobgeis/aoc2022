## https://adventofcode.com/2022/day/11
include ../lib/imps

day 11:
  let input = path.readFile.split("\n\n")

  type
    Opk = enum oAd, oMu, oSq
    Monkey = object
      id: int
      items: seq[int]
      op: Opk
      opo: int
      divtest: int
      iftrue,iffalse: int
      count: int

  proc doop(m:Monkey,w:int):int =
    case m.op:
      of oAd: m.opo + w
      of oMu: m.opo * w
      of oSq: w * w

  proc parseMonkey(ss:seq[string]):Monkey =
    result.items = ss[1].parseInts
    if ss[2].scanf("  Operation: new = old + $i",result.opo):
      result.op = oAd
    elif ss[2].scanf("  Operation: new = old * $i",result.opo):
      result.op = oMu
    elif ss[2].scanf("  Operation: new = old * old"):
      result.op = oSq
    doAssert ss[3].scanf("  Test: divisible by $i",result.divtest)
    doAssert ss[4].scanf("    If true: throw to monkey $i",result.iftrue)
    doAssert ss[5].scanf("    If false: throw to monkey $i",result.iffalse)

  let monkeys = input.mapit(it.splitlines.parseMonkey)
  var ms = monkeys

  proc act(m:var Monkey) =
    m.count += m.items.len
    for i in m.items:
      let w = m.doop(i) div 3
      if w mod m.divtest == 0:
        ms[m.iftrue].items.add w
      else:
        ms[m.iffalse].items.add w
    m.items = @[]

  for _ in 1..20:
    for i in 0..ms.high:
      ms[i].act


  part 1:  ms.mapit(it.count).sorted[^2..^1].foldl(a * b)
  answer 1: 110264
  answer 1, "t1": 10605
