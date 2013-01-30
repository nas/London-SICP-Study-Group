#lang scheme


(provide factorial-recursive)
(provide factorial-iterative)
(provide Ackermann)
(provide fib-recursive)
(provide fib-iterative)
(provide count-change)
(provide f-recursive)
(provide f-iterative)
(provide pascal-triangle-element)

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
                                
; example Counting change

(define (count-change amount)
  (cc amount 5))

(define (cc amount kind-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else (+ (cc amount (- kind-of-coins 1))
                 (cc (- amount (first-denomination kind-of-coins))
                     kind-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
        ))


; exercise 1.11 
; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
(define (f-recursive n) ; this function is not part of the solution
  (if (< n 3)
      n
      (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))
      )
)

(define (f-iterative n) 
  (define (iteration a b c count)
    (if (< count 3)
        a
        (iteration (+ a (* 2 b) (* 3 c)) a b (- count 1))
         )
   )
  (if (< n 3)
      n
      (iteration 2 1 0 n)
      )
  )

; exercise 1.12 Pascal's triangle, give column and row number to return the value
; recursive process
(define (pascal-triangle-element column row)
  (if (or (= row 1) (= column 1) (= row column))
      1
      (+ (pascal-triangle-element (- column 1) (- row 1)) (pascal-triangle-element column (- row 1)))
  )
)