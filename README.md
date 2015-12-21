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

- Run `ECL` script `load-bcm2835.lisp` to load the package (do this:compile `bcm2835.lisp` and get the file `bcm2835.fas`, load "bcm2835.fas")   
```
(load "load-bcm2835.lisp")   
```

##  Run a single function in REPL

### Check the version of bcm2835 library
```
(rpi:bcm-version)
```

##  Run examples
```
(load "./examples/blink.lisp)
```


##  Enjoy it!   

Functions can be used in ECL:
```
(rpi:bcm-version)
(rpi:bcm-init)                                                               
(rpi:gpio-fsel pin mode)                                           
(rpi:gpio-write pin on)                                            
(rpi:gpio-lev pin)                                                       
(rpi:gpio-set pin)                                                      
(rpi:gpio-clr pin)                                                       
(rpi:bcm-delay millis)                                                   
(rpi:bcm-delay-microseconds micros)                                      
(rpi:bcm-close)
```
Parameters:
```
pin = rpi:RPI_GPIO_P1_11 or rpi:RPI_V2_GPIO_P1_11
mode = BCM2835_GPIO_FSEL_OUTP
on = rpi:HIGH or rpi:LOW
millis: a number which type is unsighed-int in ECL
micros: a number which type is uint64 in ECL
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
- 执行 `ECL` 脚本 `load-bcm2835.lisp` 来加载包 (这个脚本做了这些工作: 编译 `bcm2835.lisp` 得到文件 `bcm2835.fas`, 最后加载 "bcm2835.fas")   
```
(load "load-bcm2835.lisp")   
```

##  在 REPL 中执行一个函数

### 查看 bcm2835 库的版本信息
```
(rpi:bcm-version)
```

##  运行例程
```
(load "./examples/blink.lisp)
```

##  享受劳动成果!

然后你就可以使用这些函数了

```
(rpi:bcm-version) ;;返回值为无符号整型
(rpi:bcm-init) ;;成功返回1, 失败返回0                                                               
(rpi:gpio-fsel pin mode)  ;;返回值为空                                           
(rpi:gpio-write pin on)  ;;返回值为空                               
(rpi:gpio-lev pin)  ;;返回值为8位整型                                                       
(rpi:gpio-set pin)  ;;返回值为空                                      
(rpi:gpio-clr pin)  ;;返回值为                                           
(rpi:bcm-delay millis)  ;;返回值为空                                            
(rpi:bcm-delay-microseconds micros)  ;;返回值为空                                      
(rpi:bcm-close)  ;;成功返回1, 失败返回0 
```

函数输入参数说明:
```
pin = 树莓派1使用形如 rpi:RPI_GPIO_P1_11, 树莓派2使用形如 rpi:RPI_V2_GPIO_P1_11
mode = BCM2835_GPIO_FSEL_OUTP
on = rpi:HIGH 或 rpi:LOW
millis: 数字, ECL 中的无符号整型
micros: 数字, ECL 中的无符号64位整型
```


##  参考

https://github.com/raspi-gpio-newlisp   

https://gist.github.com/chomy/003deea83b5a13ad1ee3
