
(define (SumFactor numb n)
; if n is 1 then return the sum of proper factors of the numb
(if (= n 1)
    1
 
; if n is a factor of the numb then call SumFactor with n-1 and sum+n
(if (= (mod numb n) 0)
    (+ (SumFactor numb (- n 1)) n)
     
; if n is not a factor of the numb then call SumFactor with n-1 and sum
(SumFactor numb (- n 1)))))

(define (Classify numb)
; if the sum of proper factors of the numb is equal to the numb then display the numb is perfect number
(if (= (SumFactor numb (/ numb 2)) numb)
    (display "Perfect")

; if the sum of proper factors of the numb is greater than the numb then display the numb is abudent number
(if (> (SumFactor numb (/ numb 2)) numb)
    (display "Abundant")

; if the sum of proper factors of the numb is less than the numb then display the numb is deficient number
(display "Deficient"))))



(define (main)
(display "Enter a number: ")
(define numb (read))
(display "The number ")
(display numb)
(display " is ")
(Classify numb)
(newline))

; call the main function
(main)
