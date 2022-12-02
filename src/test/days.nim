
include ../lib/imps

const
  days = [
    0,
    1,
    2,
  ] ## numbers of completed days
  dayModules = days.mapit( &"d{it:02}" )

importModules(dayModules,"../day/")

proc allDays*() =
  echo &"==== All Days at #{githash} ===="
  when defined(danger):
    echo "-- optimized release"
  else:
    echo "-- debug release"
  when defined(skipExtraParts):
    echo "-- skipping extra parts"
  echo ""
  let start = cpuTime()
  for i in days:
    run i
  let finish = cpuTime()
  echo &"==== Total Time: {finish-start:.2} s ===="

when isMainModule:
  allDays()