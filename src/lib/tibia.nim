## tibia: vecna's leg bone.
## Tables and data structures that use vectors as keys.
##

# std lib modules https://nim-lang.org/docs/lib.html
import std/[sets, strformat, sugar, tables]

import bedrock, shenanigans, vecna


# vecna used as keys in tables, sets, and nested seqs


type
  # common tables
  SomeTab2i*[T] = SomeTable[Vec2i, T]
  SomeTab3i*[T] = SomeTable[Vec3i, T]
  SomeTab4i*[T] = SomeTable[Vec4i, T]

  SomeTab2f*[T] = SomeTable[Vec2f, T]
  SomeTab3f*[T] = SomeTable[Vec3f, T]
  SomeTab4f*[T] = SomeTable[Vec4f, T]

  Tab2i*[T] = Table[Vec2i, T]
  Tab3i*[T] = Table[Vec3i, T]
  Tab4i*[T] = Table[Vec4i, T]

  Tab2f*[T] = Table[Vec2f, T]
  Tab3f*[T] = Table[Vec3f, T]
  Tab4f*[T] = Table[Vec4f, T]

  TabR2i*[T] = TableRef[Vec2i, T]
  TabR3i*[T] = TableRef[Vec3i, T]
  TabR4i*[T] = TableRef[Vec4i, T]

  TabR2f*[T] = TableRef[Vec2f, T]
  TabR3f*[T] = TableRef[Vec3f, T]
  TabR4f*[T] = TableRef[Vec4f, T]

  Otab2i*[T] = OrderedTable[Vec2i, T]
  Otab3i*[T] = OrderedTable[Vec3i, T]
  Otab4i*[T] = OrderedTable[Vec4i, T]

  Otab2f*[T] = OrderedTable[Vec2f, T]
  Otab3f*[T] = OrderedTable[Vec3f, T]
  Otab4f*[T] = OrderedTable[Vec4f, T]

  OtabR2i*[T] = OrderedTableRef[Vec2i, T]
  OtabR3i*[T] = OrderedTableRef[Vec3i, T]
  OtabR4i*[T] = OrderedTableRef[Vec4i, T]

  OtabR2f*[T] = OrderedTableRef[Vec2f, T]
  OtabR3f*[T] = OrderedTableRef[Vec3f, T]
  OtabR4f*[T] = OrderedTableRef[Vec4f, T]

  # common hashsets
  SomeSet2i* = SomeSet[Vec2i]
  SomeSet3i* = SomeSet[Vec3i]
  SomeSet4i* = SomeSet[Vec4i]

  SomeSet2f* = SomeSet[Vec2f]
  SomeSet3f* = SomeSet[Vec3f]
  SomeSet4f* = SomeSet[Vec4f]

  Set2i* = HashSet[Vec2i]
  Set3i* = HashSet[Vec3i]
  Set4i* = HashSet[Vec4i]

  Set2f* = HashSet[Vec2f]
  Set3f* = HashSet[Vec3f]
  Set4f* = HashSet[Vec4f]

  Oset2i* = OrderedSet[Vec2i]
  Oset3i* = OrderedSet[Vec3i]
  Oset4i* = OrderedSet[Vec4i]

  Oset2f* = OrderedSet[Vec2f]
  Oset3f* = OrderedSet[Vec3f]
  Oset4f* = OrderedSet[Vec4f]

  # common counttables
  SomeCtab2i* = SomeCountTable[Vec2i]
  SomeCtab3i* = SomeCountTable[Vec3i]
  SomeCtab4i* = SomeCountTable[Vec4i]

  SomeCtab2f* = SomeCountTable[Vec2f]
  SomeCtab3f* = SomeCountTable[Vec3f]
  SomeCtab4f* = SomeCountTable[Vec4f]

  Ctab2i* = CountTable[Vec2i]
  Ctab3i* = CountTable[Vec3i]
  Ctab4i* = CountTable[Vec4i]

  Ctab2f* = CountTable[Vec2f]
  Ctab3f* = CountTable[Vec3f]
  Ctab4f* = CountTable[Vec4f]

  CtabR2i* = CountTableRef[Vec2i]
  CtabR3i* = CountTableRef[Vec3i]
  CtabR4i* = CountTableRef[Vec4i]

  CtabR2f* = CountTableRef[Vec2f]
  CtabR3f* = CountTableRef[Vec3f]
  CtabR4f* = CountTableRef[Vec4f]

  # common nested seqs, Can only use vecs of ints as keys, the x coordinate should always be the innermost coordinate
  Seq2i*[T] = seq[seq[T]]
  Seq3i*[T] = seq[seq[seq[T]]]
  Seq4i*[T] = seq[seq[seq[seq[T]]]]


# getters/setters for tables using coordinates


