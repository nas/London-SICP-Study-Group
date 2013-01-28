#lang scheme

(provide square)
(provide average)

(define (square x)
  (* x x))

(define (average x y )
  (/ (+ x y) 2))