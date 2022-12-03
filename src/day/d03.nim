## https://adventofcode.com/2022/day/3
include ../lib/imps

day 3:

  func priority(a:char):int =
    let o = a.ord
    if o >= 'a'.ord:
      o - 'a'.ord + 1
    else:
      o - 'A'.ord + 27
  decho ['a','p','z','A','L','Z'].map(priority)

  let
    input = path.readFile.splitlines
    ints = input.mapit(it.toSeqChar.map(priority))

  var sum = 0
  for line in ints:
    let
      half = line.len div 2
      set1 = line[0..<half].toHashSet
      set2 = line[half..line.high].toHashSet
    sum += (set1 * set2).peek

  part 1: sum
  answer 1: 7691
  answer 1, "t1": 157

