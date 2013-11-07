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