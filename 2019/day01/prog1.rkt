#lang racket
(define in (open-input-file "data"))
(apply + (map (lambda (n) (- (exact-floor (/ n 3)) 2))
              (sequence->list (in-port read in))))
