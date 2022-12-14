## imps: the little demons on your shoulder telling you to write macros
## This module imports and then exports frequently used modules.
## Use with include, eg: `include lib/imps`

# std lib modules: https://nim-lang.org/docs/lib.html
import std/[algorithm, deques, intsets, math, memfiles, options,
  os, packedsets, parsecsv, parseutils, re, sequtils, sets,
  strformat, strscans, strtabs, strutils, sugar,
  tables, times, unittest]

# nimble pkgs: https://nimble.directory/
import pkg/[itertools, memo, stint]

# local utils: src/lib
import aocu, bedrock, graphwalk, shenanigans, tibia, vecna

