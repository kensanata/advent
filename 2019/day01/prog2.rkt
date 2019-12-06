#lang racket
(define in (open-input-file "data"))
(define (fuel mass)
  (- (exact-floor (/ mass 3)) 2))
(define (total-fuel total mass)
  (if (<= mass 0)
      total
      (total-fuel (+ total mass) (fuel mass))))
(define (sum-fuel mass)
  (total-fuel 0 (fuel mass)))

(apply + (map sum-fuel (sequence->list (in-port read in))))
