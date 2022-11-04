;https://www.codewars.com/kata/55fd2d567d94ac3bc9000064

(defun pyramid-level (n) 
  (+ (/ (* (- n 1) n) 2) 1)
  )

(defun buddy (n)
    (loop 
     :for i from (pyramid-level n) to 
      :when (setf retval (hasbuddy i)) return (format nil "~a" retval) 
      :finally (return "Nothing")))

(pyramid-level 5)