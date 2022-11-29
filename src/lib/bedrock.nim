## bedrock: under the foundation
## This file is for miscellaneous utilities. It may import from the std libs or nimble libs, but from no local files. It should contain generally useful procs, things that you potentially might have wished were in the std lib.

import std/[macros, memfiles, monotimes, sequtils, sets,
  strformat, strutils, sugar, tables, times]

type
  SomeSeq*[T] = seq[T] or openarray[T] or string or cstring
  SomeTable*[U, V] = Table[U, V] or TableRef[U, V] or
    OrderedTable[U, V] or OrderedTableRef[U, V]
  SomeCountTable*[T] = CountTable[T] or CountTableRef[T]

proc spy*[T](t: T, msg = ""): T {.inline.} =
  ## For when you want to echo something in the middle of a chain of proc calls.
  echo &"{msg}{$t}"
  return t

# operators can't be passed in as procvar!
proc toString*[T](t: T): string = $t
proc lt*[T](a,b:T):bool = a < b
proc gt*[T](a,b:T):bool = a > b
proc le*[T](a,b:T):bool = a <= b
proc ge*[T](a,b:T):bool = a >= b
proc eq*[T](a,b:T):bool = a == b
proc ne*[T](a,b:T):bool = a != b

proc err*(msg = "Error!") =
  ## easy terse error
  raise newException(Exception, msg)

proc toSeqChar*(s: string): seq[char] {.inline.} = cast[seq[char]](s)

proc parseInt*(c: char): int = parseInt($c)

proc getlines*(path: string): seq[string] =
  ## Get the lines of a file by path
  var f = memfiles.open(path)
  defer: f.close
  for line in f.lines:
    result.add line

template withLines*(path: string, body: untyped) =
  var f = memfiles.open(path)
  for line {.inject.} in f.lines:
    body
  f.close

proc parselines*[T](path: string, cb: (string)->T): seq[T] =
  ## Parse the lines of a file using a callback
  var f = memfiles.open(path)
  defer: f.close
  for line in f.lines:
    result.add line.cb

proc transpose*[T](ss: seq[seq[T]]): seq[seq[T]] =
  ## Make the transpose of a seq of seq of T
  result = newSeqOfCap[seq[T]](ss[0].len)
  for i in 0..<ss[0].len:
    var row = newSeqOfCap[T](ss.len)
    for j in 0..<ss.len:
      row.add ss[j][i]
    result.add row

func between*(m, a, b: SomeNumber): bool {.inline.} =
  ## Is m between a and b (inclusive)?  Doesn't care about order of a or b. Remember if you know a<b, then you can just do "m in a..b".
  runnableExamples:
    let
      a = 10
      b = -5
    assert 5.bt(a, b)
    assert 5.bt(b, a)
    assert not 11.bt(a, b)
    assert not (-6).bt(a, b)
    assert 10.bt(a, b)
    assert 10.bt(b, a)
  # m >= min(a, b) and m <= max(a, b)
  (m <= a and m >= b) or (m <= b and m >= a)

func bt*(m, a, b: SomeNumber): bool {.inline.} =
  ## Alias for `between`. Is m between a and b (inclusive)?  Doesn't care about order of a or b.  Remember if you know a<b, then you can just do "m in a..b".
  m.between(a, b)

iterator countbetween*[A:SomeNumber](a, b: A, step: A = 1.0.A): A =
  ## Iterate from a to b with an optional step size.  Note that this is for cases where you don't know until runtime whether a < b.  If you know that before, then you should use a.countup(b) or a.countdown(b) for better performance. If provided, step should always be positive.
  runnableExamples:
    var
      x = 5
      s: seq[int] = @[]
    for i in 0.countbetween(x): s.add i
    x -= 10
    for i in 0.countbetween(x): s.add i
    for i in 0.countbetween(x, 2): s.add i
    assert s == @[0, 1, 2, 3, 4, 5, 0, -1, -2, -3, -4, -5, 0, -2, -4]
  if a == b: yield a
  else:
    let delta = step * cmp(b, a)
    var curr = a
    while curr.bt(a, b):
      yield curr
      curr += delta

proc getOr*[T](s: openArray[T], i: int, def: T): T {.inline.} =
  ## GetOrDefault for openArrays
  if i in s.low..s.high: s[i] else: def

proc tocset*(s:string):set[char] =
  ## turn a string into a char set
  for c in s: result.incl c

proc toSysSet*[T](s:openArray[T]):set[T] =
  ## Make a system set from an openArray
  for t in s:
    result.incl t

proc peek*[T](s:set[T] or HashSet[T]):T =
  ## get an arbitrary value in a set
  for i in s.items: return i

proc clamp*[A: SomeNumber](v, min, max: A): A {.inline.} =
  ## Clamp a value to within [min,max].
  return if v < min: min
    elif v > max: max
    else: v

proc clamp*[A: SomeNumber](v, max: A): A {.inline.} =
  ## Clamp a value to within [0,max].
  return clamp(v, A.default, max)

