## shenanigans: for causing trouble.
##

import std/[macros, math, monotimes, sequtils, strformat, strutils, tables, times]

import bedrock


# lift to map


template liftToMap*(procName, newProcName: untyped, X: static[bool] = false) =
  ## Creates a new mapping proc called `newProcName` that calls `procName` on every element of a sequence to produce new output.  Note well that `newProcName` and `procName` can have the same name, and if they do then calling the produced function on nested sequences will apply it recursively.  This is essentially another way to do `mapIt(it.procName)`.  The last argument to this template is an eXport flag (default false), if set to true, then the proc must be defined at the top level and will be exported.
  ## Inspired by https://github.com/jlp765/seqmath/blob/master/src/seqmath/smath.nim#L55
  runnableExamples:
    abs.liftToMap(absMap)
    assert @[-1, -2, -3].absMap == @[1, 2, 3]
  proc newProcName[T](x: openarray[T]): auto =
    var temp: T
    type outType = type(procName(temp))
    result = newSeq[outType](x.len)
    for i in 0..<x.len:
      result[i] = procName(x[i])
  when X:
    export newProcName

template liftToMap2*(procName, newProcName: untyped, X: static[bool] = false) =
  ## Like liftToMap, this creates a new proc with the name `newProcName`, but the intention is to create a map function that takes TWO openarrays, instead of one, and the output is taken from calling the mapped proc with items from each array.  The last argument to this template is an eXport flag (default false), if set to true, then the proc must be defined at the top level and will be exported.
  ## Inspired by https://github.com/jlp765/seqmath/blob/master/src/seqmath/smath.nim#L55
  runnableExamples:
    `+`.liftToMap2(plusMap2)
    assert @[-1, -2, 3].plusMap2(@[4, 6, 2]) == @[3, 4, 5]
  proc newProcName[T, U](x: openarray[T], y: openarray[U]): auto =
    var temp: T
    var temp2: U
    let l = min(x.len, y.len)
    type outType = type(procName(temp, temp2))
    result = newSeq[outType](l)
    for i in 0..<l:
      result[i] = procName(x[i], y[i])
  when X:
    export newProcName

template liftToMap2padded*(procName, newProcName: untyped, X: static[
    bool] = false) =
  ## Like liftToMap, this creates a new proc with the name `newProcName`, but the intention is to create a map function that takes TWO openarrays, instead of one, and the output is taken from calling the mapped proc with items from each array.  The last argument to this template is an eXport flag (default false), if set to true, then the proc must be defined at the top level and will be exported.  This version will create a proc that accepts three open arrays of the same type, and also takes a `pad` argument that will be used to fill out any openarrays that are shorter than the longest.
  ## Inspired by https://github.com/jlp765/seqmath/blob/master/src/seqmath/smath.nim#L55
  runnableExamples:
    `+`.liftToMap2padded(plusMap2p)
    assert @[-1, -2, 3].plusMap2p(@[4, 6, 2, 2, 3, 4, 5], pad = 1) == @[3, 4, 5,
        3, 4, 5, 6]
  proc newProcName[T](x, y: openarray[T], pad: T = T.default): auto =
    var temp: T
    let l = max(x.len, y.len)
    type outType = type(procName(temp, temp))
    result = newSeq[outType](l)
    template getOr[T](s: openArray[T], i: int, t: T): T =
      if i < s.len: s[i] else: t
    for i in 0..<l:
      result[i] = procName(x.getOr(i, pad), y.getOr(i, pad))
  when X:
    export newProcName

template liftToMap3*(procName, newProcName: untyped, X: static[bool] = false) =
  ## Like liftToMap, this creates a new proc with the name `newProcName`, but the intention is to create a map function that takes THREE openarrays, instead of one, and the output is taken from calling the mapped proc with items from each array.  The last argument to this template is an eXport flag (default false), if set to true, then the proc must be defined at the top level and will be exported.
  ## Inspired by https://github.com/jlp765/seqmath/blob/master/src/seqmath/smath.nim#L55
  # runnableExamples:
  #   from math import floor
  #   from strutils import parseInt
  #   from bedrock import between
  #   between[int].liftToMap3(btMap)
  #   assert @[1, 2, 3].btMap(@[4, 6, 2], @[-3, 1, 1]) == @[true, true, false]
  #   proc foo(x: string, y: int, z: float): int64 = (x.parseInt + y +
  #       z.floor.int).int64
  #   assert foo("3", 2, 3.0) == 8'i64
  #   foo.liftToMap3(fooMap)
  #   assert fooMap(@["3", "5"], @[2, 3], @[2.0, 10.0]) == @[7'i64, 18]
  proc newProcName[T, U, V](x: openarray[T], y: openarray[U], z: openarray[V]): auto =
    var
      temp1: T
      temp2: U
      temp3: V
    let l = min([x.len, y.len, z.len])
    type outType = type(procName(temp1, temp2, temp3))
    result = newSeq[outType](l)
    for i in 0..<l:
      result[i] = procName(x[i], y[i], z[i])
  when X:
    export newProcName

