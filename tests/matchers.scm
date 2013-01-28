#lang scheme
; implement few test methods, and evolve them as I move forward

(provide test-falsiness)
(provide test-truthiness)
(provide test)
(provide test-upper-bound)

(define (test-falsiness evaluation)
  (if evaluation 
     (error "Test Failed: expected False received True")
     true)
)

(define (test-truthiness evaluation)
  (if evaluation
      true
     (error "Test Failed: expected True received False"))
)
  
(define (test actual-call expectation)
  (if (= actual-call expectation)
  true
  (error "Test Failed: expectation mismatch"))
)

(define (test-upper-bound actual-call expectation)
  (cond ((= actual-call expectation) true)
        ((and (> actual-call expectation) (< actual-call (+ expectation 1) )) true)
        (else (error "Test Failed: Upper bound exceeded"))
        )
)