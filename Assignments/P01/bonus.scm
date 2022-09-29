
; /****************************************************************************************************
; 
;     Author:           Loic Konan
;     Email:            loickonan.lk@gmail.com
;     Label:            Perfect Number (5 points extra credit)
;     Title:            Program 1
;     Course:           CMPS 5113, Dr. Johnson
;     Semester:         Fall 2022
;     Description:
; 
;                       The goal of this assignment is to write a program that will print all perfect
;                       numbers between 1 and 1000. 
;                       The user can change it to any other number.
;
;                       Examples:
;                                   10 will print 6
;                                   100 will print 6, 28
;                                   1000 will print 6, 28, 496
; 
;     Usage:
;            main.scm          : driver program
;            
;            
;            
;     IDE:              repl.it
; 
; 
; /****************************************************************************************************/
; Header information
(begin
(display "
; /****************************************************************************************************
; 
;     Author:           Loic Konan
;     Email:            loickonan.lk@gmail.com
;     Label:            Perfect Number Bonus
;     Title:            Program 1
;     Course:           CMPS 5113, Dr. Johnson
;     Semester:         Fall 2022
;     Description:
; 
;                       The goal of this assignment is to write a program that will print all perfect
;                       numbers between 1 and 1000. 
;                       The user can change it to any other number.
;
;                       Examples:
;                                   10 will print 6
;                                   100 will print 6, 28
;                                   1000 will print 6, 28, 496
; 
;     Usage:
;            main.scm          : driver program
;            
;            
;            
;     IDE:              repl.it
; 
; 
; /****************************************************************************************************/
")

; This function sums the factors of a number
; @param numb the number to be summed
; @param n the number to be added to the sum
(define (Sumfactors numb n sum)
    ; if n is equal to 1 then return the sum
    (if (<= n 1)
    sum

    ; This if statement checks if the number is a factor of the number
    (if (= (mod numb n)0)

        ; if the numb is divisible by n then add n to the sum and call the function again
        (Sumfactors numb (- n 1) (+ sum n))

        ; if the numb is not divisible by n then call the function again
        (Sumfactors numb (- n 1) sum))))


; This function checks if the number is a perfect number
; @param n the number to be checked
; This function will check all the perfect numbers between 1 and 1000
; and display them
; example: 1000 will display 6, 28, 496
(define (Perfect)
        (define (helper n)
            (if (<= n 1)
                (display " ")
                    (if (= (Sumfactors n (floor (/ n 2)) 1) n)
                        (begin
                        (display n)
                        (display " ")
                        (helper (- n 1)))
                        (helper (- n 1)))))

    ; Try one of each different examples below.
    ;; (helper 10))
    ;; (helper 100))
    (helper 1000))

; main function that calls the Perfect function
(define (main)
    (display "Perfect numbers: ")
    (Perfect))

; call main function
(main)
