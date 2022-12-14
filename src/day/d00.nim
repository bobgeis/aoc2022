
## https://adventofcode.com/2022/
include ../lib/imps

day 0:

  prep: # time the loading and preparation
    # path is injected
    let
      input = path.readFile
      one = input[0]
      two = input[2]

  # can declare a part and its expect
  part 1:
    expectT 0 # record correct answers to catch regressions
    expect 1
    one


  part 2:
    expectT 1 # but test files can have answers too
    expect 2 # the default input is assumed
    two

  part "4a":
    expectT "right" # violated tests will show expected answer
    expect "right"
    part 3: # can be nested
      3 # untested answers will get a question mark
    "wrong"

  # # asserts are off with -d:danger
  # assert 2 == 3

  # can have discussion in code
  discussion """
    d00 is a simple example.
    It's time represents a lower bound for a day."""

