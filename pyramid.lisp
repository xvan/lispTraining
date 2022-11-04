;https://www.codewars.com/kata/55fd2d567d94ac3bc9000064

(defun pyramid-start (n) 
  (+ (/ (* (- n 1) n) 2) 1))

(pyramid-level 3)

(defun row-sum-odd-numbers (n) 
    (let ((start (pyramid-start n)))
      (loop :for i :from start :to (+ start n -1)
        :summing (+(* (- i 1) 2) 1) )))

(row-sum-odd-numbers 2)