#lang scheme
; implement few test methods, and evolve them as I move forward

(provide test-falsiness)
(provide test-truthiness)
(provide test)
(provide test-upper-bound)

(define (test-falsiness evaluation)
  (if evaluation false true)
)

(define (test-truthiness evaluation)
  (if evaluation true false)
)
  
(define (test actual-call expectation)
  (= actual-call expectation)
)

(define (test-upper-bound actual-call expectation)
  (if (test actual-call expectation)
      true
      (and (> actual-call expectation) (< actual-call (+ expectation 1) ))
      )
)