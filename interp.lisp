(defun trunc (x)
    (/ (floor (* x 100.0)) 100.0))

(defun interp (f l u n)    
   (mapcar (lambda (x) (trunc(funcall f x))) (loop
   :with tolerance := 0.0001
   :for x :from l :to (- u tolerance) :by (/ (- u l) n) :collect x )))

(interp 'trunc 0 0.9 3)
