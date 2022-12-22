
## https://adventofcode.com/2022/
include ../lib/imps

day 0:
  prep: # time the loading and preparation
    let
      input = path.readFile # path is injected
      one = input[0]
      two = input[2]


  part 1: # can declare a part and its expected answers
    answers {inp:1, t1:0} # record correct answers to catch regressions
    one

  part 2:
    answers {inp:2, t1:1}
    two

  part 4.1:
    answers {inp:"right", t1:"right"} # violated tests will show expected answer
    part 3: # can be nested, but will mess up timings
      3 # untested answers will get a question mark
    "wrong"

  skip 2.1:
    for i in int.low..int.high:
      echo "This code is skipped."

  # # asserts are off with -d:danger
  # assert 2 == 3

  # can have note in code
  note """
d00 is a trivial example. It's time represents a noisy lower bound for a day.
"""

