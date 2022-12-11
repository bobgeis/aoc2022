## https://adventofcode.com/2022/day/11
include ../lib/imps

day 11:
  let input = path.readFile.split("\n\n")

  type Monkey = object
    id: int
    items: seq[int]
    op: (int) -> int
    divtest: int
    iftrue,iffalse: int
    count: int

  proc getop(s:string):(int) -> int =
    var i:int
    if s.scanf("  Operation: new = old + $i",i):
      return proc (j:int):int = j + i
    elif s.scanf("  Operation: new = old * $i",i):
      return proc (j:int):int = j * i
    elif s.scanf("  Operation: new = old * old",i):
      return proc (j:int):int = j * j
    else: raise

  proc parseMonkey(ss:seq[string]):Monkey =
    let (_,id) = ss[0].scanTuple("Monkey $i:")
    let items = ss[1].parseInts
    let op = ss[2].getop
    let (_,divtest) = ss[3].scanTuple("  Test: divisible by $i")
    let (_,iftrue) = ss[4].scanTuple("    If true: throw to monkey $i")
    let (_,iffalse) = ss[5].scanTuple("    If false: throw to monkey $i")
    Monkey(
      id:id,items:items,op:op,divtest:divtest,
      iftrue:iftrue,iffalse:iffalse,
      count:0
    )

  var ms = input.mapit(it.splitlines.parseMonkey)

  proc act(m:var Monkey) =
    m.count += m.items.len
    for i in m.items:
      let w = m.op(i) div 3
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