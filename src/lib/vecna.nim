## Vecna: a lich famous for his love of vectors.
## Vectors of N dimensions and Any type.
##

# std lib modules https://nim-lang.org/docs/lib.html
import std/[math]

import bedrock, shenanigans


# types


type
  Vec*[N: static[int]; A] = array[N, A]

  Vec2i* = Vec[2, int]
  Vec3i* = Vec[3, int]
  Vec4i* = Vec[4, int]
  Vec5i* = Vec[5, int]

  Vec2f* = Vec[2, float]
  Vec3f* = Vec[3, float]
  Vec4f* = Vec[4, float]
  Vec5f* = Vec[5, float]

  Vec2i64* = Vec[2, int64]
  Vec3i64* = Vec[3, int64]
  Vec4i64* = Vec[4, int64]
  Vec5i64* = Vec[5, int64]


# convenience getters & setters for x,y,z,w


template x*[N, A](a: Vec[N, A]): untyped = a[0]
template y*[N, A](a: Vec[N, A]): untyped = a[1]
template z*[N, A](a: Vec[N, A]): untyped = a[2]
template w*[N, A](a: Vec[N, A]): untyped = a[3]
template `x=`*[N, A](a: Vec[N, A]; b: A): untyped = a[0] = b
template `y=`*[N, A](a: Vec[N, A]; b: A): untyped = a[1] = b
template `z=`*[N, A](a: Vec[N, A]; b: A): untyped = a[2] = b
template `w=`*[N, A](a: Vec[N, A]; b: A): untyped = a[3] = b


proc one[A](a: typedesc[A]):A = 1.0.A


# vectors for origin, ones, lowest, and highest


DistributeSymbols([Name, Fn], [[origin, default], [lowest, low], [highest, high], [ones, one]]):
  proc Name*[N, A](): Vec[N, A] =
    for i in 0..result.high:
      result[i] = Fn(A)

const
  ori2i* = origin[2,int]()
  ori2f* = origin[2,float]()
  ori3i* = origin[3,int]()
  ori3f* = origin[3,float]()
  ori4i* = origin[4,int]()
  ori4f* = origin[4,float]()
  ones2i* = ones[2,int]()
  ones2f* = ones[2,float]()
  ones3i* = ones[3,int]()
  ones3f* = ones[3,float]()
  ones4i* = ones[4,int]()
  ones4f* = ones[4,float]()
  low2i* = lowest[2,int]()
  low2f* = lowest[2,float]()
  low3i* = lowest[3,int]()
  low3f* = lowest[3,float]()
  low4i* = lowest[4,int]()
  low4f* = lowest[4,float]()
  high2i* = highest[2,int]()
  high2f* = highest[2,float]()
  high3i* = highest[3,int]()
  high3f* = highest[3,float]()
  high4i* = highest[4,int]()
  high4f* = highest[4,float]()


# conversions


DistributeSymbols([Name, Num], [[toVec2, 2], [toVec3, 3], [toVec4, 4]]):
  proc Name*[A](v: openArray[A]; def: A = A.default): Vec[Num, A] =
    ## Extend or truncate a vector, with optional default value
    for i in 0..result.high:
      result[i] = v.getOr(i, def)


# arithmetic


DistributeSymbol(Op, [`+=`, `-=`, `*=`, `/=`]):
  proc Op*[N, A](a: var Vec[N, A]; b: Vec[N, A]) =
    ## Mutate each item of the vector, eg: a[i] = Op(a[i],b[i])
    for i in 0..a.high:
      Op(a[i], b[i])
  proc Op*[N, A](a: var Vec[N, A]; b: A) =
    ## Mutate each item of the vector, eg: a[i] = Op(a[i],b)
    for i in 0..a.high:
      Op(a[i], b)

DistributeSymbol(Op, [`+`, `-`, `*`, `/`, `mod`, `div`]):
  proc Op*[N, A](a, b: Vec[N, A]): Vec[N, A] =
    ## Apply to each item of the vector, eg: result[i] = Op(a[i],b[i])
    for i in 0..a.high:
      result[i] = Op(a[i], b[i])
  proc Op*[N, A](a: Vec[N, A]; b: A): Vec[N, A] =
    ## Apply to each item of the vector, eg: result[i] = Op(a[i],b)
    for i in 0..a.high:
      result[i] = Op(a[i], b)