template liftToMap3padded*(procName, newProcName: untyped, X: static[
    bool] = false) =
  ## Like liftToMap, this creates a new proc with the name `newProcName`, but the intention is to create a map function that takes THREE openarrays, instead of one, and the output is taken from calling the mapped proc with items from each array.  The last argument to this template is an eXport flag (default false), if set to true, then the proc must be defined at the top level and will be exported.  This version will create a proc that accepts three open arrays of the same type, and also takes a `pad` argument that will be used to fill out any openarrays that are shorter than the longest.
  ## Inspired by https://github.com/jlp765/seqmath/blob/master/src/seqmath/smath.nim#L55
  proc newProcName[T](x, y, z: openarray[T], pad: T): auto =
    var temp: T
    let l = max(x.len, y.len)
    type outType = type(procName(temp, temp, temp))
    result = newSeq[outType](l)
    template getOr[T](s: openArray[T], i: int, t: T): T =
      if i < s.len: s[i] else: t
    for i in 0..<l:
      result[i] = procName(x.getOr(i, pad), y.getOr(i, pad), z.getOr(i, pad))
  when X:
    export newProcName


# lift to fold


template liftToFold*(procName, newProcName: untyped, X: static bool) =
  ## Create a function that will take an openArray and run some reducer function over it.
  proc newProcName[T,U](xs: openArray[T],start: sink U): U =
    var acc = start
    for x in xs:
      acc = procName(acc,x)
    return acc
  when X:
    export newProcName

template mLiftToFold*(procName, newProcName: untyped, X: static bool) =
  ## Create a function that will take an openArray and a mutable accumulator, and call the function with the accumulator and each item in turn.
  proc newProcName[T,U](xs: openArray[T],acc: var U): U =
    for x in xs:
      procName(acc,x)
  when X:
    export newProcName

##
## distribute
##

proc recursiveReplace(body, placeholder, target: NimNode): NimNode =
  ## This is a helper function for DistributeSymbols
  ## Adapted from: https://github.com/Kaynato/AdventOfCode/blob/9223e1b5c8675b1b6664d41b9dc984759c0aba17/graphlib/copymacro.nim
  if body.kind == nnkIdent and body.strVal == placeholder.strVal:
    return target
  else:
    result = copyNimNode(body)
    for n in body:
      result.add(recursiveReplace(n, placeholder, target))

macro DistributeSymbol*(standIn, targetList, body: untyped): untyped =
  ## For every item in `targetList` it will call body with `standIn` replaced with the item.  This can be used to quickly eliminate large amounts of boilerplate.  Many potential uses of this can be served by templates, but it's fun to play with macros.  TODO: better error handling.
  ## Adapted from: https://github.com/Kaynato/AdventOfCode/blob/9223e1b5c8675b1b6664d41b9dc984759c0aba17/graphlib/copymacro.nim
  # runnableExamples:
  #   DistributeSymbol(Op, [`+`, `-`, `*`]):
  #     proc Op*(a, b: (int, int)): (int, int) =
  #       (Op(a[0], b[0]), Op(a[1], b[1]))

  #   let
  #     a = (2, 3)
  #     b = a * (2, -1)

  #   assert a + b == (x: 6, y: 0)
  #   assert a - b == (x: -2, y: 6)
  #   assert a * b == (x: 8, y: -9)
  ##
  result = newNimNode(nnkStmtList)
  for target in targetList:
    result.add(body.recursiveReplace(standIn, target))
  result.add()
  # echo treeRepr result

