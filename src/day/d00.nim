
## https://adventofcode.com/2022/
include ../lib/imps

day 0:

  # path is injected
  let
    input = path.readFile
    one = input[0]
    two = input[2]

  # can declare a part and its answer
  part 1:
    one
  answer 1: 1 # record correct answers to catch regressions
  answer 1, "t1": 0

  part 2:
    two
  answer 2: 2 # the default input is assumed
  answer 2, "t1": 1 # but test files can have answers too

  # can have parts other than 1 or 2
  part 2.1:
    3
  answer 2.1, "t1": 2.1 # if it's wrong, there will be a message, test with: `nim dr 0 t1`

  # can have discussion in code
  part "Comment":
    """d00 is a simple example. `nim dr 0 t1` should show a regression."""

  # asserts are off with -d:danger
  # assert 2 == 3
