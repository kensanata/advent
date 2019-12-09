(define original (map string->number (map string-trim (string-split (file->string "data") ","))))

(define program original)

(define (step i)
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
    [(99) (list-ref program 0)]))

(let brute-force ([noun 0] [verb 0])
  (set! program original)
  (set! program (list-set program 1 noun))
  (set! program (list-set program 2 verb))
  (if (= 3500 (step 0))
      (+ (* 100 noun) verb)
      (when (or (< noun 11) (< verb 11))
	(if (< noun 11)
	    (brute-force (+ noun 1) verb)
	    (brute-force 0 (+ verb 1))))))
