
## https://adventofcode.com/2022/
include ../lib/imps

day 0:

  prep: # time the loading and preparation
    # path is injected
    let
      input = path.readFile
      one = input[0]
      two = input[2]

  # can declare a part and its answer
  part 1:
    answerT 0 # record correct answers to catch regressions
    answer 1
    one


  part 2:
    answerT 1 # but test files can have answers too
    answer 2 # the default input is assumed
    two

  # can have parts other than 1 or 2
  part 4:
    answerT "right" # if it's wrong, there will be a message
    answer "right"
    part 3:
      3
    "wrong"

  # # asserts are off with -d:danger
  # assert 2 == 3

  # can have discussion in code
  discussion """
    d00 is a simple example.
    It's time represents a lower bound for a day."""

