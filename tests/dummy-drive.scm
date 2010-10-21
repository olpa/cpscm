; (* (+ 1 2) (+ 1 (id 2)))
; Dummy "cpscm__drive" and "cpscm__trampoline" functions.
; See doc/cpscm_trampoline

(define cpscm__ret #f)

(define (cpscm__drive x)
  (set! cpscm__ret x))

(define (cpscmid cc val)
  (cc val))

(define-macro (cpscm__trampoline x) x)

(define (cpscm+ cc x y)
  (cc (+ x y)))

(define (cpscm* cc x y)
  (cc (* x y)))

(cpscm__drive
  ((lambda (gk1)
     (cpscm__trampoline
       (cpscm+
         (lambda (gret+_2)
           (cpscm__trampoline
             (cpscmid
               (lambda (gretid_3)
                 (cpscm__trampoline
                   (cpscm+
                     (lambda (gret+_4)
                       (cpscm__trampoline (cpscm* gk1 gret+_2 gret+_4)))
                     1
                     gretid_3)))
               2)))
         1
         2)))
   (lambda (cpscmx) cpscmx)))

(display cpscm__ret)(display "\n")