macro DistributeSymbols*(standIns, targetLists, body: untyped): untyped =
  ## Similar to DistributeSymbol, except the standIns and targetLists are both lists themselves.  Every list in targetLists, a new instance of the body will be made with every symbol in standIns replaced by the symbol in the target list with the same offset.  This can be used to quickly eliminate large amounts of boilerplate.  Many potential uses of this can be served by templates, but it's fun to play with macros.  TODO: better error handling.
  ## Adapted from: https://github.com/Kaynato/AdventOfCode/blob/9223e1b5c8675b1b6664d41b9dc984759c0aba17/graphlib/copymacro.nim
  # runnableExamples:
  #   DistributeSymbols([Name, Fn], [[origin, default], [lowest, low], [highest, high]]):
  #     proc Name[N, A](): Vec[N, A] =
  #       for i in 0..result.high:
  #         result[i] = Fn(A)
  #   assert origin[4,int]() == [0,0,0,0]
  #   assert lowest[3,int]() = [int.low,int.low,int.low]
  #   assert highest[2,float]() == [float.high,float.high]
  ##
  result = newNimNode(nnkStmtList)
  for targetList in targetLists:
    # echo targetList.repr
    var statement = body
    for i in 0..<targetList.len:
      statement = statement.recursiveReplace(standIns[i], targetList[i])
    result.add statement
    continue
  result.add()
  # echo treeRepr result
  # echo result.repr


# unpacking


macro `..=`*(lhs: untyped, rhs: typed): auto =
  ## Unpacking macro: Use this to assign multiple variables from a data structure.  If the data structure uses numerical indexes, then you can use notation like: `[x,y,_,w] ..= someSeq`.  Note that _s are skipped.  If the data structure is an object or named tuple, then you can use notation like: `{x,y,z:zCoord,w} ..= someTuple`.  Note that :s are used to rename variables, otherwise the name of the variable will be the name of the field.  There are three flavors of this macro: `..=` defines lets, `..=^` defines vars, and `..=!` assigns to existing vars.
  ## Adapted from https://github.com/Kaynato/AdventOfCode/blob/master/unpack.nim and https://github.com/technicallyagd/unpack
  runnableExamples:
    type Foo = object
      x, y, z: int
    let foo = Foo(x: 3, y: 5, z: 8)
    {x, y, z: zCoord} ..= foo
    assert [x, y, zCoord] == [3, 5, 8]
    [a, b, _, _, e] ..= @[5, 6, 7, 8, 9, 10, 11, 12, 13]
    assert [a, b, e] == [5, 6, 9]
  let t = genSym()
  result = newStmtList(quote do:
    let `t` = `rhs`)
  if lhs.kind == nnkBracket or lhs.kind == nnkPar:
    for i in 0..<lhs.len:
      let v = lhs[i]
      if $v.toStrLit != "_":
        result.add(quote do:
          let `v` = `t`[`i`])
  elif lhs.kind == nnkCurly or lhs.kind == nnkTableConstr:
    for i in 0..<lhs.len:
      if lhs[i].kind == nnkExprColonExpr:
        let
          v0 = lhs[i][0]
          v1 = lhs[i][1]
        result.add(quote do:
          let `v1` = `t`.`v0`)
      else:
        let v = lhs[i]
        result.add(quote do:
          let `v` = `t`.`v`)
  # echo treeRepr result
  # echo result.repr

macro `..=^`*(lhs: untyped, rhs: typed): auto =
  ## Unpacking macro: Use this to assign multiple variables from a data structure.  If the data structure uses numerical indexes, then you can use notation like: `[x,y,_,w] ..= someSeq`.  Note that _s are skipped.  If the data structure is an object or named tuple, then you can use notation like: `{x,y,z:zCoord,w} ..= someTuple`.  Note that :s are used to rename variables, otherwise the name of the variable will be the name of the field.  There are three flavors of this macro: `..=` defines lets, `..=^` defines vars, and `..=!` assigns to existing vars.
  ## Adapted from https://github.com/Kaynato/AdventOfCode/blob/master/unpack.nim and https://github.com/technicallyagd/unpack
  runnableExamples:
    let s = @[1, 2, 3, 4]
    [a, b, _, c] ..=^ s
    a += c
    assert a == 5
  let t = genSym()
  result = newStmtList(quote do:
    let `t` = `rhs`)
  if lhs.kind == nnkBracket or lhs.kind == nnkPar:
    for i in 0..<lhs.len:
      let v = lhs[i]
      if $v.toStrLit != "_":
        result.add(quote do:
          var `v` = `t`[`i`])
  elif lhs.kind == nnkCurly or lhs.kind == nnkTableConstr:
    for i in 0..<lhs.len:
      if lhs[i].kind == nnkExprColonExpr:
        let
          v0 = lhs[i][0]
          v1 = lhs[i][1]
        result.add(quote do:
          var `v1` = `t`.`v0`)
      else:
        let v = lhs[i]
        result.add(quote do:
          var `v` = `t`.`v`)

