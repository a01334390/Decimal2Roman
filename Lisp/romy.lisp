;; Built by Fernando Martin Garcia Del Angel
;; Date: October 20th, 2018
;; Language: LISP
;; concatString function from: https://stackoverflow.com/questions/5457346/lisp-function-to-concatenate-a-list-of-strings

(defconstant roman (make-array '(13)
 :initial-contents '("M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I")
))

(defconstant decimal (make-array '(13)
 :initial-contents '(1000 900 500 400 100 90 50 40 10 9 5 4 1)
))

(defun concatString (list)
  "A non-recursive function that concatenates a list of strings."
  (if (listp list)
      (with-output-to-string (s)
         (dolist (item list)
           (if (stringp item)
             (format s "~a" item))))))

(defun decimal2roman (num)
    "This function converts a number between 1 and 3999 to roman numerals"
    (setq str "")
    (if (and (> num 0) (< num 4000))
        (loop for i from 0 to 12 doing
            (loop while (>= num (svref decimal i))
                do (setq num (- num (svref decimal i)))
                do (setq str (concatString (list str (svref roman i))))
            )
        )       
        (print "Out of Range, must be between 1 and 3999")
    )
    str
)

(princ "Enter decimal number: ")
(setq n (read))
(terpri)
(print (concatString (list "Decimal: " (write-to-string n) " -> Roman: " (decimal2roman n))))