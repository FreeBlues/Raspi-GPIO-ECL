# Raspi-GPIO-ECL
A Raspberry Pi 2 GPIO library for ECL(Embedded Common Lisp)

##  Introduction

This lib provide a way to access Raspberry Pi 2 GPIO with Common Lisp

##  Needed 

At first, you need install ECL or other Common Lisp implemations, in this project I used [ECL]() 

##  Install

Get the `raspi-gpio-ecl.lisp` and load it with ECL

```
(load "raspi-gpio-ecl")
```

Then you can use your GPIO with the code:

```
(gpio:enable-pin 4)
```

##  Reference

raspi-gpio-newlisp
