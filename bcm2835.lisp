#| Introduction

[usage:]
(compile-file "bcm2835.lisp")
(load "bcm2835.fas")

(rpi:bcm-init)
(rpi:gpio-fsel pin-uint8 mode-uint8)
(rpi:gpio-write pin-uint8 on-uint8)
(rpi:gpio-lev pin-uint8)
(rpi:gpio-set pin-uint8)
(rpi:gpio-clr pin-uint8)
(rpi:bcm-delay millis-uint)
(rpi:bcm-delay-microseconds micros-uint64)
(rpi:bcm-close)
|#

(defpackage :BCM2835
(:nicknames :rpi)
(:use :cl)
(:export :bcm-init
  :bcm-close
  :gpio-fsel
  :gpio-write
  :gpio-lev
  :gpio-set
  :gpio-clr
  :bcm-delay
  :bcm-delay-microseconds))

(in-package :BCM2835)

#+ecl
(progn
;; load library: Linux .so | OSX .dylib | MS-WIN .dll 
(ffi:load-foreign-library "libbcm2835.so")

;; declare C function to ECL function
(ffi:def-function ("bcm2835_init" bcm-init) ())
(ffi:def-function ("bcm2835_close" bcm-close) ())
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
(ffi:open-foreign-library "libbcm2835.so") 

(ffi:def-call-out init
(:name "bcm2835_init")
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out close
(:name "bcm2835_close")
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out gpio-fsel
(:name "bcm2835_gpio_fsel")
(:arguments (pin ffi:uint8) (mode ffi:uint8))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out gpio-write
(:name "bcm2835_gpio_write")
(:arguments (pin ffi:uint8) (on ffi:uint8))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out gpio-lev
(:name "bcm2835_gpio_lev")
(:return-type ffi:uint8)
(:arguments (pin ffi:uint8))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out gpio-set
(:name "bcm2835_gpio_set")
(:arguments (pin ffi:uint8))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out gpio-clr
(:name "bcm2835_gpio_clr")
(:arguments (pin ffi:uint8))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out delay
(:name "bcm2835_delay")
(:arguments (millis ffi:uint))
(:language :stdc)
(:library "libbcm2835.so"))

(ffi:def-call-out delay-microseconds
(:name "bcm2835_delayMicroseconds")
(:arguments (micros ffi:uint64))
(:language :stdc)
(:library "libbcm2835.so"))
)
