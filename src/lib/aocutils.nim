## This file contains procs and templates useful for this advent of code repo.
## I had a macro that turned parts into a function that could be called, (see https://github.com/bobgeis/aoc2021/blob/master/lib/aocutils.nim), but I liked MichaelMarsalek's approach more (see https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/aoc_logic.nim )

import std/[algorithm, monotimes, os, sequtils, strformat, strutils, tables, times]

import bedrock

const
  inputDir* = "in"
  githash* = staticexec "git rev-parse --short HEAD"

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
    ## Runs given day solution on the corresponding input.
    let paths = day.getInputPaths
    for path in paths:
      let
        start = cpuTime()
        results = solutionProcs[day](path)
        finish = cpuTime()
      when not defined(skipRegChecks):
        let checks = results.checkResults(day,path)
      var titleStr = &"Day {$day}"
      when isMain:
        titleStr &= &" at #{githash}"
      if paths.len > 1 or path.inputPathSuffix != "":
        titleStr &= &" for {path}"
      echo titleStr
      for k in results.keys.toSeq.sorted:
          echo &"  Part {k}: {results[k]}"
          when not defined(skipRegChecks):
            if checks.contains(k):
              echo &"    {checks[k]}"
      echo &"  Time: {finish-start:.2} s\n"

template day*(day:int, solution:untyped):untyped =
  ## Defines a solution function. If isMainModule, also runs it.
  block:
    solutionProcs[day] = proc (path {.inject.}: string):Table[string,string] =
      var parts {.inject.}: OrderedTable[string, proc ():string]
      var partResults {.inject.} = initTable[string,Table[string,string]]()
      solution
      for k,v in parts:
        result[k] = $v()
      solutionResults[day] = partResults

  if isMainModule:
    run day, isMain=true

template part*(p:static typed, t:type, solution:untyped):untyped =
  ## Defines a part solution function. Eg `part 1: input[0] * 5` The part name can be an int, float, or string. Eg `part "1comment": "This was easier than I thought!"`
  when p.toString == "1" or
      p.toString == "2" or
      not defined(skipExtraParts):
      parts[p.toString] = proc ():string =
        proc inner():t =
            solution
        return $inner()

template part*(p:static typed, solution:untyped):untyped =
  ## Defines a part solution function. Eg `part 1: input[0] * 5` The part name can be an int, float, or string. Eg `part "1comment": "This was easier than I thought!"`
  when p.toString == "1" or
      p.toString == "2" or
      not defined(skipExtraParts):
      parts[p.toString] = proc ():string =
        proc inner():auto =
            solution
        return $inner()

template answer*(p:static typed, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  when p.toString == "1" or
      p.toString == "2" or
      not defined(skipExtraParts):
    if not partResults.contains(""):
      partResults[""] = initTable[string,string]()
    partResults[""][p.toString] = res.toString

template answer*(p:static typed, suffix:string, res:typed):untyped =
  ## Provide a part name, and optional input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  when p.toString == "1" or
      p.toString == "2" or
      not defined(skipExtraParts):
    if not partResults.contains(suffix):
      partResults[suffix] = initTable[string,string]()
    partResults[suffix][p.toString] = res.toString

##

proc tests* =
  block:
    let i00t1 = "in/i00t1.txt"
    assert 0.inputPath("t1") == i00t1
    assert i00t1.inputPathDay == "00"
    assert i00t1.inputPathSuffix == "t1"
  echo "√ aocutils passed"

when isMainModule:
  tests()