DistributeSymbol(Op, [`<`,`>`,`<=`,`>=`]):
  proc Op*[N, A](a, b: Vec[N, A]): bool =
    ## Compare each item of the vector, eg: Op(a[i],b[i]) and Op(a[j],b[j]) and ...
    for i in 0..a.high:
      if not Op(a[i], b[i]): return false
    return true

  proc Op*[N, A](a: Vec[N, A]; b: A): bool =
    ## Compare each item of the vector, eg: Op(a[i],b) and Op(a[j],b) and ...
    for i in 0..a.high:
      if not Op(a[i], b): return false
    return true

proc `max=`*[N, A](a: var Vec[N, A]; b: Vec[N, A]) =
  for i in 0..a.high:
    a[i] = a[i].max(b[i])

proc `min=`*[N, A](a: var Vec[N, A]; b: Vec[N, A]) =
  for i in 0..a.high:
    a[i] = a[i].min(b[i])


# geometry


proc lerp*[N; A: SomeFloat](a, b: Vec[N, A]; v: A): Vec[N,A] {.inline.} =
  ## linear interpolate between two vectors
  a * (1.0.A - v) + b * v

proc `*.`*[N, A](a, b: Vec[N, A]): A {.inline.} =
  ## Dot product operator
  for i in 0..a.high:
    result += a[i] * b[i]

proc dot*[N, A](a, b: Vec[N, A]): A {.inline.} =
  ## Dot product
  a *. b

proc `*+`*[A](a, b: Vec[2, A]): A {.inline.} =
  ## Cross product operator. Only defined for vectors of length 2 and 3.
  a[0]*b[1] - a[1]*b[0]

proc cross*[A](a, b: Vec[2, A]): A {.inline.} =
  ## Cross product. Only defined for vectors of length 2 and 3.
  a *+ b

proc `*+`*[A](a, b: Vec[3, A]): Vec[3, A] =
  ## Cross product operator. Only defined for vectors of length 2 and 3.
  result[0] = a[1]*b[2] - a[2]*b[1]
  result[1] = a[2]*b[0] - a[0]*b[2]
  result[2] = a[0]*b[1] - a[1]*b[0]
proc cross*[A](a, b: Vec[3, A]): Vec[3, A] {.inline.} =
  ## Cross product. Only defined for vectors of length 2 and 3.
  a *+ b

proc mdist*[N, A](a: Vec[N, A]): A =
  ## Manhattan distance to origin
  for i in 0..a.high:
    result += a[i].abs

proc mdist*[N, A](a, b: Vec[N, A]): A =
  ## Manhattan distance between two vectors
  for i in 0..a.high:
    result += (b[i] - a[i]).abs

proc dmdist*[N,A](a: Vec[N,A]):A =
  ## Manhattan distance counting diagonals as adjacent to origin.
  result = A.low
  for i in 0..a.high:
    result = max(result, a[i].abs)

proc dmdist*[N,A](a,b: Vec[N,A]):A =
  ## Manhattan distance counting diagonals as adjacent.
  result = A.low
  for i in 0..a.high:
    result = max(result,(b[i] - a[i]).abs)

proc mag*[A](a: Vec[2, A]): A {.inline.} =
  ## Find the magnitude of a vector.
  ## Note this uses hypot which is only defined for float32 and float64.
  hypot(a.x, a.y)

proc magsq*[N,A](a: Vec[N,A]): A {.inline.} =
  ## Find the magnitude squared of a vector, which is faster than finding the magnitude
  a *. a

proc mag*[N, A](a: Vec[N, A]): A {.inline.} =
  ## Find the magnitude of a vector
  ## Note this uses sqrt which is only defined for float32 and float64.
  a.magsq.sqrt

proc distsq*[N,A](a,b: Vec[N,A]): A {.inline.} =
  ## Find the distance squared between two points represented as vectors.
  ## This can be faster than finding the actual distance
  magsq(b - a)

proc dist*[N, A](a, b: Vec[N, A]): A {.inline.} =
  ## distance between two points represented as vectors.
  distsq(a,b).sqrt

proc normed*[N, A](a: Vec[N, A]): Vec[N, A] {.inline.} =
  ## Get a new unit vector in the direction of a.
  a / a.mag

