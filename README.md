# Raspi-GPIO-ECL

A Raspberry Pi 2 GPIO library for ECL(Embedded Common Lisp)

##  Introduction

This lib provide a way to access Raspberry Pi 2 GPIO with Common Lisp

##  Needed 

At first, you need install ECL or other Common Lisp implemations, in this project I used [ECL](http://) 

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

https://github.com/raspi-gpio-newlisp

---

# 中文说明

用于树莓派2下GPIO的一个ECL库

##  介绍

这个库提供了一种通过 Common Lisp 访问树莓派2下GPIO的方法

##  依赖需要

首先, 需要在你的树莓派2上安装好 `ECL` 或者其他 `Common Lisp` 实现, 在本项目中使用了 [ECL](http://)

##  安装

Get the `raspi-gpio-ecl.lisp` and load it with ECL

```
(load "raspi-gpio-ecl")
```

Then you can use your GPIO with the code:

```
(gpio:enable-pin 4)
```

##  参考

https://github.com/raspi-gpio-newlisp
