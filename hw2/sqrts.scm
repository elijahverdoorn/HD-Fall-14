;;; print square roots in Scheme language.  R. Brown, 9/2010

(define print-sqrts
  (lambda (n) ; print square roots from n to 5
    (if (>  n 5) 'done
	(begin 
	  (display (sqrt n))
	  (newline)
	  (print-sqrts (+ n 1))))))

(display "(sqrt n)")
(newline)
(display "----------")
(newline)
(print-sqrts 0)

