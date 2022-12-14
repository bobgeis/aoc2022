
## https://adventofcode.com/2022/
include ../lib/imps

day 0:
  prep: # time the loading and preparation
    let
      input = path.readFile # path is injected
      one = input[0]
      two = input[2]


  part 1: # can declare a part and its expected answers
    expectT 0 # record correct answers to catch regressions
    expect 1
    one


  part 2:
    expect 2 # the default input is assumed
    expectT 1 # but test files can have answers too
    two

  part "4a":
    expectT "right" # violated tests will show expected answer
    expect "right"
    part 3: # can be nested, but will mess up timings
      3 # untested answers will get a question mark
    "wrong"

  # # asserts are off with -d:danger
  # assert 2 == 3

  # can have discussion in code
  discussion """
    d00 is a trival example. It's time represents a noisy lower bound
    for a day."""

