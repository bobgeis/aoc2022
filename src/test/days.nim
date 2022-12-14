
include ../lib/imps

const
  days = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
  ] ## numbers of completed days
  dayModules = days.mapit( &"d{it:02}" )

importModules(dayModules,"../day/")

proc allDays*() =
  echo()
  echo &"## All Days at #{githash}"
  when defined(danger):
    echo "- optimized release"
  when defined(debug):
    echo "- running debug code"
  when defined(skipExtraParts):
    echo "- skipping extra parts"
  when defined(includeNotes):
    echo "- including notes"
  echo ""
  when defined(outputMarkdown) and defined(onelineDay):
    echoDayMdTableHeader()
  let start = cpuTime()
  for i in days:
    run i
  let dt = start.getDt
  when defined(outputMarkdown) and defined(onelineDay):
    echo &"|Tot|{dt.formattime}|"
  else:
    echo &"Total Time: {dt.formattime}"
  echo()

when isMainModule:
  allDays()