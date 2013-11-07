;; cube function
(defun cube (x)
       (* x x x))

;; struct definition like tuple with size 3, and smallest element function
(defstruct triple-int
 (one 0 :type fixnum)
 (two 0 :type fixnum)
 (three 0 :type fixnum))

(defun smallest (x)
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