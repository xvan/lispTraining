(defmacro with-gensyms ((&rest names) &body body)
    `(let ,(loop for n in names collect `(,n (gensym))) ,@body))

(defun report-result (result form)
    (format t "~:[FAIL~;pass~] ... ~a~%" result form)
    result )

;;(defmacro check (form) 
;;    `(report-result ,form ',form))

;(defun test-+ ()
;    (check (= (+ 1 2) 3))
;    (check (= (+ 1 2 3) 4))
;    (check (= (+ -1 -3) -4)))

(defmacro combine-results (&body forms)
    (with-gensyms (result)
                  `(let ((,result t))
                       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
                       ,result)))

(defmacro check (&body forms) 
    `(combine-results
      ,@(loop for f in forms collect `(report-result ,f ',f))))


(defun test-+ ()    
    (check 
        (= (+ 1 2) 3)
        (= (+ 1 2 3) 4)
        (= (+ -1 -3) -4)))


(test-+)