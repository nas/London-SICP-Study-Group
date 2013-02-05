#lang scheme

(provide square)
(provide average)
(provide double)
(provide half)

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