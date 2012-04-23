(defvar *primes* (make-hash-table))

(defun has-factor (cur upper)
  (if (<= (expt cur 2) upper)
      (if (= (mod upper cur) 0)
          T
          (has-factor (+ cur 2) upper))
      NIL))

(defun is-prime (n)
  (cond ((< n 2) NIL)
        ((= n 2) T)
        ((= (mod n 2) 0) NIL)
        (T (not (has-factor 3 n)))))

;(defun is-prime (n)
;  (if (gethash n *primes*)
;    T
;    (let ((result (is-prime-raw n)))
;      (if result
;        (setf (gethash n *primes*) T))
;      result)))

(defun count-primes (cur acc upper)
  (if (<= cur upper)
      (if (is-prime cur)
          (count-primes (+ cur 2) (+ acc 1) upper)
          (count-primes (+ cur 2) acc upper))
      acc))

(defun solve-line (val)
  (let ((start (if (= (mod val 2) 0) (+ val 1) (+ val 2))))
    (format T "~A~%" (count-primes start 0 (* val 2)))))

(defun solve ()
  (let ((val (read)))
        (if (= val 0)
            ()
            (progn 
             (solve-line val)
             (solve)))))
(solve)
