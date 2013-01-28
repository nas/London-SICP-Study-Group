#lang scheme
(require "test.scm")

;FOR TEST SCRIPT :: START
(provide a)
(provide b)
(provide cubert)
(provide max-sum-of-squares)
(provide sqrt)
(provide new-if)
;FOR TEST SCRIPT :: END

; exercise 1.1

10

(+ 5 3 4)

(- 9 1)
 
(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(if (and (> b a) (< b (* a b)))
  b
  a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

 
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

; exercise 1.2
; change this to prefix form
; 5 + 4 + (2-(3-(6 + (4/5)))) / 3 (6-2)(2-7)

(/ 
 (+ 5 4
    (- 2 3
       (+ 6 
          (/ 4 5.0)
       )
    )
 )
 (* 3 
    (- 6 2)
    (- 2 7)
 )
)

; exercise 1.3
; procedure that takes 3 numbers and returns sum of squares of two large numbers

(define (max-sum-of-squares a b c)
  (sum-of-squares 
   (max a b)
   (if (> a b) (max b c)
       (max a c))
  )
)

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (square a)
  (* a a))

; exercise 1.4, describe the behaviour of the following
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; exercise 1.5, describe for applicative order / normal order evaluation
(define (p) (p)) ; inifinite recursion

(define (test1 x y)
  (if (= x 0)
      0
      y)
  )

; exercise 1.6
; with new-if using cond
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  ( / (+ a b) 2))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x) ; don't run this, infinite recursion
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; exercise 1.7
; change good to stop when the difference is very small

(define (sqrt num)
  (define (good-enough? previous-guess guess) ; another way to implement good-enough is in exercise 1.6
    (< (abs (- previous-guess guess)) 0.000001))
  
  (define (improve guess)
    (average guess (/ num guess)))
  
  (define (sqrt-iterator previous-guess guess)
    (if (good-enough? previous-guess guess)
        guess
        (sqrt-iterator guess (improve guess))))
  (sqrt-iterator 2.0 1.0))

; exercise 1.8
; (/ (+ (/ x (square y)) (* 2 y)) 3)

(define (cubert num)
  (define (good-enough? previous-guess guess)
    (< (abs (- previous-guess guess)) 0.000001))
  
  (define (improve guess)
    (/ (+ (/ num (square guess)) (* 2 guess)) 3))
  
  (define (sqrt-iterator previous-guess guess)
    (if (good-enough? previous-guess guess)
        guess
        (sqrt-iterator guess (improve guess))))
  (sqrt-iterator 2.0 1.0))