macro `..=!`*(lhs: untyped, rhs: typed): auto =
  ## Unpacking macro: Use this to assign multiple variables from a data structure.  If the data structure uses numerical indexes, then you can use notation like: `[x,y,_,w] ..= someSeq`.  Note that _s are skipped.  If the data structure is an object or named tuple, then you can use notation like: `{x,y,z:zCoord,w} ..= someTuple`.  Note that :s are used to rename variables, otherwise the name of the variable will be the name of the field.  There are three flavors of this macro: `..=` defines lets, `..=^` defines vars, and `..=!` assigns to existing vars.
  ## Adapted from https://github.com/Kaynato/AdventOfCode/blob/master/unpack.nim and https://github.com/technicallyagd/unpack
  runnableExamples:
    var x, y, z: int = 0
    let coords = [5, 7, 12]
    [x, y, z] ..=! coords
    assert x + y == z
  let t = genSym()
  result = newStmtList(quote do:
    let `t` = `rhs`)
  if lhs.kind == nnkBracket or lhs.kind == nnkPar:
    for i in 0..<lhs.len:
      let v = lhs[i]
      if $v.toStrLit != "_":
        result.add(quote do:
          `v` = `t`[`i`])
  elif lhs.kind == nnkCurly or lhs.kind == nnkTableConstr:
    for i in 0..<lhs.len:
      if lhs[i].kind == nnkExprColonExpr:
        let
          v0 = lhs[i][0]
          v1 = lhs[i][1]
        result.add(quote do:
          `v1` = `t`.`v0`)
      else:
        let v = lhs[i]
        result.add(quote do:
          `v` = `t`.`v`)

macro importModules*(modules: static[openarray[string]], prefix: static[string] = ""): untyped =
  ## Import a list of modules with an optional prefix. Credit: https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/test.nim
  ## I had a version of this macro I made myself but it was less concise.
  ## *NB*: Modules may need absolute path, not relative path!
  ## Eg: importing a sibling module "d01" in the "day" dir,
  ## may require "day/d01" rather than just "d01"
  nnkImportStmt.newTree(modules.mapIt(newIdentNode &"{prefix}{it}"))

#

proc tests* =
  ## unit tests

  block liftToMapOne:
    liftToMap(abs,absMap)
    absMap.liftToMap(absMapMap)
    assert @[1, -2, 3].absMap == @[1, 2, 3]
    assert @[@[1, -2, 3], @[-3, -4]].absMapMap == @[@[1, 2, 3], @[3, 4]]

  block liftToMapTwo:
    `+`.liftToMap2(plusMap2)
    `+`.liftToMap2padded(plusMap2p)
    assert @[-1, -2, 3].plusMap2(@[4, 6, 2]) == @[3, 4, 5]
    assert @[-1, -2, 3].plusMap2p(@[4, 6, 2, 2, 3, 4, 5], pad = 1) == @[3, 4, 5,
        3, 4, 5, 6]

  block liftToMapThree:
    between[int].liftToMap3(btMap)
    assert @[1, 2, 3].btMap(@[4, 6, 2], @[-3, 1, 1]) == @[true, true, false]
    proc foo(x: string, y: int, z: float): int64 = (x.parseInt + y +
        z.floor.int).int64
    assert foo("3", 2, 3.0) == 8'i64
    foo.liftToMap3(fooMap)
    assert fooMap(@["3", "5"], @[2, 3], @[2.0, 10.0]) == @[7'i64, 18]

  block unpacking:
    type
      Foo = object
        x, y, z: int
    let foo = Foo(x: 3, y: 5, z: 8)
    {x, y, z: zCoord} ..= foo
    assert [x, y, zCoord] == [3, 5, 8]
    [a, b, _, _, e] ..= @[5, 6, 7, 8, 9, 10, 11, 12, 13]
    assert [a, b, e] == [5, 6, 9]

  block unpackingVar:
    let s = @[1, 2, 3, 4]
    [a, b, _, c] ..=^ s
    a += b + c
    assert a == 7

  block unpackingMutation:
    var x, y, z: int = 0
    let coords = [5, 7, 12]
    [x, y, z] ..=! coords
    assert x + y == z

  echo "√ shenanigans passed"

when isMainModule:
  tests()