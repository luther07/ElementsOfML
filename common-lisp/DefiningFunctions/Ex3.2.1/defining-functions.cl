;; write factorial function that takes an integer n >= 1
;; and produces the product of all the integers from 1 up
;; to n.

(defun factorial (n)
  (if (> n 1)
    (* n (factorial (- n 1)))
    n))

;; write a function to cycle a list n times
(defun cycle-n (my-list n)
  (defun cycle-one (x)
    (defun reverse-list (original new)
      (if original
        (cycle-helper (cdr original) (cons (car original) new))
        new))
    (defun repack (reversed-tail original-head)
      (if reversed-tail
        (repack (cdr reversed-tail) (cons (car reversed-tail) original-head))
        original-head))
    (repack (reverse-list (cdr x) nil) (cons (car x) nil)))
  (if (< n 1)
    my-list
    (cycle-n (cycle-one my-list) (- n 1)))
)