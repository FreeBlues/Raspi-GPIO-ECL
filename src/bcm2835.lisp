#| bcm2835.lisp  introduction
;; Wrap bcm2835 library(libbcm2835.so) for Common Lisp
;; 

[usage:]
(load "load-bcm2835.lisp")

[exported function:]
(rpi:bcm-init)
(rpi:bcm-version)
(rpi:gpio-fsel pin mode)
(rpi:gpio-write pin on)
(rpi:gpio-lev pin)
(rpi:gpio-set pin)
(rpi:gpio-clr pin)
(rpi:bcm-delay millis)
(rpi:bcm-delay-microseconds micros)
(rpi:bcm-close)

[parameters:]
pin: RPI_GPIO_P1_11
mode: BCM2835_GPIO_FSEL_OUTP
on: HIGH
|#

(defpackage :BCM2835
(:nicknames :rpi)
#+ecl (:use :cl)
#+clisp (:use :cl)
(:export :bcm-init
  :bcm-version
  :bcm-close
  :gpio-fsel
  :gpio-write
  :gpio-lev
  :gpio-set
  :gpio-clr
  :bcm-delay
  :bcm-delay-microseconds
  :LOW
  :HIGH
  :RPI_GPIO_P1_03
  :RPI_GPIO_P1_05
  :RPI_GPIO_P1_07
  :RPI_GPIO_P1_08
  :RPI_GPIO_P1_10
  :RPI_GPIO_P1_11
  :RPI_GPIO_P1_12
  :RPI_GPIO_P1_13
  :RPI_GPIO_P1_15
  :RPI_GPIO_P1_16
  :RPI_GPIO_P1_18
  :RPI_GPIO_P1_19
  :RPI_GPIO_P1_21
  :RPI_GPIO_P1_22
  :RPI_GPIO_P1_23
  :RPI_GPIO_P1_24
  :RPI_GPIO_P1_26
  :RPI_V2_GPIO_P1_03
  :RPI_V2_GPIO_P1_05
  :RPI_V2_GPIO_P1_07
  :RPI_V2_GPIO_P1_08
  :RPI_V2_GPIO_P1_10
  :RPI_V2_GPIO_P1_11
  :RPI_V2_GPIO_P1_12
  :RPI_V2_GPIO_P1_13
  :RPI_V2_GPIO_P1_16
  :RPI_V2_GPIO_P1_18
  :RPI_V2_GPIO_P1_19
  :RPI_V2_GPIO_P1_21
  :RPI_V2_GPIO_P1_22
  :RPI_V2_GPIO_P1_23
  :RPI_V2_GPIO_P1_24
  :RPI_V2_GPIO_P1_26
  :RPI_V2_GPIO_P1_29
  :RPI_V2_GPIO_P1_31
  :RPI_V2_GPIO_P1_32
  :RPI_V2_GPIO_P1_33
  :RPI_V2_GPIO_P1_35
  :RPI_V2_GPIO_P1_36
  :RPI_V2_GPIO_P1_37
  :RPI_V2_GPIO_P1_38
  :RPI_V2_GPIO_P1_40
  :RPI_V2_GPIO_P5_03
  :RPI_V2_GPIO_P5_04
  :RPI_V2_GPIO_P5_05
  :RPI_V2_GPIO_P5_06
  :BCM2835_GPIO_FSEL_OUTP))

(in-package :BCM2835)

