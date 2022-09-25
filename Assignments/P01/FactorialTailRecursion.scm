; This program will be passed a positive integer, n, and
; will return n! One function will use recursion and 
; a second function will use tail recursion.

; The fac function uses recursion to return n!
(define (fac n)
  ; If n = 1, the base case is reached, return 1
  (if (= n 1)
      1
      ; Implied else for non-base case
      ; Return n * fac(n - 1) 
      (* n (fac (- n 1)))))

; The facTail function uses tail recursion to return n!
(define (facTail n tot)
  ; If n = 1, the base case is reached, return n!
  ; which is stored in tot.  Using tail recursion
  ; tot keeps an accumulated value in each call
  ; to the tail recursive function.
  (if (= n 1)
      tot
      ; Implied else for non-base case
      ; Return facTail(n-1, n*tot)
      (facTail (- n 1)(* n tot))))


(print "This program will print n!  Enter n: ")
(define n (read))
(display n)
(display "! = ")
(display (fac n))
(print " using recursion.")
(display n)
(display "! = ")
(display (facTail n 1))
(print " using tail recursion.")