# Raspi-GPIO-ECL

A `Raspberry Pi` `GPIO` package for `ECL`(Embedded Common Lisp), wrapped  [Mikem's BCM2835 library](http://www.airspayce.com/mikem/bcm2835)

##  Introduction

This package provide a way to access `Raspberry Pi` `GPIO` with `Common Lisp`, now only few functions, the full version will support later.

##  Needed 

- At first, you need to install `ECL`(Other `Common Lisp` implemations will be supported later). 

- Second, copy the `/libfile/libbcm2835.so` to your `/usr/lib` if you have not one in it.

##  Install

- Get the `bcm2835.lisp`    
```
git clone https://github.com/FreeBlues/Raspi-GPIO-ECL   
``` 

- Run `ECL` script `load-bcm2835.lisp` to load the package.   
```
(load "load-bcm2835.lisp")   
```

##  Run a single function in REPL

### Check the version of bcm2835 library
```
(rpi:bcm-version)

10048
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
mode = BCM2835_GPIO_FSEL_OUTP or
on = rpi:HIGH or rpi:LOW
millis: a number which type is unsighed-int in ECL
micros: a number which type is uint64 in ECL
```

##  Reference

http://www.airspayce.com/mikem/bcm2835

https://github.com/raspi-gpio-newlisp   

https://gist.github.com/chomy/003deea83b5a13ad1ee3

---

# 中文说明

用于`树莓派`下操作`GPIO`的一个`ECL`库, 用`ECL`封装了[Mikem 的 BCM2835 库](http://www.airspayce.com/mikem/bcm2835).

##  介绍

这个包提供了一种通过 `Common Lisp` 访问 `树莓派2`下 `GPIO` 的方法, 可以在 `ECL` 的`REPL`中直接操作`树莓派`的`GPIO`寄存器, 目前只导出少数几个函数用于验证, 后续将补全.

##  依赖需要

- 首先, 需要在你的 `树莓派`(同时支持`V1`和`V2`)上安装好 `ECL`, 目前只支持 `ECL`, 对于其他 `Common Lisp` 实现的支持将会在后续完成.
- 其次, 需要在你的`树莓派`上安装`BCM2835`库的动态版本(`libbcm2835.so`), 不过鉴于该库体积很小, 所以本项目就把`1.48`版的`libbcm2835.so`集成进去了, 放在 `./libfile/` 目录下, 可以直接使用. 

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

10048
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

http://www.airspayce.com/mikem/bcm2835

https://github.com/raspi-gpio-newlisp   

https://gist.github.com/chomy/003deea83b5a13ad1ee3
