#lang scheme


(provide factorial-recursive)
(provide factorial-iterative)
(provide Ackermann)
(provide fib-recursive)
(provide fib-iterative)

; example
(define (factorial-recursive n)
  (if (= n 1)
      1
      (* n (factorial-recursive (- n 1))))
)

; example
(define (factorial-iterative n)
  (define (iteration product counter)
    (if (> counter n)
        product
        (iteration (* product counter)
                   (+ counter 1)
                   )
        )
    )
  (iteration 1 1)
  )

; exercise 1.9
; Ans:
; Time Complexity = O(x)
; Space Complexity = O(1)
; Hence linear iteration with (+ (dec a) (inc b))

; Time Complexity = O(x)
; Space Complexity = O(x)
; Hence linear recursion with (inc (+ (dec a) b) => also has to maintain the state with each call

; exercise 1.10, Ackermann's function
(define (Ackermann x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Ackermann (- x 1)
                 (Ackermann x (- y 1)))
              ))
  )

; example recursive fibonacci
(define (fib-recursive n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recursive (- n 1))
                 (fib-recursive (- n 2))
                 )
              )
        )
  )

; example iterative fibonacci
(define (fib-iterative n)
  (define (iter num1 num2 count)
    (cond ((= count 0) num2)
          (else
           (iter (+ num1 num2) num1 (- count 1)))
    ))
  (iter 1 0 n)
)
                                