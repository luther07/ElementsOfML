;; cube function
(defun cube (x)
       (* x x x))

;; struct definition like tuple with size 3, and smallest-triple element function
(defstruct triple-int
 (one 0 :type fixnum)
 (two 0 :type fixnum)
 (three 0 :type fixnum))

(defun smallest-triple (x)
  (cond ((triple-int-p x)
    (if (< (triple-int-one x) (triple-int-two x))
      (if (< (triple-int-one x) (triple-int-three x))
        (triple-int-one x)
        (if (< (triple-int-three x) (triple-int-two x))
          (triple-int-three x)
          (triple-int-two x)))
      (if (< (triple-int-two x) (triple-int-three x))
        (triple-int-two x)
        (triple-int-three x))))
    (t nil)))

;; function that returns third element of a list
(defun third-element (x)
  (car (cdr (cdr x))))

;; function to reverse a tuple of length 3
(defun reverse-triple (x)
  (cond ((triple-int-p x)
    (make-triple-int :one (triple-int-three x) :two (triple-int-two x) :three (triple-int-one x)))
        (t nil)))

;; function that returns the third character of a string
(defun third-character (x)
  (car (cdr (cdr (coerce x 'list)))))

;; cycle a list by one place
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