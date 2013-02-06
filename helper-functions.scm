#lang scheme

(provide square)
(provide average)
(provide double)
(provide half)
(provide inc)
(provide divides?)

(define (square x)
  (* x x))

(define (average x y )
  (/ (+ x y) 2))

(define (double x)
  ( + x x)
 )

(define (half x)
  (/ x 2)
)

(define (inc a)
  (+ a 1)
)

(define (divides? denominator numerator)
  (= (remainder numerator denominator) 0)
)