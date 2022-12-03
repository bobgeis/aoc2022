## https://adventofcode.com/2022/day/3
include ../lib/imps

import std/[intsets,packedsets]

day 3:

  func priority(a:char):int =
    let o = a.ord
    if o >= 'a'.ord:
      o - 'a'.ord + 1
    else:
      o - 'A'.ord + 27
  assert ['a','p','z','A','L','Z'].map(priority) == @[1, 16, 26, 27, 38, 52]

  let
    input = path.readFile.splitlines
    ints = input.mapit(it.toSeqChar.map(priority))

  part 1:
    var sum = 0
    for line in ints:
      let
        half = line.len div 2
        set1 = line[0..<half].toIntSet
        set2 = line[half..line.high].toIntSet
      sum += (set1 * set2).peek
    sum
  answer 1: 7691
  answer 1, "t1": 157

  part 2:
    var sum2 = 0
    for i in countup(0,ints.high,3):
      let
        one = ints[i].toIntSet
        two = ints[i+1].toIntSet
        three = ints[i+2].toIntSet
      sum2 += (one * two * three).peek
    sum2
  answer 2: 2508
  answer 2, "t1": 70
