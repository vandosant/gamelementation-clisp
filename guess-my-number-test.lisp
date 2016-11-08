(ql:quickload :lisp-unit)

#-xlisp-test (load "guess-my-number")

(defpackage #:guess-my-number-test
  (:use #:common-lisp #:lisp-unit))

(in-package #:guess-my-number-test)

(define-test starting-guess
  (assert-equal 50 (guess-my-number:guess))
  (guess-my-number:start-over))

(define-test smaller-guess
  (assert-equal 25 (guess-my-number:smaller))
  (guess-my-number:start-over))

(define-test bigger-guess
  (assert-equal 75 (guess-my-number:bigger))
  (guess-my-number:start-over))

(define-test keeps-guessing-smaller
  (assert-equal 25 (guess-my-number:smaller))
  (assert-equal 12 (guess-my-number:smaller))
  (assert-equal 6 (guess-my-number:smaller))
  (assert-equal 3 (guess-my-number:smaller))
  (assert-equal 1 (guess-my-number:smaller))
  (guess-my-number:start-over))

(define-test keeps-guessing-bigger
  (assert-equal 75 (guess-my-number:bigger))
  (assert-equal 88 (guess-my-number:bigger))
  (assert-equal 94 (guess-my-number:bigger))
  (assert-equal 97 (guess-my-number:bigger))
  (assert-equal 99 (guess-my-number:bigger))
  (assert-equal 100 (guess-my-number:bigger))
  (guess-my-number:start-over))

(define-test starting-over
  (guess-my-number:smaller)
  (guess-my-number:bigger)
  (assert-equal 50 (guess-my-number:start-over)))

#-xlisp-test
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :guess-my-number-test))
