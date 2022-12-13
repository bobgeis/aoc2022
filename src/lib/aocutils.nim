## This file contains procs and templates useful for this advent of code repo.
## I had a macro that turned parts into a function that could be called, (see https://github.com/bobgeis/aoc2021/blob/master/lib/aocutils.nim), but I liked MichaelMarsalek's approach more (see https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/aoc_logic.nim )

import std/[algorithm, monotimes, os, sequtils, strformat, strutils, sugar, tables, times]

import bedrock, shenanigans

type
  AocResults = object
    answers: Table[string,string]
    expected: Table[string,string]
    outcomes: Table[string,bool]
    times: Table[string,string]

const
  inputDir* = "in"
  githash* = staticexec "git rev-parse --short HEAD"
  passStr* = "✅"
  failStr* = "❌"
  quesStr* = "❓"

proc getOutSym(outcomes: Table[string,bool],ps:string):string =
  if ps notin outcomes: quesStr
  elif outcomes[ps]: passStr
  else: failStr

proc formatTime(t:float):string =  &"{t:>5.2f}ms"
proc getDt*(t1:float):string = formatTime((cpuTime()-t1)*1000)

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

var aocDayProcs: Table[int, proc (x:string):AocResults]

proc onelineDayStr(day:int, aocResults:AocResults):string =
  const
    ds = "day"
    prep = "prep"
  {answers: ans, times: tims, outcomes:outs} ..= aocResults
  let preptime = tims.getOrDefault("prep",0.0.formatTime)
  # var extraTime = 0.0
  # for key in tims.keys:
  #   if key notin ["day","prep","1","2"]: extraTime += tims[key][0..^2].parsefloat
  &"Day {day:>2}: prep: {preptime}  pt 1: {outs.getOutSym($1)} {tims[$1]}  pt 2: {outs.getOutSym($2)} {tims[$2]}  total: {tims[ds]}"

proc run*(day: int) =
  for path in day.getInputPaths:
    let aocResults = aocDayProcs[day](path)
    when defined(onelineDay):
      echo day.onelineDayStr(aocResults)

template day*(day: static int, body: untyped):untyped =
  block:
    aocDayProcs[day] = proc (path {.inject.}:string):AocResults =
      var
        aocPathSuffix {.inject.} = path.inputPathSuffix
        aocResults {.inject.} = AocResults()
      when not defined(silentParts):
        echo "Day ",day," for ",path
      let t1 = cputime()
      body
      let dt = t1.getDt
      aocResults.times["day"] = dt
      when not defined(silentParts):
        echo "Time: ",dt
        echon()
      aocResults
  if isMainModule: run day

template prep*(body:untyped):untyped =
  let t1 = cpuTime()
  body
  let dt = t1.getDt
  aocResults.times["prep"] = dt
  when not defined(silentParts):
    echo "  Prep: ",dt

proc partActive(p:static typed):bool =
  (p.toString == "1" or
    p.toString == "2" or
    not defined(skipExtraParts)) and
  not ((defined(skipPart1) and p.toString[0] == '1') or
    (defined(skipPart2) and p.toString[0] == '2'))

proc partResultStr*(ps: static string,aocResults:AocResults): string =
  let
    dt = aocResults.times[ps]
    ans = aocResults.answers[ps]
  result = &"  Pt {ps}: {dt} {ans} "
  if ps in aocResults.outcomes:
    let
      outcome = if aocResults.outcomes[ps]: passStr
        else: &"{failStr} -> {aocResults.expected[ps]}"
    result &= outcome
  else: result &= quesStr

template part*(p:static typed, body:untyped):untyped =
  block:
    when partActive(p):
      const
        ps = p.tostring
        aocCurrentPartString {.inject.} = ps
      let
        t1 = cputime()
        a = body
        dt = t1.getDt
        ans = a.tostring
      aocResults.answers[ps] = ans
      aocResults.times[ps] = dt
      if ps in aocResults.expected:
        let outcome = ans == aocResults.expected[ps]
        aocResults.outcomes[ps] = outcome
      when not defined(silentParts):
        echo ps.partResultStr(aocResults)
    else: discard

template answer*(suffix:static string, res:typed):untyped =
  ## Provide an input suffix, and an expected result. The expected result will be compared with the actual result at run-time.
  when not defined(skipTests):
    if suffix == aocPathSuffix:
      aocResults.expected[aocCurrentPartString] = res.tostring

template answer*(res:typed):untyped = answer "", res ## Like 2 arg answer but default input
template answerT*(res:typed):untyped = answer "t1",res ## Like 2 arg answer but test input
template answerT2*(res:typed):untyped = answer "t2",res ## Like 2 arg answer but second test input
template answerO*(res:typed):untyped = answer "o1",res ## Like 2 arg answer but others' input

proc discussion*(body:string) =
  ## Notes or discussion about the day to echo to output.
  when defined(includeDiscussion):
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
