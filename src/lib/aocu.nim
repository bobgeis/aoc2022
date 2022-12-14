## This file contains procs and templates useful for this advent of code repo.
## I had a macro that turned parts into a function that could be called, (see https://github.com/bobgeis/aoc2021/blob/master/lib/aocutils.nim), but I liked MichaelMarsalek's approach more (see https://github.com/MichalMarsalek/Advent-of-code/blob/master/2021/Nim/aoc_logic.nim ). It has evolved a bit since then.

import std/[algorithm, monotimes, os, rdstdin, sequtils, strformat, strutils, sugar, tables, times]

import bedrock, shenanigans

type
  AocResults = object
    answers: Table[string,string]
    expected: Table[string,string]
    outcomes: Table[string,bool]
    notes: Table[string,string]
    times: Table[string,float]

const
  inputDir* = "in"
  githash* = staticexec "git rev-parse --short HEAD"
  passSym* = "✅"
  failSym* = "❌"
  quesSym* = "❓"
  inp* = ""
  t1* = "t1"

proc getOutSym(outcomes: Table[string,bool],ps:string):string =
  if ps notin outcomes: quesSym
  elif outcomes[ps]: passSym
  else: failSym

proc formatTime*(t:float):string = &"{t:>9.2f}"
proc getDt*(t1:float):float = (cpuTime()-t1)*1000

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
  let preptime = tims.getOrDefault("prep",0.0).formatTime
  when defined(outputMarkdown):
    &"|d{day:>02}|{tims[ds].formattime}|{preptime}|{tims[$1].formattime}| {outs.getOutSym($1)} |{tims[$2].formattime}| {outs.getOutSym($2)} |"
  else:
    &"d{day:>02}:{tims[ds].formattime}   pr:{preptime}   p1:{tims[$1].formattime} {outs.getOutSym($1)}   p2:{tims[$2].formattime} {outs.getOutSym($2)}"

proc run*(day: int) =
  for path in day.getInputPaths:
    let aocResults = aocDayProcs[day](path)
    when defined(onelineDay):
      echo day.onelineDayStr(aocResults)

proc echoNotes*(aocResults:AocResults) =
  for id,note in aocResults.notes.pairs:
    echo &"\n{id} {note}"

proc echoDayMdTableHeader*() =
  echo "|Day|Total(ms)| Prep(ms)|  Pt1(ms)| ?  |  Pt2(ms)| ?  |"
  echo "|---|--------:|--------:|--------:|:--:|--------:|:--:|"

proc echoPartMdTableHeader*() =
  echo "|  Part  | Time(ms)| ?  |     Answer     |    Expected    |"
  echo "|:------:|--------:|:--:|----------------|----------------|"

template day*(day: static int, body: untyped):untyped =
  block:
    aocDayProcs[day] = proc (path {.inject.}:string):AocResults =
      var
        aocPathSuffix {.inject.} = path.inputPathSuffix
        aocResults {.inject.} = AocResults()
      when not defined(silentParts):
        echo "### Day ",day," for ",path
        when defined(outputMarkdown):
          echoPartMdTableHeader()
      let t1 = cputime()
      body
      let dt = t1.getDt
      aocResults.times["day"] = dt
      when not defined(silentParts):
        when defined(outputMarkdown):
          echo "|  Time  |",dt.formatTime,"|"
        else:
          echo "  Total: ",dt.formatTime,"ms"
        aocResults.echoNotes
        echo "---"
        echo()
      aocResults
  if isMainModule: run day

template prep*(body:untyped):untyped =
  let t1 = cpuTime()
  body
  let dt = t1.getDt
  aocResults.times["prep"] = dt
  when not defined(silentParts):
    when defined(outputMarkdown):
      echo "|  Prep  |",dt.formatTime,"|"
    else: echo "  Prep:  ",dt.formatTime,"ms"

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
    outSym = aocResults.outcomes.getOutSym(ps)
    expected = if outSym == failSym: aocResults.expected.getOrDefault(ps,"") else: ""
  when defined(outputMarkdown):
    result = &"|{ps:^8}|{dt.formattime}|{outSym:^3}|{ans:^16}|{expected:^16}|"
  else:
    result = &"  Pt{ps:>4}:{dt.formattime}ms {outSym} {ans}"
    if outSym == failSym: result &=  &" -> {expected}"

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

template skip*(body:untyped):untyped =
  ## skip a block of code.
  block: discard

template skip*(p:static typed, body:untyped):untyped =
  # skip part of day.
  block: discard

template answers*(anss:static openArray[(string,typed)]):untyped =
  ## Inside of a part block, provide a list of tuples, eg: `{pathSuffixA:expectedAnswerA,pathSuffixB:expectedAnswerB}` and the part's answer will be compared the expected answer if the path suffixes match.
  when not defined(skipTests):
    for ans in anss:
      let (k,v) = ans
      if k == aocPathSuffix:
        aocResults.expected[aocCurrentPartString] = v.tostring

template note*(id: static typed, body:string) =
  ## Notes about the day to echo to output.
  when defined(includeNotes):
    aocResults.notes[id.tostring] = body

template note*(body:string) =
  ## Notes about the day to echo to output.
  when defined(includeNotes):
    note("",body)

proc pause*() =
  discard readLineFromStdin("Continue? ")

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
