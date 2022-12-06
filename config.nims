## View available tasks with `nim help`
## Reference: https://nim-lang.org/docs/nimscript.html

import std/[os, strformat, strutils, sequtils]

const
  nimDayDir = "src/day"
  nimLibDir = "src/lib"
  nimTestDir = "src/test"
  nimDirs = @[nimDayDir,nimLibDir,nimTestDir]
  nimDocDir = "doc"
  nimInDir = "in"
  nimOutDir = "out"
  resultsDir = "results"
  compiledFile = &"{nimOutDir}/run"
  d00File = &"{nimDayDir}/d00.nim"
  libImpsFile = &"{nimLibDir}/imps.nim"
  allDaysFile = &"{nimTestDir}/days.nim"
  libTestFile = &"{nimTestDir}/libs.nim"
  resultsFull = &"{resultsDir}/full.txt"
  resultsFast = &"{resultsDir}/fast.txt"

switch("out", &"{compiledFile}")
--hints: off
--warnings: off

if defined(fast):
  --d:danger
  --d:release # usually this is implied by danger
  --opt: speed
  --passC:"-flto"
  --passL:"-flto"

if defined(check):
  --hints: on
  --warnings: on

proc excho(cmd:string) =
  echo cmd
  exec cmd

proc findNimFile(f:string):string =
  if f.fileExists: return f
  # if it's a day number, find it
  if fileExists(&"{nimDayDir}/d{f}.nim"): return &"{nimDayDir}/d{f}.nim"
  if fileExists(&"{nimDayDir}/d0{f}.nim"): return &"{nimDayDir}/d0{f}.nim"
  if f == "day" or f == "days" or f == "all": # run all days
    return allDaysFile
  if f == "lib" or f == "libs": # run lib tests
    return libTestFile
  if f == "l" or f == "last" or f == "high": # get the highest day number
    var last = d00File
    var lastInt = last[9..10].parseInt
    for k in walkDir(nimDayDir):
      let nextInt = k.path[9..10].parseInt
      if nextInt > lastInt:
        last = k.path
        lastInt = nextInt
    return last
  for dir in nimDirs: # check in every dir containing code
    if fileExists(&"{dir}/{f}.nim"): return &"{dir}/{f}.nim"
  echo &"Could not find a .nim file matching `{f}`."
  return ""

proc parseArgs():(seq[string],seq[string]) =
  for i in 2..paramCount():
    if paramStr(i)[0] == '-':
      result[0].add paramstr(i)
    else:
      result[1].add paramstr(i)

proc compile(path,switchStr:string) =
  if path.len > 0: excho &"nim c {switchStr} {path}"

proc initialFile(day:int):string =
  &"""
## https://adventofcode.com/2022/day/{day}
include ../lib/imps

day {day}:
  let input = path.readFile
"""

proc createNewDay(day:int) =
    echo &"Creating initial files for day {day}."
    let newNimFile = &"./{nimDayDir}/d{day:02}.nim"
    if not newNimFile.fileExists:
      exec &"echo '{day.initialFile}' > ./{nimDayDir}/d{day:02}.nim"
    excho &"code {newNimFile}"
    excho &"code './{nimInDir}/i{day:02}.txt'"
    excho &"code './{nimInDir}/i{day:02}t1.txt'"
    excho &"firefox --new-tab=https://adventofcode.com/2022/day/{day}"
    excho &"firefox --new-tab=https://adventofcode.com/2022/day/{day}/input"

task clean, "Empty the out and doc dirs.":
  excho &"rm -rf {nimOutDir}"
  excho &"rm -rf {nimDocDir}"

task viewdoc, "Open the library docs in firefox.":
  excho &"firefox --new-tab=file://{getCurrentDir()}/doc/theindex.html"

task gendoc, "Make docs for library files.":
  excho &"rm -rf {nimDocDir}"
  excho &"nim doc --project --out:{nimDocDir} {libImpsFile}"

task di, "Code files for a new day. eg: `nim di 1`.":
  for i in 2..paramCount():
    let day = paramStr(i).parseInt
    day.createNewDay

task dit, "Create new test files. eg: `nim dit 1 t2 t3`.":
  var day = 0;
  for i in 2..paramCount():
    if i == 2: day = paramStr(i).parseInt
    else:
      excho &"code './{nimInDir}/i{day:02}{paramStr(i)}.txt'"

task dr, "Run a day. eg: `nim dr 1` to run day 1 on default input only, `nim dr 1 i t1` to run day 1 on default input and test file 1":
  let
    (switches,args) = parseArgs()
    path = args[0].findNimFile
    argsStr = args[1..args.high].join(" ")
    switchStr = switches.join(" ")
  if path.len > 0: excho &"nim r {switchStr} -d:debug {path} {argsStr}"

task drm, "Run multiple days. eg: `nim drm 1 2 libs`":
  let
    (switches,args) = parseArgs()
    paths = args.mapit(it.findNimFile)
    switchStr = switches.join(" ")
  for path in paths:
    excho &"nim r {switchStr} -d:debug {path}"

task drl, "dr but run the last day":
  let
    (switches,args) = parseArgs()
    path = "last".findNimFile
    argsStr = args[0..args.high].join(" ")
    switchStr = switches.join(" ")
  if path.len > 0: excho &"nim r {switchStr} -d:debug {path} {argsStr}"

task drf, "dr but with better performance. Same usage as `dr`.":
  let
    (switches,args) = parseArgs()
    path = args[0].findNimFile
    argsStr = args[1..args.high].join(" ")
    switchStr = switches.join(" ")
  if path.len > 0: excho &"nim r {switchStr} -d:fast {path} {argsStr}"

task dt, "Compile(opt:speed) and time a day. Same usage as `dr`.":
  let
    (switches,args) = parseArgs()
    path = args[0].findNimFile
    argStr = args[1..args.high].join(" ")
    switchStr = switches.join(" ")
  path.compile(&"{switchStr} -d:fast")
  excho &"time {compiledFile} {argStr}"

task dts, "dt but skip extra parts. Same usage as `dr`.":
  let
    (switches,args) = parseArgs()
    path = args[0].findNimFile
    argStr = args[1..args.high].join(" ")
    switchStr = switches.join(" ")
  path.compile(&"{switchStr} -d:fast -d:skipExtraParts -d:skipRegChecks")
  excho &"time {compiledFile} {argStr}"

task de, "Execute the last compiled day. Args will be passed to the program.":
  let
    (switches,args) = parseArgs()
    argStr = args[0..args.high].join(" ")
  if compiledFile.fileExists: excho &"time {compiledFile} {argStr}"
  else:
    echo &"No compiled file: {compiledFile}"

task drw, "Run days.nim and write to a file. This will include all parts and comments.":
  excho &"nim r {allDaysFile} full > {resultsFull}"
  excho &"cat {resultsFull}"

task dtw, "Compile days.nim for speed, without extra parts, and then execute a few times, writing the last run to file":
  var runs = 5
  for i in 2..paramCount():
    runs = paramStr(i).parseInt
  allDaysFile.compile("-d:fast -d:skipExtraParts -d:skipRegChecks")
  for i in 1..runs:
    excho &"{compiledFile} > {resultsFast}"
  excho &"cat {resultsFast}"
