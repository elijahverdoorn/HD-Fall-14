(define n 7)

(define addn
  (lambda (x)
    (+ x n)))


(display "Enter an integer value: ")
(define val (read))
(display "The call addn(")
(display val)
(display ") returns ")
(display (addn val))
(newline)
