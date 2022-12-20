
# Advent of Code 2022

[This repo](https://github.com/bobgeis/aoc2022) contains solutions to [Advent of Code 2022](https://adventofcode.com/2022) written in [nim](https://nim-lang.org/).

## Links

- [Advent of Code 2022](https://adventofcode.com/2022)
- [Awesome Advent of Code](https://github.com/Bogdanp/awesome-advent-of-code#nim)
- [aoc subreddit](https://old.reddit.com/r/adventofcode/)
- [Advent of Nim](https://forum.nim-lang.org/t/9678)

## Nim References

- [nim lang](https://nim-lang.org/)
- [nim forum](https://forum.nim-lang.org/)
- [nim compiler](https://nim-lang.org/docs/nimc.html)
- [nim manual](https://nim-lang.org/docs/manual.html)
- [nim std lib](https://nim-lang.org/docs/lib.html)
- [nimscript](https://nim-lang.org/docs/nimscript.html)
- [nimble](https://nimble.directory/)
- [itertools](https://github.com/narimiran/itertools)
- [memo](https://github.com/andreaferretti/memo)
- [stint](https://github.com/status-im/nim-stint)
- [stew](https://github.com/status-im/nim-stew)

## [repo](https://github.com/bobgeis/aoc2022)

I'm using vscode with [nim](https://marketplace.visualstudio.com/items?itemName=kosz78.nim) and [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) extensions. Plus other not nim-specific ones.

For nimble packages, the `stint` package is vital for dealing with very large ints. `memo` and `itertools` are sometimes very helpful and convenient.

I have a `lib` dir of helper code assembled from previous years. `aocu` has utils for working in the repo. `bedrock` has misc utilities. `graphwalk` is for graph traversal algorithms. `imps` is a file to include to import a lot of common libraries into a file. `shenanigans` is for experimenting with macros.`tibia` and `vecna` are for working with 2D & 3D points/vectors (which happens a _lot_ in advent of code); `vecna` is for the vectors themselves and `tibia` is for using them as keys in datastructures.

There are scripts in the `config.nims` file that exist to streamline common tasks. For example `nim di 1` to init a new day, and `nim dr last` to run the highest day. Use `nim help` to list the tasks.

---

## Spoilers below

___

