#!/usr/bin/clisp
;; Define function to create the list from 1 to 100
(defun create-range (start end)
  (progn
    (nconc 
     (if (= start end)
	 (cons start nil)
       (cons start (create-range (1+ start) end))))))


(defun cracklepop (list)
  (if list
      (let ((number (pop list)))
	(progn
	  (format t
		  (cond ((and (= (mod number 3) 0) (= (mod number 5) 0)) "CracklePop~%")
			((= (mod number 3) 0) "Crackle~%")
			((= (mod number 5) 0) "Pop~%")
			(t  (concatenate 'string (write-to-string number) "~%"))))
	  (cracklepop list)))))


;; Call the cracklepop function on the generated list
(cracklepop (create-range 1 100))
