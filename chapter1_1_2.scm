#lang scheme


(provide factorial-recursive)
(provide factorial-iterative)

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
