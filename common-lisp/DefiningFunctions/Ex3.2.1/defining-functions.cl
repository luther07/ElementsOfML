;; write factorial function that takes an integer n >= 1
;; and produces the product of all the integers from 1 up
;; to n.

(defun factorial (n)
  (if (> n 1)
    (* n (factorial (- n 1)))
    n))