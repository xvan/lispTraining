;;; https://www.codewars.com/kata/56b2abae51646a143400001d/train/commonlisp

(defun int-to-binary-list (n &optional acc)
  (cond ((zerop n) (or acc (list 0)))
        ((plusp n)
         (int-to-binary-list (ash n -1) (cons (logand 1 n) acc)))
        (t (error "~S: non-negative argument required, got ~s" 'int-to-binary-list n))))


(int-to-binary-list 3)

(defun binary-list-to-int (x)
        (reduce (lambda (a b) (+ (* 2 a) b)) x))

(defun list-xor (a b)
    (mapcar 'logxor a b))

(defun list-gray (a)
    (list-xor a (append '(0) (butlast a))))

(defun gray (x) 
    (list-gray (int-to-binary-list x)))

(defun mystery (n) 
    (binary-list-to-int (gray n)))

(defun inv-list-gray (x) (loop 
 with acc := 0       
 for b in x
    collect (setq acc (logxor acc b))))

(defun inv-gray (x) 
    (inv-list-gray (int-to-binary-list x)))

(defun mystery-inv (n)
    (binary-list-to-int (inv-gray n))
    )

;(defun mystery-name ())