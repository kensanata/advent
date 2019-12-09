#lang racket
(let ([program (map string->number (map string-trim (string-split (file->string "data") ",")))])
  (let step ([i 0])
    (case (list-ref program i)
      [(1) (let* ([a (list-ref program (list-ref program (+ i 1)))]
		  [b (list-ref program (list-ref program (+ i 2)))]
		  [c (list-ref program (+ i 3))]
		  [n (+ a b)])
	     (set! program (list-set program c n))
	     (step (+ i 4)))]
      [(2) (let* ([a (list-ref program (list-ref program (+ i 1)))]
		  [b (list-ref program (list-ref program (+ i 2)))]
		  [c (list-ref program (+ i 3))]
		  [n (* a b)])
	     (set! program (list-set program c n))
	     (step (+ i 4)))]
      [(99) (list-ref program 0)])))
