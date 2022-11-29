
include ../lib/imps

const
  days = [
    0
  ]
  dayModules = days.mapit( &"d{it:02}" )

importModules(dayModules,"../day/")

proc allDays*() =
  echo &"==== All Days at #{githash} ====\n"
  let start = cpuTime()
  for i in days:
    run i
  let finish = cpuTime()
  echo &"==== Total Time: {finish-start:.2} s ===="

when isMainModule:
  allDays()