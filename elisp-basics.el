;; print
(message "hi")

;; print variable values
(message "num: %d" 16)
(message "string: %s" "string")
(message "list: %S" (list 8 2 3)) ; %S is for any lisp expression

;; the "p" stands for "predicate"
(integerp 3.)
(floatp 3.)
;; t means true; nil means false

;; in elisp, the sympol nil is false, anything else is true. Also nil is equivalent to the empty list ()
(if '() "yes" "no") ; no

(/= 3 4) ; not equal

;; equality test
(string-equal "abc" 'abc) ; t

;; loacl variable
(let (a b)
  (setq a 3)
  (setq b 4)
  (+ a b)) ; return 7

(let ((a 3) (b 4))
  (+ a b)) ; return 7

;; the purpose (目的) of progn is similar to a block of code {...} 

(if t
    (progn ; true
					; code here)
      (progn) ; false
      ; code here)

(point)
      
