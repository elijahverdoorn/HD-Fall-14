(define sum-squares
  (lambda (n)
    (if (< n 1) 1
	(begin
	  (+ (* n n) (sum-squares(- n 1)))))))

(define print-sum
  (lambda (n) ;print factorials from n to 5
    (if (> n 5) 'done
	(begin
	 (display (sum-squares n))
	 (newline)
	 (print-sum (+ n 1))))))

(display "(n\tsum n roots)")
(newline)
(display "----------------------------")
(newline)
(print-sum 1)