proc norm*[N, A](a: var Vec[N, A]) {.inline.} =
  ## Normalize `a` to have length 1
  a /= a.mag

proc reversed*[N, A](a: Vec[N, A]): Vec[N, A] =
  ## Create a vector that is the reverse of the arg.
  for i in 1..a.len:
    result[i-1] = a[^1]

proc reverse*[N, A](a: var Vec[N, A]) =
  ## Reverse a var vector in place.
  var swap: A
  for i in 1..(a.len div 2):
    swap = a[i-1]
    a[i-1] = a[^i]
    a[^i] = swap

proc angle*[A](a: Vec[2, A]): float {.inline.} =
  ## Get the angle a 2D vector makes with the origin.
  arctan2(a.y.float, a.x.float)

proc angle*[A](a, b: Vec[2, A]): float {.inline.} =
  ## Get the angle between two 2D vectors.
  arctan2((b.y-a.y).float, (b.x-a.x).float)

proc angle*[N, A](a, b: Vec[N, A]): float {.inline.} =
  ## Get the angle between two N-dim vectors.
  arccos( (a *. b) / (a.mag * b.mag))

proc ratoxy*[A](ra: Vec[2,A]): Vec[2,A] {.inline.} =
  ## Turn a 2D vector of polar coordinates into cartesian coordinates.
  [ra[0] * cos(ra[1]), ra[0] * sin(ra[1])]

proc xytora*[A](xy: Vec[2,A]): Vec[2,A] {.inline.} =
  ## Turn a 2D vector in cartesian cooardinates into polar coordinates
  [xy.mag, xy.angle]

proc aabb*[N, A](a, c1, c2: Vec[N, A]): bool =
  ## Is point `a` within an axis-aligned bounding box described by two opposing corners `c1` and `c2`?
  for i in 0..a.high:
    if not a[i].bt(c1[i], c2[i]): return false
  return true

proc onseg*[A](a, p1, p2: Vec[2, A]): bool =
  ## Is the point `a` on the line segment `p1` to `p2`?
  a.aabb(p1, p2) and ((a.x - p1.x)/(p2.x - p1.x) == (a.y - p1.y)/(p2.y - p1.y))

iterator countbetween*[N:static[int],A:SomeNumber](a, b: Vec[N,A], step: Vec[N,A] = ones[N,A]()): Vec[N,A] =
  ## Iterate from a to b with an optional step size.
  if a == b: yield a
  else:
    let delta = [step.x * cmp(b.x,a.x), step.y * cmp(b.y,a.y)]
    var curr = a
    while curr.aabb(a, b):
      yield curr
      curr += delta


# directions


const
  dirs2d4* = [[0,1],[1,0],[0,-1],[-1,0]] ## N, E, S, W
  dirs2d5* = [[0,1],[1,0],[0,-1],[-1,0],[0,0]] ## N, E, S, W, O
  dirs2d8* = [
    [0,1],[1,1],[1,0],[1,-1],
    [0,-1],[-1,-1],[-1,0],[-1,1],
  ] ## N, NE, E, SE, S, SW, W, NW
  dirs2d9* = [
    [0,1],[1,1],[1,0],[1,-1],
    [0,-1],[-1,-1],[-1,0],[-1,1],
    [0,0],
  ] ## N, NE, E, SE, S, SW, W, NW, O
  dirs3d6* = [
    [0,1,0],[1,0,0],[0,-1,0],
    [-1,0,0],[0,0,1],[0,0,-1],
  ] ## N, E, S, W, U, D
  dirs3d7* = [
    [0,1,0],[1,0,0],[0,-1,0],
    [-1,0,0],[0,0,1],[0,0,-1],
    [0,0,0],
  ] ## N, E, S, W, U, D, O
  dirs3d26* = [
    [0,1,1],[1,1,1],[1,0,1],[1,-1,1],
    [0,-1,1],[-1,-1,1],[-1,0,1],[-1,1,1],
    [0,0,1],
    [0,1,0],[1,1,0],[1,0,0],[1,-1,0],
    [0,-1,0],[-1,-1,0],[-1,0,0],[-1,1,0],
    [0,1,-1],[1,1,-1],[1,0,-1],[1,-1,-1],
    [0,-1,-1],[-1,-1,-1],[-1,0,-1],[-1,1,-1],
    [0,0,-1],
  ] ## all cubes reachable from a cube, incl corners, not origin
  dirs3d27* = [
    [0,1,1],[1,1,1],[1,0,1],[1,-1,1],
    [0,-1,1],[-1,-1,1],[-1,0,1],[-1,1,1],
    [0,0,1],
    [0,1,0],[1,1,0],[1,0,0],[1,-1,0],
    [0,-1,0],[-1,-1,0],[-1,0,0],[-1,1,0],
    [0,0,0],
    [0,1,-1],[1,1,-1],[1,0,-1],[1,-1,-1],
    [0,-1,-1],[-1,-1,-1],[-1,0,-1],[-1,1,-1],
    [0,0,-1],
  ] ## all cubes reachable from a cube, incl corners and origin

  basis2i* = [[1,0],[0,1]]
  basis3i* = [[1,0,0],[0,1,0],[0,0,1]]
  basis4i* = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
  basis5i* = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]

