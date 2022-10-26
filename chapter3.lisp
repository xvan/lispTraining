(list :a 1 :b 2 :c 3)
(getf (list :a 1 :b 2 :c 3) :a )

(defun testme (x y) (+ x y ))

(testme 3 4)
(defun make-cd (title artist rating ripped) (list :title title :artist artist :rating rating :ripped ripped))
(make-cd "Roses" "Kathy Mattea" 7 t)
(defvar *db* nil)
(defun add-record (cd) (push cd *db*))
(add-record (make-cd "Roses" "Kathy Mattea" 7 t))
(add-record (make-cd "Fly" "Dixie" 8 t))
(add-record (make-cd "Home" "Dixie" 9 t))
(defun dump-db () (dolist (cd *db*) (format t "~{~a:~10t~a~%~}~%" cd)))
*db*
(dump-db)
(defun prompt-read (prompt) 
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))


(defun prompt-for-cd () (
  make-cd
  (prompt-read "Title")
  (prompt-read "Artist")
  (prompt-read "Rating")
  (prompt-read "Ripped [y/n]"))) 

;(parse-integer (prompt-read "Rating") :junk-allowed t)

(defun where (&key title artist rating (ripped nil ripped-p))
  #'(lambda (cd)
	(and
	  (if title    (equal (getf cd :title ) title ) t)
	  (if artist   (equal (getf cd :artist) artist) t)
	  (if rating   (equal (getf cd :rating) rating) t)
	  (if ripped-p (equal (getf cd :ripped) ripped) t)
	  )))
(defun select (selector-fn)
  (remove-if-not selector-fn *db*))


(select (where :artist "Dixie"))
(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (set *db*
	 (mapcar
	   #'(lambda (row) (when (funcall selector-fn row)
	  (if title    ( setf ( getf row :title ) title ) )
	  (if artist   ( setf ( getf row :artist) artist) )
	  (if rating   ( setf ( getf row :rating) rating) )
	  (if ripped-p ( setf ( getf row :ripped) ripped) ))
		 row) *db*)))


(defun make-comparison-expr (field value)
  `(equal (getf cd ,field) ,value))


(make-comparison-expr :rating 10)

(defun make-comparisons-list (fields)
  (loop while fields
	  collecting (make-comparison-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd) (and ,@(make-comparisons-list clauses))))

(macroexpand-1 '(where :title "Home" :ripped t) )


