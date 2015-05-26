(define factorial
  (lambda (num) ; a non-negative integer
    (if (= 0 num) 1
	;; assert:  num > 0
	(* num (factorial (- num 1))))))

(factorial 10)