template `[]`*[A, T](t: SomeTable[Vec[2, A], T]; x, y: A): T = t[[x, y]]
template `[]=`*[A, T](t: var SomeTable[Vec[2, A], T]; x, y: A; val: T) = t[[x, y]] = val
template `[]`*[A, T](t: SomeTable[Vec[3, A], T]; x, y, z: A): T = t[[x, y, z]]
template `[]=`*[A, T](t: var SomeTable[Vec[3, A], T]; x, y, z: A; val: T) = t[[x, y, z]] = val
template `[]`*[A, T](t: SomeTable[Vec[4, A], T]; x, y, z, w: A): T = t[[x, y, z, w]]
template `[]=`*[A, T](t: var SomeTable[Vec[4, A], T]; x, y, z, w: A; val: T) = t[[x,
    y, z, w]] = val


# getters/setters for seqs using coordinates


template `[]`*[T](s: Seq2i[T]; x, y: int): T = s[y][x]
template `[]=`*[T](s: Seq2i[T]; x, y: int; val: T) = s[y][x] = val
template `[]`*[T](s: Seq3i[T]; x, y, z: int): T = s[z][y][x]
template `[]=`*[T](s: Seq3i[T]; x, y, z: int; val: T) = s[z][y][x] = val
template `[]`*[T](s: Seq4i[T]; x, y, z, w: int): T = s[w][z][y][x]
template `[]=`*[T](s: Seq4i[T]; x, y, z, w: int; val: T) = s[w][z][y][x] = val


# getters/setters for seqs using vecs


template `[]`*[T](s: Seq2i[T]; arg: Vec2i): T =
  let v = arg
  s[v.x, v.y]
template `[]=`*[T](s: Seq2i[T]; arg: Vec2i; val: T): T =
  let v = arg
  s[v.x, v.y] = val
template `[]`*[T](s: Seq3i[T]; arg: Vec3i): T =
  let v = arg
  s[v.x, v.y, v.z]
template `[]=`*[T](s: Seq3i[T]; arg: Vec3i; val: T): T =
  let v = arg
  s[v.x, v.y, v.z] = val
template `[]`*[T](s: Seq4i[T]; arg: Vec4i): T =
  let v = arg
  s[v.x, v.y, v.z, v.w]
template `[]=`*[T](s: Seq4i[T]; arg: Vec4i; val: T): T =
  let v = arg
  s[v.x, v.y, v.z, v.w] = val

proc getOr*[T](s: Seq2i[T], x,y:int, def:T): T =
  ## Like getOrDefault for seqs of seqs of T
  if y notin s.low..s.high: def
  elif x notin s[0].low..s[0].high: def
  else: s[y][x]

proc getOr*[T](s: Seq2i[T],v:Vec2i, def:T): T {.inline.} =
  ## Like getOrDefault for seqs of seqs of T
  s.getOr(v.x,v.y,def)

proc toSeq2iChar*(s: seq[string]): Seq2i[char] =
  ## remember seq[string] == seq[seq[char]]
  cast[Seq2i[char]](s)


# seq[string] can be treated as seq[seq[char]]


template `[]`*(s: seq[string]; x, y: int): char = s[y][x]
template `[]=`*(s: seq[string]; x, y: int; val: char) = s[y][x] = val
template `[]`*(s: seq[string]; arg: Vec2i):char =
  let v = arg
  s[v.y][v.x]
template `[]=`*(s: seq[string]; arg: Vec2i; val:char) =
  let v = arg
  s[v.y][v.x] = val


# inits


proc initTab2i*[T](): Tab2i[T] = initTable[Vec2i,T]()
proc initTab3i*[T](): Tab3i[T] = initTable[Vec3i,T]()
proc initTab4i*[T](): Tab4i[T] = initTable[Vec4i,T]()

proc initTab2f*[T](): Tab2f[T] = initTable[Vec2f,T]()
proc initTab3f*[T](): Tab3f[T] = initTable[Vec3f,T]()
proc initTab4f*[T](): Tab4f[T] = initTable[Vec4f,T]()


proc initSet2i*[T](): Set2i = initHashSet[Vec2i]()
proc initSet3i*[T](): Set3i = initHashSet[Vec3i]()
proc initSet4i*[T](): Set4i = initHashSet[Vec4i]()

proc initSet2f*[T](): Set2f = initHashSet[Vec2f]()
proc initSet3f*[T](): Set3f = initHashSet[Vec3f]()
proc initSet4f*[T](): Set4f = initHashSet[Vec4f]()

proc initSeq2i*[T](): Seq2i[T] = @[]
proc initSeq3i*[T](): Seq3i[T] = @[]
proc initSeq4i*[T](): Seq4i[T] = @[]


# min max


proc getMinMax*[N, T](t: SomeTable[Vec[N, int], T]): (
    Vec[N, int], Vec[N, int]) =
  ## Get a vector of all the minimum values for each coordinate and a vector of all the maximum values for each coordinate among the keys of the given vector table/tableref.
  var
    mins = highest[N, int]()
    maxs = lowest[N, int]()
  for k in t.keys:
    mins.min = k
    maxs.max = k
  return (mins, maxs)

