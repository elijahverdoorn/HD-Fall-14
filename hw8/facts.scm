This is the Scheme process buffer.
Type C-x C-e to evaluate the expression before point.
Type C-c C-c to abort evaluation.
Type C-h m for more information.

Welcome to Racket v5.3.

(define factorial
  (lambda (n)
    (if (< n 1) 1
	(begin
	  (* n (factorial (- n 1)))))))

(define print-factorial
  (lambda (n) ;print factorials from n to 5
    (if (> n 5) 'done
	(begin
	 (display (factorial n))
	 (newline)
	 (print-factorial (+ n 1))))))

(display "(n\tfactorial n)")
(newline)
(display "--------------------")
(newline)
(print-factorial 1)


