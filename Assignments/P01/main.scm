;/****************************************************************************************************
; 
;     Author:           Loic Konan
;     Email:            loickonan.lk@gmail.com
;     Label:            Perfect Number
;     Title:            Program 1
;     Course:           CMPS 5113, Dr. Johnson
;     Semester:         Fall 2022
;     Description:
; 
;                       The goal of this assignment is to write a program that classifies a number as
;                       perfect, abundant, or deficient. A perfect number is a number that is equal 
;                       to the sum of its proper divisors. An abundant number is a number that is 
;                       less than the sum of its proper divisors. A deficient number is a number that 
;                       is greater than the sum of its proper divisors.    
;                       Use one or more functions to determine the classification of the number. 
;                       Use tail recursion to sum the factors of the given number.
;                       
;                       Examples:
;                                   6 is a perfect number because 1 + 2 + 3 = 6
;                                   12 is abundant because 1 + 2 + 3 + 4 + 6 > 12
;                                   14 is deficient because 1 + 2 + 7 < 14
;
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
;     Label:            Perfect Number
;     Title:            Program 1
;     Course:           CMPS 5113, Dr. Johnson
;     Semester:         Fall 2022
;     Description:
; 
;                       The goal of this assignment is to write a program that classifies a number as
;                       perfect, abundant, or deficient. A perfect number is a number that is equal 
;                       to the sum of its proper divisors. An abundant number is a number that is 
;                       less than the sum of its proper divisors. A deficient number is a number that 
;                       is greater than the sum of its proper divisors.    
;                       Use one or more functions to determine the classification of the number. 
;                       Use tail recursion to sum the factors of the given number.
;                       
;                       Examples:
;                                   6 is a perfect number because 1 + 2 + 3 = 6
;                                   12 is abundant because 1 + 2 + 3 + 4 + 6 > 12
;                                   14 is deficient because 1 + 2 + 7 < 14
;
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


; This function determines if a number is perfect, abundant, or deficient
; @param numb the number to be checked
; @param sum the sum of the factors of the number
(define (Classify numb sum)
    (define sum (Sumfactors numb (floor (/ numb 2) )1))

        ; if numb is less or equal to 0 display "Number not valid"
        (if (<= numb 0)
            (display "Not valid, Enter any number greater than 0")

            ; if the sum is equal to the numb and sum not equal to 1 then the number is perfect
            (if (and (not (= sum 1)) (= sum numb))
                (display "Perfect Number")

            ; if sum is equal to 1 then the number is deficient
            (if (= sum 1)
                (display "Deficient Number")

                ; if the sum is greater than the numb then the number is abundant
                (if (> sum numb)
                    (display "Abundant Number")

                    ; if the sum is less than the numb then the number is deficient
                    (if (< sum numb)
                        (display "Deficient Number")))))))


; This is the main function
; asks the user to enter a number
; @return the number entered by the user
; This function prints the classification of a number
(define (main)
  (display "Enter a number: ")
  (define numb (read))
  (display "The number ")
  (display numb)
  (display " is ")
  (Classify numb 1)
  (newline))

; call the main function
(main)