proc wrap*[A: SomeNumber](v, min, max: A): A {.inline.} =
  ## Wrap a value to within [min,max].
  return if v < min: v + (max - min)
    elif v >= max: v - (max - min)
    else: v

proc wrap*[A: SomeNumber](v, max: A): A {.inline.} =
  ## Wrap a value to within [0,max].
  return wrap(v, A.default, max)

proc lerp*[A: SomeFloat](a, b, v: A): A {.inline.} =
  ## Linear interpolation. a and b are the endpoints, v is 0-1 the transition a -> b
  a * (1.0.A - v) + b * v

template doit*(s: typed, op: untyped): untyped =
  ## Call side-effecting code with each item of a sequence.
  ## Like mapIt or apply, but the code must have no return value.
  runnableExamples:
    let t = @[3, 5]
    var v: seq[int] = @[]
    t.doit(v.add it)
    assert t == v
  for it {.inject.} in items(s):
    op

proc flatten*[T](ss: seq[seq[T]]): seq[T] =
  ## Take a seq of seq of T and return a seq of T.
  for s in ss:
    for t in s:
      result.add t

proc groupsOf*[T](s: seq[T], g: Positive): seq[seq[T]] =
  ## Chop a seq `s` into a seq of subseqs each of length `g` (the last one may be shorter)
  var
    sub = newSeqofCap[T](g)
    i = 0
  for t in s:
    sub.add t
    i += 1
    if i >= g:
      result.add sub
      sub = newSeqOfCap[T](g)
      i = 0
  if sub.len > 0: result.add sub

proc binBy*[T, U](ts: openArray[T], fn: proc (x: T): U {.closure.}): Table[U, seq[T]] =
  ## Given a sequence `ts`, and a proc `fn` that will turn the items of `ts` into something hashable, create a table that bins each of the items into subsequences using the value of returned from `fn`.
  ## Inspired by partition from https://github.com/jabbalaci/nimpykot/blob/master/src/pykot/functional.nim
  runnableExamples:
    import sugar, tables
    let # example 1
      digits = @[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      mod3 = digits.binBy(d => d mod 3)
    assert @[2, 5, 8] == mod3[2]
    let # example 2
      pairs = @[@[1, 2], @[3, 1], @[5, 6], @[9, 5]]
      mins = pairs.binBy(p => p.min)
    assert @[@[5, 6], @[9, 5]] == mins[5]
    let # example 3
      words = @["sam", "so", "am", "alpine"]
      charTable = words.binBy(s => s[0])
    assert @["am", "alpine"] == charTable['a']
  for t in ts:
    let s = fn(t)
    result.mgetorput(s,@[]).add t

proc reduce*[T](ts:openArray[T],f:proc(u,t:T):T):T {.inline.} =
  ## Note that sequtils has foldl(sequence,operation,first), and is what you should prefer in general. Sometimes you'll want to pass a proc instead of foldl(p(a,b)).
  result = ts[0]
  for i in 1..ts.high: result = f(result,ts[i])

proc reduce*[T,U](ts:openArray[T],f:proc(u:U,t:T):U, first:U):U {.inline.} =
  ## Note that sequtils has foldl(sequence,operation,first), and is what you should prefer in general. Sometimes you'll want to pass a proc instead of foldl(p(a,b),first).
  result = first
  for t in ts: result = f(result,t)


#


proc tests* =
  ## unit tests
  block:
    let
      a = 10
      b = -5
    assert 5.bt(a, b)
    assert 5.bt(b, a)
    assert not 11.bt(a, b)
    assert not (-6).bt(a, b)
    assert 10.bt(a, b)
    assert 10.bt(b, a)

  block:
    var
      x = 5
      s: seq[int] = @[]
    for i in 0.countbetween(x): s.add i
    x -= 10
    for i in 0.countbetween(x): s.add i
    for i in 0.countbetween(x, 2): s.add i
    assert s == @[0, 1, 2, 3, 4, 5, 0, -1, -2, -3, -4, -5, 0, -2, -4]

  block:
    assert @[@[1, 2, 3], @[4, 5, 6]].flatten == @[1, 2, 3, 4, 5, 6]

  block:
    let t = @[3, 5]
    var v: seq[int] = @[]
    t.doit(v.add it)
    assert t == v

  block:
    let # example 1
      digits = @[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      mod3 = digits.binBy(d => d mod 3)
    assert @[2, 5, 8] == mod3[2]
    let # example 2
      pairs = @[@[1, 2], @[3, 1], @[5, 6], @[9, 5]]
      mins = pairs.binBy(p => p.min)
    assert @[@[5, 6], @[9, 5]] == mins[5]
    let # example 3
      words = @["sam", "so", "am", "alpine"]
      charTable = words.binBy(s => s[0])
    assert @["am", "alpine"] == charTable['a']

  echo "√ bedrock passed"


when isMainModule:
  tests()