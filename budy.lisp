(defpackage #:challenge/solution
  (:use #:cl)
  (:export #:buddy))
(in-package #:challenge/solution)

(defun buddy (start stop)
    (loop 
     :with retval := nil
     :for i from start to stop
      :when (setf retval (hasbuddy i)) return (format nil "~a" retval) 
      :finally (return "Nothing")))


(defun divsum (start stop)
  (loop 
     :for i from start to stop
     collect (list :base i :sum (apply '+ (divisors i)))))

(defun target-stop (start stop)
    (- (reduce 'max (mapcar #'(lambda (row) (getf row :sum ) ) (divsum start stop) )) 1))


(defun is-related (x y)
  (= (getf x :base) (- (getf y :sum) 1)))

(defun buddy (start stop)
  ( loop
        :with base-candidates := (divsum start stop) 
            :and target-candidates := (divsum start (target-stop start stop) )
            :and result := nil        
        :for x in base-candidates
        :when (setf result (loop 
                             :for y in target-candidates
                             :when (and (is-related x y) (is-related y x)) return (list (getf x :base) (getf y :base))
                             )
        ) return (format nil "~a" result)
        :finally (return "Nothing")))



(defun divisors (n)
  (apply 'append '(1) (loop
    :for i from 2 to (isqrt n)
    :when (= 0 (mod n i)) collect (let ((j (/ n i))) (if (= i j) (list i) (list i j))))))


(defun hasbuddy (i)
  (let ((j (- (sumdiv i) 1))) 
    (if (>= j i) 
        (let ((k (- (sumdiv j) 1)))
        (if (= i k) (list i j))))))

(defun buddy (start stop)
    (loop 
     :with retval := nil
     :for i from start to stop
      :when (setf retval (hasbuddy i)) return (format nil "~a" retval) 
      :finally (return "Nothing")))


    
(buddy 200 1000)

(buddy 10 50)
(hasbuddy 48)

(sumdiv 48)


(defun hasbuddy (i) i)



(buddy 10 50)