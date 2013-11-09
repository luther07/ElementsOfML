;; a function that returns the smallest and largest of its three integer arguments.
(defstruct double-int
  (one 0 :type fixnum)
  (two 0 :type fixnum))

(defun smallest-and-largest (a b c)
  (if (< a b)
    (if (< b c)
      (make-double-int :one a :two c)
      (if (< a c)
        (make-double-int :one a :two b)
        (make-double-int :one c :two b)))
    (if (> c a)
      (make-double-int :one b :two c)
      (if (> c b)
        (make-double-int :one b :two a)
        (make-double-int :one c :two a)))))

;; a function that returns its three integer arguments in sorted order
(defun sort-triple (a b c)
  (if (< a b)
    (if (< b c)
      (list a b c)
      (if (< a c)
        (list a c b)
        (list c a b)))
    (if (> b c)
      (list c b a)
      (if (> a c)
        (list b c a)
        (list b a c)))))

(defun round-nearest-tenth (x)
  (/ (round (* 10.0 x)) 10.0))