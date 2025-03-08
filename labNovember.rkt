;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname labNovember) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Question 1
;'(1 a(2 b(3 c(4 d(5 e(6 f(7 g (8 h))))))))


;Question 2
(define flatten
  (lambda (los)
    (cond
      ((null? los) '())
      ((list? (car los)) (append (flatten (car los)) (flatten (cdr los))))
      (else (cons (car los) (flatten (cdr los)))))))

(define count-block-exp-helper
  (lambda (block-exp sum)
    (cond
      ((null? block-exp) sum)
      ((number? (car block-exp)) (count-block-exp-helper (cdr block-exp) (+ (car block-exp) sum)))
      (else (count-block-exp-helper (cdr block-exp) sum)))))

(define count-block-exp
        (lambda (block-exp)
          (count-block-exp-helper (flatten block-exp) 0)))


(count-block-exp '(1 a(2 b(3 c(4 d(5 e(6 f(7 g(8 h)))))))))

;Question 3

(define collect-symbols-helper
  (lambda (block-exp symbols)
    (cond
      ((null? block-exp) symbols)
      ((symbol?(car block-exp)) (collect-symbols-helper (cdr block-exp)(cons(car block-exp)symbols)))
      (else (collect-symbols-helper (cdr block-exp) symbols)))))

(define collect-symbols
        (lambda (block-exp)
          (collect-symbols-helper (flatten block-exp) '()))) 

(collect-symbols '(1 a (2 b (3 c (4 d (5 e (6 f (7 g (8 h))))))))) 