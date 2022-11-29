
include ../lib/imps

proc libTests* =
  echo &"==== lib Tests at #{githash} ====\n"
  let start = cpuTime()
  aocutils.tests()
  bedrock.tests()
  shenanigans.tests()
  tibia.tests()
  vecna.tests()
  let finish = cpuTime()
  echo &"\n==== Total Time: {finish-start:.2} s ===="

when isMainModule:
  libTests()