proc getAdj*[N,A](v:Vec[N,A],dirs: openArray[Vec[N,A]]):seq[Vec[N,A]] =
  for dir in dirs: result.add(v + dir)

proc getAdj4*(v:Vec2i):seq[Vec2i] = v.getAdj(dirs2d4)
proc getAdj5*(v:Vec2i):seq[Vec2i] = v.getAdj(dirs2d5)
proc getAdj8*(v:Vec2i):seq[Vec2i] = v.getAdj(dirs2d8)
proc getAdj9*(v:Vec2i):seq[Vec2i] = v.getAdj(dirs2d9)

proc getAdj6*(v:Vec3i):seq[Vec3i] = v.getAdj(dirs3d6)
proc getAdj7*(v:Vec3i):seq[Vec3i] = v.getAdj(dirs3d7)
proc getAdj26*(v:Vec3i):seq[Vec3i] = v.getAdj(dirs3d26)
proc getAdj27*(v:Vec3i):seq[Vec3i] = v.getAdj(dirs3d27)

proc toDir*(c:char):Vec2i =
  case c:
  of 'N': [0,1]
  of 'S': [0,-1]
  of 'E': [1,0]
  of 'W': [-1,0]
  of 'U': [0,1]
  of 'D': [0,-1]
  of 'R': [1,0]
  of 'L': [-1,0]
  else: raise

proc toDir*(s:string):Vec2i =
  if s.len == 1: s[0].toDir
  else:
    case s:
    of "NE": [1,1]
    of "SE": [1,-1]
    of "NW": [-1,1]
    of "SW": [-1,-1]
    of "UR": [1,1]
    of "DR": [1,-1]
    of "UL": [-1,1]
    of "DL": [-1,-1]
    else: raise


#


proc tests* =
  ## unit tests

  block getters:
    assert 1 == [1, 2, 3, 4].x
    assert 2 == [1, 2, 3, 4].y
    assert 3 == [1, 2, 3, 4].z
    assert 4 == [1, 2, 3, 4].w

  block constants:
    assert ori2f == [0.0,0.0]
    assert ones4i == [1,1,1,1]
    assert low2i == [int.low,int.low]
    assert high2f == [float.high,float.high]
    assert [0, 0] == origin[2, int]()
    assert [0,0,0,0] == ori4i

  block conversions:
    assert [1,2].toVec3(3) == [1,2,3]
    assert [1,2,3,4].toVec2() == [1,2]
    assert [2].toVec4(1) == [2,1,1,1]
    assert [2].toVec4() == [2,0,0,0]

  block arithmetic:
    assert [1,2] + [2,3] == [3,5]
    var a = [1, 2, 3, 4]
    a.x += 2
    a.y = a.z + 5
    a.w *= a.x
    assert 3 == a.x
    assert 8 == a.y
    assert 6 == a.z + a.z
    assert 12 == a.w
    a *= 2
    assert a == [6,16,6,24]
    a += a - [5,15,5,23]
    assert a == [7,17,7,25]

  block geometry:
    assert [1,0] *. [0,1] == 0
    assert [1,0] *. [1,0] == 1
    assert 77 == [4, 5, 6] *. [2, 3, 9]
    assert 18 == ([1, 2, 3] + [3, 4, 5]).mdist

  block directions:
    assert dirs2d4[0] == [0,1]

  echo "√ vecna passed"

when isMainModule:
  tests()