## https://adventofcode.com/2022/day/3
include ../lib/imps

day 3:

  prep:
    func priority(a:char):int8 =
      let o = a.ord.int8
      if o >= 'a'.ord:
        o - 'a'.ord.int8 + 1
      else:
        o - 'A'.ord.int8 + 27
    assert ['a','p','z','A','L','Z'].map(priority) == @[1'i8, 16, 26, 27, 38, 52]

    let
      input = path.readFile.splitlines
      ints = input.mapit(it.toSeqChar.map(priority))

  part 1:
    answers {inp:7691, t1:157}
    var sum = 0
    for line in ints:
      let
        half = line.len div 2
        set1 = line[0..<half].tobitset
        set2 = line[half..line.high].tobitset
      sum += (set1 * set2).peek
    sum

  part 2:
    answers {inp:2508, t1:70}
    var sum2 = 0
    for i in countup(0,ints.high,3):
      let
        one = ints[i].tobitset
        two = ints[i+1].tobitset
        three = ints[i+2].tobitset
      sum2 += (one * two * three).peek
    sum2
