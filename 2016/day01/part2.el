(let ((instructions (mapcar (lambda (s)
			      (cons (aref s 0)
				    (string-to-number (substring s 1))))
			    (split-string "R8, R4, R4, R8")))
      (direction 0)
      (x 0)
      (y 0)
      (last-x 0)
      (last-y 0)
      (seen nil)
      (final-x nil)
      (final-y nil))
  (or (catch 'twice
	(dolist (instruction instructions)
	  (destructuring-bind (turn . steps) instruction
	    (setq direction (mod (funcall (if (= turn ?R) '1+ '1-) direction) 4))
	    (case direction
	      (0 (setq y (+ y steps)))
	      (1 (setq x (+ x steps)))
	      (2 (setq y (- y steps)))
	      (3 (setq x (- x steps)))))
	  (dolist (line (cdr seen))	; skip the last element
	    (destructuring-bind ((x1 . y1) (x2 . y2)) line
	      (when (or (and (= x last-x) ; last move was vertical 
			     (= y1 y2)	  ; looking at a horizontal
			     (>= x x1)  (<= x x2)
			     (or (and (<= y y1)  (>= last-y y1))
				 (and (>= y y1)  (<= last-y y1)))
			     (setq final-x x
				   final-y y1))
			(and (= y last-y) ; last move was horizontal
			     (= x1 x2)	  ; looking at a vertical
			     (>= y y1)  (<= y y2)
			     (or (and (<= x x1)  (>= last-x x1))
				 (and (>= x x1)  (<= last-x x1)))
			     (setq final-x x1
				   final-y y)))
		;; (error "Moving from %S to %S crosses the line from %S to %S in %S"
		;; 	   (cons last-x last-y) (cons x y)
		;; 	   (cons x1 y1) (cons x2 y2)
		;; 	   seen)
		(throw 'twice (+ (abs final-x) (abs final-y))))))
	  (push (list (cons last-x last-y) (cons x y)) seen)
	  (setq last-x x
		last-y y)))
      (+ (abs x) (abs y))))
