#lang scheme

(require "matchers.scm")
(require "../chapter1_1_2.scm")

(test (factorial-recursive 1) 1)
(test (factorial-recursive 2) 2)
(test (factorial-recursive 3) 6)
(test (factorial-recursive 4) 24)
(test (factorial-recursive 5) 120)

(test (factorial-iterative 1) 1)
(test (factorial-iterative 2) 2)
(test (factorial-iterative 3) 6)
(test (factorial-iterative 4) 24)
(test (factorial-iterative 5) 120)

