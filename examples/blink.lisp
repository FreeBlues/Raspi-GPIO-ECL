#| blink.lisp
;; Example program for bcm2835 library
;; Blinks a pin on an off every 0.5 secs

|#

(defparameter pin rpi:RPI_V2_GPIO_P1_11)

(defun blink ()
  (if (= 1 (rpi:bcm-init))
    (progn
  	(rpi:gpio-fsel pin rpi:BCM2835_GPIO_FSEL_OUTP)
  	(rpi:gpio-write pin rpi:HIGH)
	(rpi:bcm-delay 500)
  	(rpi:gpio-write pin rpi:LOW)
  	(rpi:bcm-delay 500)
  	(rpi:bcm-close))
    (format t "bcm-init failed!")))
(blink)