(defconstant LOW #x0)
(defconstant HIGH #x1)

(defconstant RPI_GPIO_P1_03  0)
(defconstant RPI_GPIO_P1_05  1)
(defconstant RPI_GPIO_P1_07  4)
(defconstant RPI_GPIO_P1_08 14)
(defconstant RPI_GPIO_P1_10 15)
(defconstant RPI_GPIO_P1_11 17)
(defconstant RPI_GPIO_P1_12 18)
(defconstant RPI_GPIO_P1_13 21)
(defconstant RPI_GPIO_P1_15 22)
(defconstant RPI_GPIO_P1_16 23)
(defconstant RPI_GPIO_P1_18 24)
(defconstant RPI_GPIO_P1_19 10)
(defconstant RPI_GPIO_P1_21  9)
(defconstant RPI_GPIO_P1_22 25)
(defconstant RPI_GPIO_P1_23 11)
(defconstant RPI_GPIO_P1_24  8)
(defconstant RPI_GPIO_P1_26  7)

(defconstant RPI_V2_GPIO_P1_03  2)
(defconstant RPI_V2_GPIO_P1_05  3)
(defconstant RPI_V2_GPIO_P1_07  4)
(defconstant RPI_V2_GPIO_P1_08 14)
(defconstant RPI_V2_GPIO_P1_10 15)
(defconstant RPI_V2_GPIO_P1_11 17)
(defconstant RPI_V2_GPIO_P1_12 18)
(defconstant RPI_V2_GPIO_P1_13 27)
(defconstant RPI_V2_GPIO_P1_15 22)
(defconstant RPI_V2_GPIO_P1_16 23)
(defconstant RPI_V2_GPIO_P1_18 24)
(defconstant RPI_V2_GPIO_P1_19 10)
(defconstant RPI_V2_GPIO_P1_21  9)
(defconstant RPI_V2_GPIO_P1_22 25)
(defconstant RPI_V2_GPIO_P1_23 11)
(defconstant RPI_V2_GPIO_P1_24  8)
(defconstant RPI_V2_GPIO_P1_26  7)
(defconstant RPI_V2_GPIO_P1_29  5)
(defconstant RPI_V2_GPIO_P1_31  6)
(defconstant RPI_V2_GPIO_P1_32 12)
(defconstant RPI_V2_GPIO_P1_33 13)
(defconstant RPI_V2_GPIO_P1_35 19)
(defconstant RPI_V2_GPIO_P1_36 16)
(defconstant RPI_V2_GPIO_P1_37 26)
(defconstant RPI_V2_GPIO_P1_38 20)
(defconstant RPI_V2_GPIO_P1_40 21)
(defconstant RPI_V2_GPIO_P5_03 28)
(defconstant RPI_V2_GPIO_P5_04 29)
(defconstant RPI_V2_GPIO_P5_05 30)
(defconstant RPI_V2_GPIO_P5_06 31)

(defconstant BCM2835_GPIO_FSEL_INPT #x00)
(defconstant BCM2835_GPIO_FSEL_OUTP #x01)
(defconstant BCM2835_GPIO_FSEL_ALT0 #x04)
(defconstant BCM2835_GPIO_FSEL_ALT1 #x05)
(defconstant BCM2835_GPIO_FSEL_ALT2 #x06)
(defconstant BCM2835_GPIO_FSEL_ALT3 #x07)
(defconstant BCM2835_GPIO_FSEL_ALT4 #x03)
(defconstant BCM2835_GPIO_FSEL_MASK #x07)

#+ecl
(progn
;; load library: Linux .so | OSX .dylib | MS-WIN .dll 
(ffi:load-foreign-library "./libfile/libbcm2835.so")

;; declare C function to ECL function
(ffi:def-function ("bcm2835_init" bcm-init) () :returning :int)
(ffi:def-function ("bcm2835_version" bcm-version) () :returning :int)
(ffi:def-function ("bcm2835_close" bcm-close) () :returning :int)
(ffi:def-function ("bcm2835_gpio_fsel" gpio-fsel) ((pin :int8-t) (mode :int8-t)))
(ffi:def-function ("bcm2835_gpio_write" gpio-write) ((pin :int8-t) (on :int8-t)))
(ffi:def-function ("bcm2835_gpio_lev" gpio-lev) ((pin :int8-t)) :returning :int8-t)
(ffi:def-function ("bcm2835_gpio_set" gpio-set) ((pin :int8-t)))
(ffi:def-function ("bcm2835_gpio_clr" gpio-clr) ((pin :int8-t)))
(ffi:def-function ("bcm2835_delay" bcm-delay) ((millis :unsigned-int)))
(ffi:def-function ("bcm2835_delayMicroseconds" bcm-delay-microseconds) ((micros :uint64-t)))

;; many others to be continue...

(rpi:bcm-init)
(rpi:gpio-lev 1)
(rpi:bcm-close)
)

#-ecl
(progn
(ffi:open-foreign-library "./libfile/libbcm2835.so") 

(def-call-out bcm-init
(:name "bcm2835_init")
(:return-type uint8)
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out bcm-version
(:name "bcm2835_version")
(:return-type uint8)
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out bcm-close
(:name "bcm2835_close")
(:return-type uint8)
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out gpio-fsel
(:name "bcm2835_gpio_fsel")
(:arguments (pin uint8) (mode uint8))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out gpio-write
(:name "bcm2835_gpio_write")
(:arguments (pin uint8) (on uint8))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out gpio-lev
(:name "bcm2835_gpio_lev")
(:return-type uint8)
(:arguments (pin uint8))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out gpio-set
(:name "bcm2835_gpio_set")
(:arguments (pin uint8))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out gpio-clr
(:name "bcm2835_gpio_clr")
(:arguments (pin uint8))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out bcm-delay
(:name "bcm2835_delay")
(:arguments (millis uint))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))

(def-call-out bcm-delay-microseconds
(:name "bcm2835_delayMicroseconds")
(:arguments (micros uint64))
(:language :stdc)
(:library "./libfile/libbcm2835.so"))
)
