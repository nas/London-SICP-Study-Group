#lang scheme

(require "helper-functions.scm")
(provide factorial-recursive)
(provide factorial-iterative)
(provide Ackermann)
(provide fib-recursive)
(provide fib-iterative)
(provide count-change)
(provide f-recursive)
(provide f-iterative)
(provide pascal-triangle-element)
(provide expt-recur)
(provide expt-iter)
(provide fast-expt)
(provide fast-expt-iter)
(provide multiply)
(provide fast-multiply)
(provide rpm-multiply)
(provide fib-119)
(provide gcd)
(provide prime?)

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

; example exponentiation(recursive)
(define (expt-recur b n)
  (if (= n 0)
      1
      (* b (expt n (- n 1)))
  )
 )

; example exponentiation (iterative)
(define (expt-iter b n)
  (define (iter counter product)
    (if (= counter 0)
        product
        (iter (- counter 1)
              (* b product))))
(iter n 1)
  )

; example fast-exponentiation using squares
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1)))
              )))


; exercise 1.16 fast-exponentiation using squares and iterative algo.
(define (fast-expt-iter base exp)
  (define (iter new-base counter a)
    (cond ((= counter 0) a)
          ((even? counter) (iter (square new-base) (/ counter 2) a))
          (else (iter new-base (- counter 1) (* a new-base))))
  )
  (iter base exp 1)
)

; exercise 1.17
(define (multiply a b)
  (if (= b 0)
      0
      (+ a (multiply a (- b 1) )))
)
; change the above procedure, to include, together with addition, operations double, which doubles an
; integer, and halve, which dvides an even integer by 2. (hence achieve logarithmic # of steps)
(define (fast-multiply a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-multiply a (half b))))
        (else (+ a (fast-multiply a (- b 1) )))
        )
  )
      
   
; exercise 1.18
; Using the results of exercises 1.16 & 1.17 , devise a procedure that generates an iterative process
; for multiplying two integers in terms of adding, doubling and halving & uses a logarithmic number of steps
; Russian peasant method of multiplication
(define (rpm-multiply a b)
  (define (values new-a new-b existing-value)
    (cond ((even? (floor new-a)) existing-value)
          (else (+ new-b existing-value)))
   )
  
  (define (iter new-a new-b value)
    (cond ((= new-b 0) 0)
          ((= (floor new-a) 0) value)
          (else (iter (half new-a) (double new-b) (values new-a new-b value)))
    )
  )
  
  (iter a b 0)
)

; exercise 1.19
; a1 = (bq + aq + ap)
; b1 = (bp + aq)
; a2 = (b1q + a1q + a1p)
; b2 = (b1p + a1q)
; simplify using substitution -> 
; a2 = ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p)
; b2 = ((bp + aq)p + (bq + aq + ap)q)
;    = (bpp + aqp) + (bqq + aqq + apq)
;    = (b(pp + qq) + (a(qp + pq + qq)
;    = b(pp + qq) + a(2pq + qq)
; hence p' = pp + qq && q' = 2pq + qq -> (b2 = bp' + aq')
; apply with a2 as well

(define (fib-119 n)
  (fib-iter-119 1 0 0 1 n)
  )

(define (fib-iter-119 a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter-119 a
                   b
                   (+ (square p) (square q)); this is the question,(compute p')
                   (+ (* 2 p q) (square q)); and this (compute q')
                   (/ count 2)))
        (else (fib-iter-119 (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1))))
  )

; example -> Euclid's Algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; example -> finding prime number
(define (smallest-divisor n)
  (find-divisor n 2)
)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (inc test-divisor))))
)

(define (prime? n)
  (= n (smallest-divisor n))
)
