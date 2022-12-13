## This file contains procs and templates useful for this advent of code repo.
## I had a macro that turned parts into a function that could be called, (see https://github.com/bobgeis/aoc2021/blob/master/lib/aocutils.nim), but I liked MichaelMarsalek's approach more (see https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/aoc_logic.nim )

import std/[algorithm, monotimes, os, sequtils, strformat, strutils, sugar, tables, times]

import bedrock

const
  inputDir* = "in"
  githash* = staticexec "git rev-parse --short HEAD"
  passStr* = "✅"
  failStr* = "❌"

proc getDt*(t1:float):string = &"{(cpuTime()-t1)*1000:>6.2f}ms"

proc inputPath*(day: int | string, suffix:string=""): string = &"{inputDir}/i{day:02}{suffix}.txt"

proc inputPathDay*(path:string):string =
  let (dir,file,ext) = path.splitFile
  return file[1..2]

proc inputPathSuffix*(path:string):string =
  let (dir,file,ext) = path.splitFile
  if file.len == 3: return ""
  return file[3..file.high]

proc getInputPaths(day: int): seq[string] =
  ## Tries to find the input file to evaluate.
  var args = commandLineParams()
  for arg in args:
    if arg.fileExists:
      result.add arg
    elif arg.inputPath.fileExists:
      result.add arg.inputPath
    elif day.inputPath(arg).fileExists:
      result.add day.inputPath(arg)
    elif arg == "i" and day.inputPath.fileExists:
      result.add day.inputPath
    elif arg == "t" and day.inputPath("t1").fileExists:
      result.add day.inputPath("t1")
    elif (arg == "time"): continue
    elif arg == "full":
      result.add day.inputPath
      for suff in ["t1","t2","t3","t4","o1","o2","o3","o4"]:
        if day.inputPath(suff).fileExists:
          result.add day.inputPath(suff)
    else:
      echo &"Could not find input file {arg} or {arg.inputPath} or {day.inputpath(arg)}"
  if result.len == 0 and day.inputPath.fileExists:
    result.add day.inputPath
  if result.len == 0:
    echo &"Could not find input file for {day}!"

var aocDayProcs: Table[int, proc (x:string):(Table[string,string],Table[string,string])]

proc run*(day: int) =
  for path in day.getInputPaths:
    let (ans,tims) = aocDayProcs[day](path)
    when defined(onelineDay):
      const ds = "day"
      echo &"Day {day:>2} in {tims[ds]}: pt 1 is {ans[$1]} in {tims[$1]}, pt 2 is {ans[$2]} in {tims[$2]}"

template day*(day: static int, body: untyped):untyped =
  block:
    aocDayProcs[day] = proc (path {.inject.}:string):(Table[string,string],Table[string,string]) =
      var
        aocPathSuffix {.inject.} = path.inputPathSuffix
        aocAnswers {.inject.} = initTable[string,string]()
        aocExpectedAnswers {.inject.} = initTable[string,string]()
        aocOutcomes {.inject.} = initTable[string,bool]()
        aocTimes {.inject.} = initTable[string,string]()
      when not defined(silentDay):
        echo "Day ",day," for ",path
      let t1 = cputime()
      body
      let dt = t1.getDt
      aocTimes["day"] = dt
      when not defined(silentDay):
        echo "Time: ",dt
        echon()
      (aocAnswers,aocTimes)
  if isMainModule: run day

template prep*(body:untyped):untyped =
  let t1 = cpuTime()
  body
  let dt = t1.getDt
  aocTimes["prep"] = dt
  when not defined(silentDay):
    echo "  Prep: ",dt

proc partActive(p:static typed):bool =
  (p.toString == "1" or
    p.toString == "2" or
    not defined(skipExtraParts)) and
  not ((defined(skipPart1) and p.toString[0] == '1') or
    (defined(skipPart2) and p.toString[0] == '2'))

template part*(p:static typed, body:untyped):untyped =
  block:
    when partActive(p):
      const aocCurrentPartString {.inject.} = p.tostring
      let
        t1 = cputime()
        a = body
        dt = t1.getDt
      aocAnswers[aocCurrentPartString] = a.tostring
      aocTimes[aocCurrentPartString] = dt
      if aocCurrentPartString in aocExpectedAnswers:
        aocOutcomes[aocCurrentPartString] = a.tostring == aocExpectedAnswers[aocCurrentPartString]
      when not defined(silentDay):
        echo "  Part ",aocCurrentPartString,": ",a
        echo "    Time: ",dt
        if aocCurrentPartString in aocOutcomes:
          let outcome = if aocOutcomes[aocCurrentPartString]: passStr else: failStr
          echo "    Test: ",outcome
    else: discard

template answer*(suffix:static string, res:typed):untyped =
  when not defined(skipTests):
    if suffix == aocPathSuffix:
      aocExpectedAnswers[aocCurrentPartString] = res.tostring

template answer*(res:typed):untyped = answer "", res
template answerT*(res:typed):untyped = answer "t1",res
template answerT2*(res:typed):untyped = answer "t2",res
template answerO*(res:typed):untyped = answer "o1",res

template answer*(p:static typed, suffix:static string, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  when partActive(p) and not defined(skipTests) and not defined(silentDay):
    if suffix == aocPathSuffix and p.tostring in aocAnswers:
      if aocAnswers[p.tostring] == res.tostring: echo "    Test: PASS"
      else: echo "    Test: FAIL expected ",res.tostring

template answer*(p:static typed, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  answer(p,"",res)

proc discussion*(body:string) =
  when not defined(silentDay) and not defined(skipExtraParts):
    echo &"  Discussion:\n{body}"

#

proc tests* =
  block:
    let i00t1 = "in/i00t1.txt"
    assert 0.inputPath("t1") == i00t1
    assert i00t1.inputPathDay == "00"
    assert i00t1.inputPathSuffix == "t1"
  echo "√ aocutils passed"

when isMainModule:
  tests()