proc getMinMax*[N](t: SomeCountTable[Vec[N, int]]): (
    Vec[N, int], Vec[N, int]) =
  ## Get a vector of all the minimum values for each coordinate and a vector of all the maximum values for each coordinate among the keys of the given vector table/tableref.
  var
    mins = highest[N, int]()
    maxs = lowest[N, int]()
  for k in t.keys:
    mins.min = k
    maxs.max = k
  return (mins, maxs)

proc getMinMax*[N](hs: SomeSet[Vec[N, int]]): (Vec[N, int], Vec[N, int]) =
  ## Get a vector of all the minimum values for each coordinate and a vector of all the maximum values for each coordinate among the keys of the given vector hashset.
  var
    mins = highest[N, int]()
    maxs = lowest[N, int]()
  for item in hs.items:
    mins.min = item
    maxs.max = item
  return (mins, maxs)


# Walking sparse collections


iterator grid*[T](t: SomeTab2i[T]): Vec2i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for y in mins.y..maxs.y:
    for x in mins.x..maxs.x:
      yield [x, y]

iterator grid*(t: SomeSet2i or SomeCtab2i): Vec2i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for y in mins.y..maxs.y:
    for x in mins.x..maxs.x:
      yield [x, y]

iterator grid*[T](t: SomeTab3i[T]): Vec3i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for z in mins.z..maxs.z:
    for y in mins.y..maxs.y:
      for x in mins.x..maxs.x:
        yield [x, y, z]

iterator grid*(t: SomeSet3i or SomeCtab3i): Vec3i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for z in mins.z..maxs.z:
    for y in mins.y..maxs.y:
      for x in mins.x..maxs.x:
        yield [x, y, z]

iterator grid*[T](t: SomeTab4i[T]): Vec4i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for w in mins.w..maxs.w:
    for z in mins.z..maxs.z:
      for y in mins.y..maxs.y:
        for x in mins.x..maxs.x:
          yield [x, y, z, w]

iterator grid*(t: SomeSet4i or SomeCtab4i): Vec4i =
  ## Walk a grid created from the keys of a sparse collection.
  let (mins, maxs) = t.getMinMax
  for w in mins.w..maxs.w:
    for z in mins.z..maxs.z:
      for y in mins.y..maxs.y:
        for x in mins.x..maxs.x:
          yield [x, y, z, w]


# procs for drawing to console


proc drawTab*[T](t: SomeTab2i[T]; p: proc(v: Vec2i): char): string =
  ## Turn a sparse collection into a string for echoing
  var yPrev = int.high
  for v in t.grid():
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)

proc drawTab*(t: SomeCtab2i; p: proc(v: Vec2i): char): string =
  ## Turn a sparse collection into a string for echoing
  var yPrev = int.high
  for v in t.grid():
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)

proc drawSet*(t: SomeSet2i; p: proc(v: Vec2i): char): string =
  ## Turn a sparse collection into a string for echoing
  var yPrev = int.high
  for v in t.grid():
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)

proc drawSetSimple*(t: SomeSet2i):string =
  t.drawSet((v) => (if v in t: '#' else: '.'))

proc drawTab*[T](t: SomeTab3i[T]; p: proc(v: Vec3i): char): string =
  ## Turn a sparse collection into a string for echoing
  var zPrev, yPrev = int.high
  for v in t.grid():
    if v.z != zPrev:
      zPrev = v.z
      result.add &"\n\nz={v.z}"
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)

proc drawTab*(t: SomeCtab3i; p: proc(v: Vec3i): char): string =
  ## Turn a sparse collection into a string for echoing
  var zPrev, yPrev = int.high
  for v in t.grid():
    if v.z != zPrev:
      zPrev = v.z
      result.add &"\n\nz={v.z}"
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)

proc drawSet*(t: SomeSet3i; p: proc(v: Vec3i): char): string =
  ## Turn a sparse collection into a string for echoing
  var zPrev, yPrev = int.high
  for v in t.grid():
    if v.z != zPrev:
      zPrev = v.z
      result.add &"\n\nz={v.z}"
    if v.y != yPrev:
      yPrev = v.y
      result.add '\n'
    result.add p(v)


#


proc tests* =
  ## unit tests

  block:
    var
      t = initTable[Vec2i, int]()
      tr = newTable[Vec2i, int]()
    t[0, 1] = 1
    assert 1 == t[0, 1]
    tr[0, 1] = 1
    assert 1 == tr[0, 1]
    let v = [2,3]
    t[v] = 5
    assert 5 == t[v]

  block:
    var t = initTab2i[int]()
    t[-1, 1] = 2
    t[10, -10] = 0
    [mn, mx] ..= t.getMinMax
    assert mn == [-1, -10]
    assert mx == [10, 1]

  block:
    var s = initHashSet[Vec2i]()
    s.incl ori2i
    s.incl [3,1]
    s.incl [2,2]
    s.incl [-1,-1]
    proc p(v:Vec2i):char =
      if v in s: '#'
      else: '.'
    assert s.drawSet(p) == "\n#....\n.#...\n....#\n...#."

  echo "√ tibia passed"

when isMainModule:
  tests()
