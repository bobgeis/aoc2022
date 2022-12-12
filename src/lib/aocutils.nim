## This file contains procs and templates useful for this advent of code repo.
## I had a macro that turned parts into a function that could be called, (see https://github.com/bobgeis/aoc2021/blob/master/lib/aocutils.nim), but I liked MichaelMarsalek's approach more (see https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/aoc_logic.nim )

import std/[algorithm, monotimes, os, sequtils, strformat, strutils, sugar, tables, times]

import bedrock

const
  inputDir* = "in"
  githash* = staticexec "git rev-parse --short HEAD"

proc formatTime*(t1,t2:float):string = &"{t2-t1:2} s"

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


var solutionProcs: Table[int, proc (x:string):Table[string,string]]
var solutionResults: Table[int, Table[string,Table[string,string]]]
var dayProcs: Table[int, proc (x:string)]

proc checkResults(results: Table[string,string], day:int, path:string):Table[string,string] =
  ## Checks if a given result has an expected value for that day, path, and part. If the result doesn't match the expected value, then add the expected value to the errors table.
  let suffix = path.inputPathSuffix
  var checks = initTable[string,string]()
  if not solutionResults.contains(day): return checks
  elif not solutionResults[day].contains(suffix):
    return checks
  let expectedResults = solutionResults[day][suffix]
  for part,res in results.pairs:
    if expectedResults.contains(part):
      if expectedResults[part] != res:
        checks[part] = &"FAIL: should be {expectedResults[part]}"
      else:
        checks[part] = "PASS"
  return checks

proc run*(day: int, isMain: static bool=false) =
  for path in day.getInputPaths:
    dayProcs[day](path)

template day*(day: static int, body: untyped):untyped =
  block:
    dayProcs[day] = proc (path {.inject.}:string) =
      var dayAnswers {.inject.} = initTable[string,string]()
      var dayTimes {.inject.} = initTable[string,Duration]()
      var dayPathSuffix {.inject.} = path.inputPathSuffix
      echo "Day ",day," for ",path
      let t1 = cputime()
      body
      let t2 = cputime()
      let ts = formatTime(t1,t2)
      echo "Time: ",ts
      echon()
  if isMainModule: run day, isMain=true

proc partActive(p:static typed):bool =
  (p.toString == "1" or
    p.toString == "2" or
    not defined(skipExtraParts)) and
  not ((defined(skipPart1) and p.toString[0] == '1') or
    (defined(skipPart2) and p.toString[0] == '2'))

template part*(p:static typed, body:untyped):untyped =
  block:
    when partActive(p):
      const ps = p.tostring
      let
        t1 = cputime()
        a = body
        t2 = cputime()
      dayAnswers[ps] = a.tostring
      echo "  Part ",ps,": ",a
      echo "    Time: ",formatTime(t1,t2)
    else: discard

template answer*(p:static typed, suffix:static string, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  when partActive(p) and not defined(skipTests):
    if suffix == dayPathSuffix:
      if dayAnswers[p.tostring] == res.tostring: echo "    Test: PASS"
      else: echo "    Test: FAIL expected ",res.tostring

template answer*(p:static typed, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  answer(p,"",res)

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
