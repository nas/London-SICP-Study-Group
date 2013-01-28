#lang scheme

(require "matchers.scm")
(require "../chapter1_1.scm")

(test-falsiness (= a b))

(test (max-sum-of-squares 2 3 4) 25)
(test (max-sum-of-squares 3 2 4) 25)
(test (max-sum-of-squares 3 4 2) 25)
(test (max-sum-of-squares 2 4 4) 32)
(test (max-sum-of-squares 4 4 2) 32)
(test (max-sum-of-squares 4 2 4) 32)

(test (new-if (= 2 3) 0 5) 5)
(test (new-if (= 2 2) 0 5) 0)

(test-upper-bound (sqrt 2) 1.4)
(test-upper-bound (sqrt 9) 3)
(test-upper-bound (sqrt 25) 5)
(test-upper-bound (sqrt 16) 4)
(test-upper-bound (sqrt 1000000) 1000)
(test-upper-bound (sqrt 0.01) 0.0001)

(test-upper-bound (cubert 125) 5)
(test-upper-bound (cubert 27) 3)
(test-upper-bound (cubert 1000) 10)