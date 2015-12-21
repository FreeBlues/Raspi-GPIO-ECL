# Raspi-GPIO-ECL

A `Raspberry Pi` `GPIO` package for `ECL`(Embedded Common Lisp)

##  Introduction

This package provide a way to access `Raspberry Pi 2` `GPIO` with `Common Lisp`, now only few functions, the full version will support later.

##  Needed 

At first, you need to install `ECL`(Other `Common Lisp` implemations will be supported soon). 

Second, copy the `/libfile/libbcm2835.so` to your `/usr/lib` if you have not one in it.

##  Install

- Get the `bcm2835.lisp`    
```
git clone https://github.com/FreeBlues/Raspi-GPIO-ECL   
``` 

- Use `ECL` script `load-bcm2835.lisp` to load the package (do this:compile `bcm2835.lisp` and get the file `bcm2835.fas`, load "bcm2835.fas")   
```
(load "load-bcm2835.lisp")   
```
##  Run examples


##  Enjoy it!   

Then you can use the function:

```
(rpi:bcm-init)                                                               
(rpi:gpio-fsel pin-uint8 mode-uint8)                                           
(rpi:gpio-write pin-uint8 on-uint8)                                            
(rpi:gpio-lev pin-uint8)                                                       
(rpi:gpio-set pin-uint8)                                                      
(rpi:gpio-clr pin-uint8)                                                       
(rpi:bcm-delay millis-uint)                                                   
(rpi:bcm-delay-microseconds micros-uint64)                                      
(rpi:bcm-close)
```

##  Reference

https://github.com/raspi-gpio-newlisp   

https://gist.github.com/chomy/003deea83b5a13ad1ee3

---

# 中文说明

用于树莓派2下GPIO的一个ECL库

##  介绍

这个包提供了一种通过 `Common Lisp` 访问 `树莓派2`下 `GPIO` 的方法, 暂时只导出几个函数用于验证, 后续将补全.

##  依赖需要

首先, 需要在你的 `树莓派2` 上安装好 `ECL`, 对于其他 `Common Lisp` 实现的支持将会在后续完成.

##  安装

- 获取 `bcm2835.lisp` 
```
git clone https://github.com/FreeBlues/Raspi-GPIO-ECL
```

- 在 `ECL` 中使用 `compile-file` 命令编译 `bcm2835.lisp` 得到 `bcm2835.fas`
```
(compile-file "bcm2835.lisp")
```
- 在 `ECL` 中使用 `load` 命令加载 `bcm2835.fas`

```
(load "bcm2835.fas")
```

##  享受劳动成果!

然后你就可以使用这些函数了

```
(rpi:bcm-init)                                                               
(rpi:gpio-fsel pin-uint8 mode-uint8)                                           
(rpi:gpio-write pin-uint8 on-uint8)                                            
(rpi:gpio-lev pin-uint8)                                                       
(rpi:gpio-set pin-uint8)                                                      
(rpi:gpio-clr pin-uint8)                                                       
(rpi:bcm-delay millis-uint)                                                   
(rpi:bcm-delay-microseconds micros-uint64)                                      
(rpi:bcm-close)
```

##  参考

https://github.com/raspi-gpio-newlisp   

https://gist.github.com/chomy/003deea83b5a13ad1ee3
