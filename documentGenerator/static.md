


# Luat 扩展库

## adc

------

### adc.open()

打开对应ID的ADC通道

- 语法

  `result = adc.open( id )`

- 参数

  | 参数 | 释义      |
  | ---- | --------- |
  | id   | adc通道id |

- 返回值

  1：成功打开adc通道

  0：其他

- 例子

```lua
--adc id
local ADC_ID = 0
--打开adc
adc.open(ADC_ID)
```

------

### adc.read()

读取原始测量数据和电压值，电压值单位为mv

- 语法

  `adcValue,voltValue = adc.read( id )`

- 参数

  | 参数 | 释义      |
  | ---- | --------- |
  | id   | adc通道id |

- 返回值

  | adcValue      | 原始数据ad值，无效值为0xFFFF         |
  | ------------- | ------------------------------------ |
  | **voltValue** | **电压值，单位为mv，无效值为0xFFFF** |

- 例子

```lua
--adcval为number类型，表示adc的原始值，无效值为0xFFFF
--voltval为number类型，表示转换后的电压值，单位为毫伏，无效值为0xFFFF；adc.read接口返回的voltval放大了3倍，所以需要除以3还原成原始电压
local adcval,voltval = adc.read(ADC_ID)
```

-----

### adc.colse()

关闭adc

* 语法

  `adc.close(id)`

* 参数

  | 参数 | 释义     |
  | ---- | -------- |
  | id   | adc id号 |

* 返回值

  无



------

## apn

apn 读取库

------



### apn.get_default_apn()

通过mcc和mnc获取到默认apn

- 语法

`apn,user,password = apn.get_default_apn( mcc,mnc )`

- 参数

| 参数 | 释义         |
| ---- | ------------ |
| mcc  | 手机国家编码 |
| mnc  | 手机网络编码 |

- 返回值

| **apn **      | apn名字    |
| ------------- | ---------- |
| **user **     | **用户名** |
| **password ** | **密码**   |

------



### audiocore

音频操作接口

------



### audiocore.play()

播放音乐

- 语法

`ret = audiocore.play( filename )`

- 参数

| 参数     | 释义       |
| -------- | ---------- |
| filename | 音频文件名 |

- 返回值

  true:播放成功

  false:播放失败

------



### audiocore.stop()

停掉正在播放的音频

- 语法

`audiocore.stop()`

- 参数

  无

- 返回值

  无

------



### audiocore.setchannel()

设置音频播放通道

- 语法

  ` result = audiocore.setchannel( channel )`

- 参数

  | channel | 音频播放通道（可选参数见下列表）                             |
  | ------- | ------------------------------------------------------------ |
  |         | **audiocore.HANDSET 、 audiocore.EARPIECE 、 audiocore.LOUDSPEAKER 、audiocore.BLUETOOTH 、 audiocore.FM 、 audiocore.FM_LP 、 audiocore.TV 、audiocore.AUX_HANSET 、 audiocore.AUX_LOUDSPEAKER 、audiocore.AUX_EARPIECE 、 audiocore.DUMMY_HANDSET 、audiocore.DUMMY_AUX_HANDSET 、 audiocore.DUMMY_LOUDSPEAKER 、audiocore.DUMMY_AUX_LOUDSPEAKER** |
  |         |                                                              |

### audiocore.setvol()

设置音频播放音量大小

- 语法

  `result = audiocore.setvol( vol )`

- 参数



| vol  | 音频播放器音量（可选参数见下列表）                           |
| ---- | ------------------------------------------------------------ |
|      | **audiocore. VOL0、 audiocore. VOL1、 audiocore. VOL2、 audiocore. VOL3、 audiocore. VOL4、audiocore. VOL5、 audiocore. VOL6、 audiocore. VOL7** |

- 返回值

  1:成功

  0:其他

### audiocore.setmicvol()

设置麦克风音量

- 语法

  `result = audiocore.setmicvol( vol )`

- 参数

  | 参数 | 释义                                                         |
  | ---- | ------------------------------------------------------------ |
  | vol  | 麦克风音量（可选参数见下列表）                               |
  |      | audiocore.MIC_VOL0、audiocore. MIC_VOL1、audiocore. MIC_VOL2、audiocore.MIC_VOL3、audiocore. MIC_VOL4、audiocore. MIC_VOL5、audiocore. MIC_VOL6、audiocore. MIC_VOL7 、 audiocore.MIC_VOL8 、 audiocore.MIC_VOL9 、audiocore.MIC_VOL10 、 audiocore.MIC_VOL11 、 audiocore.MIC_VOL12 、audiocore.MIC_VOL13、audiocore.MIC_VOL14、audiocore.MIC_VOL15 |

- 返回值

  1:成功

  0:其他

------

### audiocore.setloopback()

设置通道指定的环回测试

- 语法

  `result = audiocore.setloopback( status,channel )`

- 参数

  | 参数    | 释义                                                         |
  | ------- | ------------------------------------------------------------ |
  | status  | 1开启回环测试，0关闭回环测试                                 |
  | channel | 音频通道（可选参数见下列表）                                 |
  |         | audiocore. LOOPBACK_HANDSET 、 audiocore. LOOPBACK_EARPIECE 、 audiocore.LOOPBACK_LOUDSPEAKER 、 audiocore. LOOPBACK_AUX_HANDSET 、 audiocore.LOOPBACK_AUX_LOUDSPEAKER |

- 返回值

  1:成功

  0:其他

------

## bit

位操作库

------



### bit.bit()

左移运算，等价于C语言中的1 << position

- 语法

  `number = bit.bit( position )`

- 参数

  | 参数     | 释义           |
  | -------- | -------------- |
  | position | 需要移位的位置 |

- 返回值

  移位运算后的值

- 例子

```lua
print(bit.bit(2))--参数是位数，作用是1向左移动两位，打印出4
```

------



### bit.isset()

测试位数是否被置1

- 语法

  `flag = bit.isset( value, position )`

- 参数

  | 参数     | 释义         |
  | -------- | ------------ |
  | value    | 被测试的值   |
  | position | 被测试的位置 |

- 返回值

  true:该位被置1

  false:其他

- 例子

```lua
print(bit.isset(5,0))--第一个参数是是测试数字，第二个是测试位置。从右向左数0到7。是1返回true，否则返回false，该返回true
print(bit.isset(5,1))--打印false
print(bit.isset(5,2))--打印true
print(bit.isset(5,3))--返回返回false
```

------



### bit.isclear()

测试位数是否被置0

- 语法

  `flag = bit.isclear( value, position )`

- 参数

  | 参数     | 释义         |
  | -------- | ------------ |
  | value    | 被测试的值   |
  | position | 被测试的位置 |

- 返回值

  true:该位被置0

  false:其他

- 例子

```lua
print(bit.isclear(5,0))--与上面的相反
print(bit.isclear(5,1))
print(bit.isclear(5,2))
print(bit.isclear(5,3))
```

------



### bit.set()

置1

- 语法

  `number = bit.set( value, pos1, pos2, ..., posn )`

- 参数

  | 参数  | 释义                 |
  | ----- | -------------------- |
  | value | 基数（需要改变的值） |
  | pos1  | 第一位置             |
  | pos2  | 第二位置             |
  | posn  | 第n位置              |

- 返回值

  置1之后的值

- 例子

```lua
print(bit.set(0,0,1,2,3))--在相应的位数置1，打印15
```

------



### bit.clear()

置0

- 语法

  `number = bit.clear( value, pos1, pos2, ..., posn )`

- 参数

  | 参数  | 释义                 |
  | ----- | -------------------- |
  | value | 基数（需要改变的值） |
  | pos1  | 第一位置             |
  | pos2  | 第二位置             |
  | posn  | 第n位置              |

- 返回值

  置0之后的值

- 例子

```lua
print(bit.clear(5,0,2)) --在相应的位置置0，打印0
```

------



### bit.bnot()

取反，等价于C语言中的~

- 语法

  `number = bit.bnot( value )`

- 参数

  | 参数  | 释义         |
  | ----- | ------------ |
  | value | 需要取反的值 |

- 返回值

  取反之后的值

- 例子

```lua
print(bit.bnot(5))--按位取反，输出-6
```

------



### bit.band()

与运算，等价于Ｃ语言中的val1 & val2 & ... & valn

- 语法

  ` number = bit.band( val1, val2, ... valn )`

- 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | val1 | 第一个参数 |
  | val2 | 第二个参数 |
  | valn | 第n个参数  |

- 返回值

  与运算之后的结果

- 例子

```lua
print(bit.band(1,1))--与,--输出1
```

------



### bit.bor()

或运算，等价于C里面的val1 | val2 | ... | valn

- 语法

  `number = bit.bor( val1, val2, ... valn )`

- 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | val1 | 第一个参数 |
  | val2 | 第二个参数 |
  | valn | 第n个参数  |

- 返回值

  或运算之后的结果

- 例子

```lua
print(bit.bor(1,2))--或，--输出3
```

------



### bit.bxor()

异或运算，等价于C语言中的val1 ^ val2 ^ ... ^ valn

- 语法

  `number = bit.bxor( val1, val2, ... valn )`

- 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | val1 | 第一个参数 |
  | val2 | 第二个参数 |
  | valn | 第n个参数  |

- 返回值

  异或运算之后的结果

- 例子

```lua
print(bit.bxor(1,2))--异或,相同为0，不同为1
```

------



### bit.lshift()

逻辑左移，等价于C语言中的value << shift

- 语法

  `number = bit.lshift( value, shift )`

- 参数

  | 参数  | 释义       |
  | ----- | ---------- |
  | value | 移位的值   |
  | shift | 移位的位置 |

- 返回值

  逻辑左移之后的结果

- 例子

```lua
print(bit.lshift(1,2))--逻辑左移，“100”，输出为4
```

------



### bit.rshift()

逻辑右移，等价于C语言中的value >> shift

- 语法

  `number = bit.rshift( value, shift )`

- 参数

  | 参数  | 释义       |
  | ----- | ---------- |
  | value | 移位的值   |
  | shift | 移位的位置 |

- 返回值

  逻辑右移之后的结果

- 例子

```lua
print(bit.rshift(4,2))--逻辑右移，“001”，输出为1
```

------



### bit.arshift()

算数右移

- 语法

  `number = bit.arshift( value, shift )`

- 参数

  | 参数  | 释义       |
  | ----- | ---------- |
  | value | 移位的值   |
  | shift | 移位的位置 |

- 返回值

  算术右移之后的结果

- 例子

```lua
print(bit.arshift(2,2))--算数右移，左边添加的数与符号有关，输出为0
```

------

## crypto

常见加密，校验算法

------

### crypto.aes_encrypt()

aes算法（参考http://tool.chacuo.net/cryptaes）

* 语法

  `crypto.aes_encrypt(mode,padding,originStr,password)`

* 参数

  | 参数      | 释义       |
  | --------- | ---------- |
  | mode      | 加密模式   |
  | padding   | 填充方式   |
  | originStr | 加密字符串 |
  | password  | 密钥       |

* 返回值

  已加密的字符串

* 例子

```lua
--下面示例为LuaTask的，如果需要LuaScript的，请参考LuaScript crypto demo
local originStr = "AES128 ECB ZeroPadding test"
--加密模式：ECB；填充方式：ZeroPadding；密钥：1234567890123456；密钥长度：128 bit
local encodeStr = crypto.aes_encrypt("ECB","ZERO",originStr,"1234567890123456")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","ZERO",encodeStr,"1234567890123456"))
originStr = "AES128 ECB Pkcs5Padding test"
--加密模式：ECB；填充方式：Pkcs5Padding；密钥：1234567890123456；密钥长度：128 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS5",originStr,"1234567890123456")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS5",encodeStr,"1234567890123456"))
originStr = "AES128 ECB Pkcs7Padding test"
--加密模式：ECB；填充方式：Pkcs7Padding；密钥：1234567890123456；密钥长度：128 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS7",originStr,"1234567890123456")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS7",encodeStr,"1234567890123456"))
originStr = "AES192 ECB ZeroPadding test"
--加密模式：ECB；填充方式：ZeroPadding；密钥：123456789012345678901234；密钥长度：192 bit
local encodeStr = crypto.aes_encrypt("ECB","ZERO",originStr,"123456789012345678901234")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","ZERO",encodeStr,"123456789012345678901234"))
originStr = "AES192 ECB Pkcs5Padding test"
--加密模式：ECB；填充方式：Pkcs5Padding；密钥：123456789012345678901234；密钥长度：192 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS5",originStr,"123456789012345678901234")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS5",encodeStr,"123456789012345678901234"))
originStr = "AES192 ECB Pkcs7Padding test"
--加密模式：ECB；填充方式：Pkcs7Padding；密钥：123456789012345678901234；密钥长度：192 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS7",originStr,"123456789012345678901234")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS7",encodeStr,"123456789012345678901234"))
originStr = "AES256 ECB ZeroPadding test"
--加密模式：ECB；填充方式：ZeroPadding；密钥：12345678901234567890123456789012；密钥长度：256 bit
local encodeStr = crypto.aes_encrypt("ECB","ZERO",originStr,"12345678901234567890123456789012")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","ZERO",encodeStr,"12345678901234567890123456789012"))
originStr = "AES256 ECB Pkcs5Padding test"
--加密模式：ECB；填充方式：Pkcs5Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS5",originStr,"12345678901234567890123456789012")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS5",encodeStr,"12345678901234567890123456789012"))
originStr = "AES256 ECB Pkcs7Padding test"
--加密模式：ECB；填充方式：Pkcs7Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit
encodeStr = crypto.aes_encrypt("ECB","PKCS7",originStr,"12345678901234567890123456789012")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("ECB","PKCS7",encodeStr,"12345678901234567890123456789012"))
originStr = "AES128 CBC ZeroPadding test"
--加密模式：CBC；填充方式：ZeroPadding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CBC","ZERO",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","ZERO",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES128 CBC Pkcs5Padding test"
--加密模式：CBC；填充方式：Pkcs5Padding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS5",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS5",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES128 CBC Pkcs7Padding test"
--加密模式：CBC；填充方式：Pkcs7Padding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS7",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS7",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES192 CBC ZeroPadding test"
--加密模式：CBC；填充方式：ZeroPadding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CBC","ZERO",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","ZERO",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES192 CBC Pkcs5Padding test"
--加密模式：CBC；填充方式：Pkcs5Padding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS5",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS5",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES192 CBC Pkcs7Padding test"
--加密模式：CBC；填充方式：Pkcs7Padding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS7",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS7",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES256 CBC ZeroPadding test"
--加密模式：CBC；填充方式：ZeroPadding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CBC","ZERO",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","ZERO",encodeStr,"12345678901234567890123456789012","1234567890666666"))
originStr = "AES256 CBC Pkcs5Padding test"
--加密模式：CBC；填充方式：Pkcs5Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS5",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS5",encodeStr,"12345678901234567890123456789012","1234567890666666"))
originStr = "AES256 CBC Pkcs7Padding test"
--加密模式：CBC；填充方式：Pkcs7Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CBC","PKCS7",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CBC","PKCS7",encodeStr,"12345678901234567890123456789012","1234567890666666"))
originStr = "AES128 CTR ZeroPadding test"
--加密模式：CTR；填充方式：ZeroPadding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CTR","ZERO",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","ZERO",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES128 CTR Pkcs5Padding test"
--加密模式：CTR；填充方式：Pkcs5Padding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS5",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS5",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES128 CTR Pkcs7Padding test"
--加密模式：CTR；填充方式：Pkcs7Padding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS7",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS7",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES128 CTR NonePadding test"
--加密模式：CTR；填充方式：NonePadding；密钥：1234567890123456；密钥长度：128 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","NONE",originStr,"1234567890123456","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","NONE",encodeStr,"1234567890123456","1234567890666666"))
originStr = "AES192 CTR ZeroPadding test"
--加密模式：CTR；填充方式：ZeroPadding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CTR","ZERO",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","ZERO",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES192 CTR Pkcs5Padding test"
--加密模式：CTR；填充方式：Pkcs5Padding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS5",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS5",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES192 CTR Pkcs7Padding test"
--加密模式：CTR；填充方式：Pkcs7Padding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS7",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS7",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES192 CTR NonePadding test"
--加密模式：CTR；填充方式：NonePadding；密钥：123456789012345678901234；密钥长度：192 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","NONE",originStr,"123456789012345678901234","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","NONE",encodeStr,"123456789012345678901234","1234567890666666"))
originStr = "AES256 CTR ZeroPadding test"
--加密模式：CTR；填充方式：ZeroPadding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
local encodeStr = crypto.aes_encrypt("CTR","ZERO",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","ZERO",encodeStr,"12345678901234567890123456789012","1234567890666666"))
originStr = "AES256 CTR Pkcs5Padding test"
--加密模式：CTR；填充方式：Pkcs5Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS5",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS5",encodeStr,"12345678901234567890123456789012","1234567890666666"))

originStr = "AES256 CTR Pkcs7Padding test"
--加密模式：CTR；填充方式：Pkcs7Padding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","PKCS7",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","PKCS7",encodeStr,"12345678901234567890123456789012","1234567890666666"))

originStr = "AES256 CTR NonePadding test"
--加密模式：CTR；填充方式：NonePadding；密钥：12345678901234567890123456789012；密钥长度：256 bit；偏移量：1234567890666666
encodeStr = crypto.aes_encrypt("CTR","NONE",originStr,"12345678901234567890123456789012","1234567890666666")
print(originStr,"encrypt",string.toHex(encodeStr))
log.info("testCrypto.decrypt",crypto.aes_decrypt("CTR","NONE",encodeStr,"12345678901234567890123456789012","1234567890666666"))
```



------

### crypto.crc16()

CRC16校验算法

- 语法

  `crypto.crc16(crcMethod,originstr)`

- 参数

  | 参数      | 释义                         |
  | --------- | ---------------------------- |
  | crcMethod | string类型， 校验方法        |
  | originstr | string类型，计算校验的字符串 |

- 返回值

  校验计算结果

- 例子

```lua
local originStr = "sdfdsfdsfdsffdsfdsfsdfs1234"
print("testCrypto.crc16_MODBUS",string.format("%04X",crypto.crc16("MODBUS",originStr)))
print("testCrypto.crc16_IBM",string.format("%04X",crypto.crc16("IBM",originStr)))
print("testCrypto.crc16_X25",string.format("%04X",crypto.crc16("X25",originStr)))
print("testCrypto.crc16_MAXIM",string.format("%04X",crypto.crc16("MAXIM",originStr)))
print("testCrypto.crc16_USB",string.format("%04X",crypto.crc16("USB",originStr)))
print("testCrypto.crc16_CCITT",string.format("%04X",crypto.crc16("CCITT",originStr)))
print("testCrypto.crc16_CCITT-FALSE",string.format("%04X",crypto.crc16("CCITT-FALSE",originStr)))
print("testCrypto.crc16_XMODEM",string.format("%04X",crypto.crc16("XMODEM",originStr)))
print("testCrypto.crc16_DNP",string.format("%04X",crypto.crc16("DNP",originStr)))
```

![crc](../img/crc.png)

-----


### crypto.xxtea_encrypt()

xxtea加密算法

* 语法

  `crypto.xxtea_encrypt(text,key)`

* 参数

  | 参数 | 释义                     |
  | ---- | ------------------------ |
  | text | string类型，待加密字符串 |
  | key  | string类型，密钥         |

* 返回值

  加密/解密数据

* 例子

```lua
local text = "Hello World!";
local key = "07946";
local encrypt_data = crypto.xxtea_encrypt(text, key);
print("testCrypto.xxteaTest","xxtea_encrypt:"..encrypt_data)
local decrypt_data = crypto.xxtea_decrypt(encrypt_data, key);
print("testCrypto.xxteaTest","decrypt_data:"..decrypt_data)
```

-------

### crypto.crc32()

CRC32校验算法

- 语法

  `crypto.crc32(originstr,len)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要校验的字符串 |
  | len       | number类型，字符串长度        |

- 返回值

  校验计算结果

- 例子

```lua
local originstr = "sdfdsfdsfdsffdsfdsfsdfs1234"
print("crc32",string.format("%08X",crypto.crc32(originstr,slen(originstr))))
--crc32	2FC153F9
```

------

### crypto.sha256()

sha256算法

* 语法

  `crypto.sha256(originStr)`

* 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originStr | string类型， 需要加密的字符串 |

* 返回值

  加密后的数据

* 例子

```lua
local originStr = "sdfdsfdsfdsffdsfdsfsdfs1234"
print("testCrypto.sha256",crypto.sha256(originStr))
```



-----

### crypto.sha1()

sha1算法

- 语法

  `crypto.sha1(originstr,len)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要加密的字符串 |
  | len       | number类型，字符串长度        |

- 返回值

  加密后的数据

- 例子

```lua
local originstr = "sdfdsfdsfdsffdsfdsfsdfs1234"
print("sha1",crypto.sha1(originstr,slen(originstr)))
-- sha1	16EBE919119B9B54C8AF6B4F2A09C18B6B6D8218
```

------

### crypto.hmac_sha1()

hmac_sha1算法

- 语法

  `hmac_sha1(originstr,len_str,signkey,len_key)`

- 参数

  | 参数      | 释义                        |
  | --------- | --------------------------- |
  | originstr | string类型， 需要加密的数据 |
  | len_str   | number类型，字符串长度      |
  | signkey   | string类型， 密钥           |
  | len_key   | number类型， 密钥长度       |

- 返回值

  加密后的数据

- 例子

```lua
local originstr = "asdasdsadasweqcdsjghjvcb"
local signkey = "12345689012345"
print("hmac_sha1",crypto.hmac_sha1(originstr,slen(originstr),signkey,slen(signkey)))
--hmac_sha1	E3BB109BA59AF6A1F677157E8EC6B21349B9220F
```

------

### crypto.flow_md5()

流式md5算法

* 语法

  `crypto.flow_md5()`

* 参数

  无

* 返回值

  无

* 例子

```lua
local fmd5Obj=crypto.flow_md5()
local testTable={"lqlq666lqlq946","07946lq94607946","lq54075407540707946"}
for i=1, #(testTable) do
    fmd5Obj:update(testTable[i])
end
print("testCrypto.flowMd5Test",fmd5Obj:hexdigest())
```



------

### crypto.md5()

md5算法，支持计算文件的md5值

- 语法

  `crypto.md5(originstr,len)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要加密的字符串 |
  | len       | number类型，字符串长度        |

- 返回值

  加密后的数据

- 例子

```lua
local originstr = "sdfdsfdsfdsffdsfdsfsdfs1234"
print("md5",crypto.md5(originstr,slen(originstr)))
--md5	235B69FBC9E75C4FD5E8C59F9CB16500
```

------

### crypto.hmac_md5()

hmac_md5算法测试

- 语法

  `crypto.hmac_md5(originstr,len_str,signkey,len_key)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要加密的字符串 |
  | len_str   | number类型，字符串长度        |
  | signkey   | string类型， 密钥             |
  | len_key   | number类型， 密钥长度         |

- 返回值

  加密后的数据

- 例子

```lua
local originstr = "asdasdsadas"
local signkey = "123456"
print("hmac_md5",crypto.hmac_md5(originstr,slen(originstr),signkey,slen(signkey)))
-- hmac_md5	38A7B18DC5F6543849DC49F06FADE3CC
```

------

### crypto.base64_encode()

base64加密

- 语法

  `crypto.base64_encode(originstr,len)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要加密的字符串 |
  | len       | number类型，字符串长度        |

- 返回值

  加密后的数据

- 例子

```lua
local originstr = "123456"
local encodestr = crypto.base64_encode(originstr,slen(originstr))
print("base64_encode",encodestr)
--base64_encode	MTIzNDU2
```

------

### crypto.base64_decode()

base64解密

- 语法

  `crypto.base64_decode(originstr,len)`

- 参数

  | 参数      | 释义                          |
  | --------- | ----------------------------- |
  | originstr | string类型， 需要加密的字符串 |
  | len       | number类型，字符串长度        |

- 返回值

  解密后的数据

- 例子

```lua
print("base64_decode",crypto.base64_decode(encodestr,slen(encodestr)))
-- base64_decode	123456
```

------

## disp

lcd显示

------

### disp.init()

初始化显示接口语法

- `disp.init(param)`

- 参数

  param：显示参数，table类型，包含：

  | 参数        | 释义                                                         |
  | ----------- | ------------------------------------------------------------ |
  | width       | 分辨率宽度                                                   |
  | height      | 分辨率高度                                                   |
  | bpp         | 位深度，目前支持16位色彩屏（bpp=16）黑白屏（bpp=1）          |
  | xoffset     | x偏移，不设置该域则默认0                                     |
  | yoffset     | y偏移，不设置该域则默认0                                     |
  | freq        | spi时钟频率，支持110K到13M（即110000到13000000）之间的整数（包含110000和13000000） |
  | hwfillcolor | 填充色                                                       |
  | pinrst      | reset，复位引脚                                              |
  | pincs       | 命令/数据选择引脚                                            |
  | initcmd     | 初始化指令表                                                 |

- 返回值

  无

------

### disp.puttext()

显示字符串

- 语法

  `disp.puttext(str,x,y)`

- 参数

  | 参数 | 释义                     |
  | ---- | ------------------------ |
  | str  | string类型，显示的字符串 |
  | x    | number类型，x轴坐标      |
  | y    | number类型，y轴坐标      |

- 返回值

  无

- 例子

```lua
disp.puttext("欢迎使用Luat",16,0) --从坐标16,0位置开始显示"欢迎使用Luat"
```

------

### disp.clear()

清除缓冲区内容，注意不会刷新到屏幕上，只有在update时才会执行刷屏动作

- 语法

  `disp.clear()`

- 参数

  无

- 返回值

  无

------

### disp.update()

将缓冲区内容刷新到屏幕上

- 语法

  `disp.update()`

- 参数

  无

- 返回值

  无

------

### disp.putimage()

在坐标(x,y)处显示图片，目前仅支持bmp和png格式，这个接口只会将显示数据写到缓冲区，只有在执行了update了以后才会真正的刷屏。最后面的四个参数是规定了从file中截取某一部分区域

- 语法

  `disp.putimage(file,x,y,transcolor,left,top,right,bottom)`

- 参数

  | 参数       | 释义                                           |
  | ---------- | ---------------------------------------------- |
  | file       | 图片路径                                       |
  | x          | 显示起始横坐标x（此参数可选，默认为0）         |
  | y          | 显示起始横坐标y（此参数可选，默认为0）         |
  | transcolor | 透明色（此参数可选，默认为-1，表示没有透明色） |
  | left       | 截取区域左上角横坐标（此参数可选，默认为0）    |
  | top        | 截取区域左上角纵坐标（此参数可选，默认为0）    |
  | right      | 截取区域右下角横坐标（此参数可选，默认为0）    |
  | bottom     | 截取区域右下角纵坐标（此参数可选，默认为0）    |

- 返回值

  无

------

### disp.drawrect()

绘制矩形，并且填充颜色。填充色可以自行设置也可不填充颜色值格式RGB565。

- 语法

  `disp.drawrect(left,top,right,bottom,color)`

- 参数

  | 参数   | 释义                                                         |
  | ------ | ------------------------------------------------------------ |
  | left   | 矩形框左上角横坐标                                           |
  | top    | 矩形框左上角纵坐标                                           |
  | right  | 矩形框右下角横坐标                                           |
  | bottom | 矩形框右下角纵坐标                                           |
  | color  | 矩形框填充色（此参数可选，默认为-1，不填充颜色。需要填充颜色自行设置颜色值） |

- 返回值

  无

------

### disp.setcolor()

设置前景色

- 语法

  `disp.setcolor(color)`

- 参数

  | 参数  | 释义                                            |
  | ----- | ----------------------------------------------- |
  | color | 颜色值,以rgb565填充红绿蓝为0xF800 0x07E0 0x001F |

- 返回值

  无

------

### disp.setbkcolor()

设置背景色

- 语法

  `disp.setbkcolor(color)`

- 参数

  | 参数  | 释义                                            |
  | ----- | ----------------------------------------------- |
  | color | 颜色值,以rgb565填充红绿蓝为0xF800 0x07E0 0x001F |

- 返回值

  无

------

### disp.loadfont()

加载字体

- 语法

  `fontid=disp.loadfont(path)`

- 参数

  | 参数 | 释义         |
  | ---- | ------------ |
  | path | 字体文件路径 |

- 返回值

  fontid-返回加载后的字体id 用于setfont设置字体

------

### disp.setfont()

设置字体

- 语法

  `oldfontid=disp.setfont(fontid)`

- 参数

  | 参数   | 释义   |
  | ------ | ------ |
  | fontid | 字体id |

- 返回值

  oldfontid-返回旧的字体id

------

### disp.sleep()

休眠显示模块

- 语法

  `disp.sleep()`

- 参数

  无

- 语法

  无

----

### disp.getlcdinfo()

获取LCD分辨率的宽度和高度(单位是像素)

* 语法

  `disp.getlcdinfo() `

* 参数

  无

* 返回值

  WIDTH ：宽度<br>

  HEIGHT : 高度

----

### disp.putqrcode()

显示二维码

* 语法

  `disp.putqrcode(data, width, display_width, x, y) `

* 参数

  | 参数          | 释义                              |
  | ------------- | --------------------------------- |
  | data          | 从qrencode.encode返回的二维码数据 |
  | width         | 二维码数据的实际宽度              |
  | display_width | 二维码实际显示宽度                |
  | x             | 二维码显示起始坐标x               |
  | y             | 二维码显示起始坐标y               |

* 返回值

  无

-----

## json

json编译解析

------

### json.encode()

json编译

- 语法

  `json.encode(torigin)`

- 参数

  | 参数    | 释义                      |
  | ------- | ------------------------- |
  | torigin | table类型，待编译的源字符 |

- 返回值

  json格式字符串

- 例子

```lua
local torigin =
{
    KEY1 = "VALUE1",
    KEY2 = "VALUE2",
    KEY3 = "VALUE3",
    KEY4 = "VALUE4",
    KEY5 = {KEY5_1="VALU5_1",KEY5_2="VALU5_2"},
    KEY6 = {1,2,3},
}

local jsondata = json.encode(torigin)
--[[
{"KEY3":"VALUE3","KEY4":"VALUE4","KEY2":"VALUE2","KEY1":"VALUE1","KEY5":{"KEY5_2":"VALU5_2","KEY5_1":"VALU5_1"}},"KEY6":[1,2,3]}
]]
```

------

### json.decode()

json解析

- 语法

  `json.decode(origin)`

- 参数

  | 参数   | 释义               |
  | ------ | ------------------ |
  | origin | 待解析的json字符串 |

- 返回值

  解析内容，table类型

  解析结果，true为成功，false为失败

  错误信息

- 例子

```lua
-- 正确json字符串
local wrongOrigin = "{\":\"VALUE3\",\"KEY4\":\"VALUE4\",\"KEY2\":\"VALUE2\",\"KEY1\":\"VALUE1\",\"KEY5\":{\"KEY5_2\":\"VALU5_2\",\"KEY5_1\":\"VALU5_1\"},\"KEY6\":[1,2,3]}"
local origin = "{\"KEY3\":\"VALUE3\",\"KEY4\":\"VALUE4\",\"KEY2\":\"VALUE2\",\"KEY1\":\"VALUE1\",\"KEY5\":{\"KEY5_2\":\"VALU5_2\",\"KEY5_1\":\"VALU5_1\"},\"KEY6\":[1,2,3]}"
local tjsondata,result,errinfo = json.decode(origin)
if result then
    print(tjsondata["KEY1"])
    print(tjsondata["KEY2"])
    print(tjsondata["KEY3"])
    print(tjsondata["KEY4"])
    print(tjsondata["KEY5"]["KEY5_1"],tjsondata["KEY5"]["KEY5_2"])
    print(tjsondata["KEY6"][1],tjsondata["KEY6"][2],tjsondata["KEY6"][3])
else
	print("json.decode error",errinfo)
end
--origin：正确输出
--wrongOrigin：json.decode error	Expected colon but found invalid token at character 5
```

------

## i2c

i2c 操作接口

### i2c.setup()

打开i2c接口

- 语法

  ` speed = i2c.setup( id, speed [,slaveaddr] )`

- 参数

  | 参数      | 释义                                         |
  | --------- | -------------------------------------------- |
  | id        | i2c 接口 id，目前支持 i2c id=2 即模块的 I2C3 |
  | speed     | i2c.FAST (400KHz), i2c.SLOW (100KHz)         |
  | slaveaddr | 可选，i2c 外设地址 0x00-0x7f                 |

- 返回值

  可以根据返回的频率值判断是否成功打开 i2c

- 例子

```lua
--使用i2c.send和i2c.recv的setup
if i2c.setup(i2cid,i2c.SLOW) ~= i2c.SLOW then
  print("init fail")
  return
end

--使用i2c.write和i2c.read的setup
if i2c.setup(i2cid,i2c.SLOW,i2cslaveaddr) ~= i2c.SLOW then
  print("init1 fail")
  return
end
```



------

### i2c.send()

向从设备写数据

- 语法

  `wrote = i2c.send( id,slave, data )`

- 参数

  | 参数  | 释义                                                         |
  | ----- | ------------------------------------------------------------ |
  | id    | i2c接口id，目前支持 i2c id=2 即模块的i2c3                    |
  | slave | i2c 外设地址 0x00-0x7f                                       |
  | data  | number / string / table，自动根据参数类型写数据，num 只写 1 个字节，string/table |

- 返回值

  传输成功的字节数

- 例子

```lua
local cmd,i = {0x1B,0x00,0x6A,0x01,0x1E,0x20,0x21,0x04,0x1B,0x00,0x1B,0xDA,0x1B,0xDA}
for i=1,#cmd,2 do
  --向从设备i2cslaveaddr发送寄存器地址cmd[i]
  i2c.send(i2cid,i2cslaveaddr,cmd[i])
  --向从设备i2cslaveaddr发送要写入从设备寄存器内的数据cmd[i+1]
  i2c.send(i2cid,i2cslaveaddr,cmd[i+1])
end
```

------

### i2c.recv()

向从设备读取数据

- 语法

  `i2c.recv( id, slave,size )`

- 参数

  | 参数  | 释义                                      |
  | ----- | ----------------------------------------- |
  | id    | i2c接口id，目前支持 i2c id=2 即模块的i2c3 |
  | slave | i2c 外设地址 0x00-0x7f                    |
  | size  | 读取数据字节数                            |

- 返回值

  返回读取的数据，二进制数据会包含非可见字符，请使用 string.byte 打印数据流

- 例子

```lua
--向从设备i2cslaveaddr发送寄存器地址cmd[i]
i2c.send(i2cid,i2cslaveaddr,cmd[i])
--读取从设备i2cslaveaddr寄存器内的1个字节的数据，并且打印出来
print("testI2c.init",string.format("%02X",cmd[i]),string.toHex(i2c.recv(i2cid,i2cslaveaddr,1)))
```

------

### i2c.write()

往指定的寄存器地址 reg 传输数据

- 语法

  ` wrote = i2c.write( id, reg, data )`

- 参数

  | 参数 | 释义                                                         |
  | ---- | ------------------------------------------------------------ |
  | id   | i2c接口id，目前支持 i2c id=2 即模块的i2c3                    |
  | reg  | 写入 i2c 从设备的寄存器起始地址                              |
  | data | number / string / table，自动根据参数类型写数据，num 只写 1 个字节，string/table |

- 返回值

  传输成功的字节数

- 例子

```lua
local cmd,i = {0x1B,0x00,0x6A,0x01,0x1E,0x20,0x21,0x04,0x1B,0x00,0x1B,0xDA,0x1B,0xDA}
for i=1,#cmd,2 do
  --向从设备的寄存器地址cmd[i]中写1字节的数据cmd[i+1]
  i2c.write(i2cid,cmd[i],cmd[i+1])
end
```



------



### i2c.read()

读取指定寄存器地址 reg 的数据内容

- 语法

  ` data = i2c.read( id, reg, num )`

- 参数

  | 参数 | 释义                                      |
  | ---- | ----------------------------------------- |
  | id   | i2c接口id，目前支持 i2c id=2 即模块的i2c3 |
  | reg  | 读取 i2c 从设备的寄存器起始地址           |
  | num  | 读取数据字节数                            |

- 返回值

  返回读取的数据，二进制数据会包含非可见字符，请使用 string.byte 打印数据流

- 例子

```lua
--从从设备的寄存器地址cmd[i]中读1字节的数据，并且打印出来
    local cmd,i = {0x1B,0x00,0x6A,0x01,0x1E,0x20,0x21,0x04,0x1B,0x00,0x1B,0xDA,0x1B,0xDA}
    for i=1,#cmd,2 do
        --向从设备的寄存器地址cmd[i]中写1字节的数据cmd[i+1]
        i2c.write(i2cid,cmd[i],cmd[i+1])
        --从从设备的寄存器地址cmd[i]中读1字节的数据，并且打印出来
        print("testI2c.init1",string.format("%02X",cmd[i]),string.toHex(i2c.read(i2cid,cmd[i],1)))
    end
```



------



### i2c.close()

关闭 I2C 接口

- 语法

  ` speed = i2c.close( id )`

- 参数

  | 参数 | 释义                                      |
  | ---- | ----------------------------------------- |
  | id   | i2c接口id，目前支持 i2c id=2 即模块的i2c3 |

- 返回值

  无

------

## pack

pack 库支持将一系列数据按照格式字符转化为 lua 字符串或者将 lua 字符串按照格式字符转化成
一系列值

格式字符串格式如下:

[endianness]< format specifier >[count]

endianness：字节序

- '<' 小字节序，最低有效字节优先，更低的字节有效位占据着更低地址的内存空间。
- '>' 大字节序，最高有效字节优先，更高的字节有效位占据着更低地址的内存空间。
- '=' 自然字节序，默认。

format specifier：参照下面格式化符号

count：取字节个数

| 格式化符号 | 变量类型                                   |
| ---------- | ------------------------------------------ |
| 'z'        | 以'\0'结尾的字符串                         |
| 'p'        | 在string数据前面加一个字节的string长度数据 |
| 'P'        | 在string数据前面加2个字节的string长度数据  |
| 'a'        | 在string数据前面加4个字节的string长度数据  |
| 'A'        | 字符串(string)                             |
| 'f'        | 浮点数(float)                              |
| 'd'        | 双精度浮点数(double)                       |
| 'n'        | Lua数字(Lua number)                        |
| 'c'        | 字符(char)                                 |
| 'b'        | 字节(byte = unsigned char)                 |
| 'h'        | 短整型(short，两字节)                      |
| 'H'        | 无符号短整型(unsigned short，两字节)       |
| 'i'        | 整型(int，四字节)                          |
| 'I'        | 无符号整型(unsigned int，四字节)           |
| 'l'        | 长整型(long，八字节)                       |
| 'L'        | 无符号长整型(unsigned long，八字节)        |

------



### pack.pack()

打包字符串的值,在pack的时候有符号 无符号的输出结果都是一样的 unpack时有符号跟无符号才有区别

- 语法

  `packed = pack.pack( format, val1, val2, ..., valn )`

- 参数

  | 参数   | 释义             |
  | ------ | ---------------- |
  | format | 格式化符号       |
  | val1   | 第一个需打包的值 |
  | val2   | 第二个需打包的值 |
  | valn   | 第n个需打包的值  |

- 返回值

  一个包含所有格式化变量的字符串

- 例子

```lua
print("pcak.pack test：")
print(pack.pack("A",10))--当"10"以字符串形式包装时，会打印出“10”
print(common.binstohexs(pack.pack("b",0x10)))--将0x01以十六进制打包为字符串，然后用十六进制输出0x10
print(pack.pack("A","LUAT"))
```

------

### pack.unpack()

解包字符串

- 语法

  `nextpos, val1, val2, ..., valn = pack.unpack( string, format,[ init ] )`

- 参数

  | 参数         | 释义                          |
  | ------------ | ----------------------------- |
  | string       | 需解包的字符串                |
  | format       | 格式化符号                    |
  | init（可选） | 默认值为1，标记解包开始的位置 |

- 返回值

  | nextpos  | 字符串标记的位置   |
  | -------- | ------------------ |
  | **val1** | **第一个解包的值** |
  | **val2** | **第二个解包的值** |
  | **valn** | **第n个解包的值**  |

- 例子

```lua
print("pack.unpack test:")
nextpox1,val1,val2,val3,val4=pack.unpack("luat100","c4")--"nextpos"下个待解析的位置	，取4个字符(char)
print(nextpox1,val1,val2,val3,val4)        --分别对应的是"5"，l","u","a","t"的ascii码数据
print(string.char(val1,val2,val3,val4))    --将ascii码数据转化为字符输出
nextpox2,string1=pack.unpack("luat100","A4")--输出“luat”
print(nextpox2,string1)--输出5 luat
nextpox3,number1,number2=pack.unpack(common.hexstobins("006400000064"),">H>i")--[[输出无符号短型和整形,因为无符号短型是2个字节，整形是4个字节,输出为100,100--]]
print(nextpox3,number1,number2)--输出7 100 100
nextpox3,number1=pack.unpack(common.hexstobins("0064"),">h")--输出为100，因为短型是2个字节
print(nextpox3,number1)--输出3 100
```

------

## pio

管脚操作

### pio.pin.setdir()

设置管脚的描述

- 语法

  `pio.pin.setdir( direction,pin1,pin2,...,pinn)`

- 参数

  | 参数       | 释义                                            |
  | ---------- | ----------------------------------------------- |
  | direction  | 管脚描述，可选pio.INPUT ， pio.OUTPUT， pio.INT |
  | pin1       | 第一个管脚                                      |
  | pin2(可选) | 第二个管脚                                      |
  | pinn(可选) | 第n个管脚                                       |

- 返回值

  无

------



### pio.pin.setval()

设置管脚的值

- 语法

  `pio.pin.setval(value,pin1,pin2,...,pinn)`

- 参数

  | 参数         | 释义             |
  | ------------ | ---------------- |
  | value        | 管脚值，可选0或1 |
  | pin1         | 第一个管脚       |
  | pin2（可选） | 第二个管脚       |
  | pinn(可选)   | 第n个管脚        |

- 返回值

  无

------



### pio.pin.getval()

读取管脚的值

- 语法

  `val1, val2, ..., valn = pio.pin.getval( pin1, pin2, ..., pinn )`

- 参数

  | 参数       | 释义       |
  | ---------- | ---------- |
  | pin1       | 第一个管脚 |
  | pin2(可选) | 第二个管脚 |
  | pinn(可选) | 第n个管脚  |

- 返回值

  number类型，0表示低电平，1表示高电平

------



### pio.pin.sethigh()

设置管脚为高电平(1)

- 语法

  `pio.pin.sethigh(pin1,pin2,...,pinn)`

- 参数

  | 参数       | 释义       |
  | ---------- | ---------- |
  | pin1       | 第一个管脚 |
  | pin2(可选) | 第二个管脚 |
  | pinn(可选) | 第n个管脚  |

- 返回值

  无

------



### pio.pin.setlow()

设置管脚为低电平(0)

- 语法

  `pio.pin.setlow(pin1,pin2,...,pinn)`

- 参数

  | 参数       | 释义       |
  | ---------- | ---------- |
  | pin1       | 第一个管脚 |
  | pin2(可选) | 第二个管脚 |
  | pinn(可选) | 第n个管脚  |

- 返回值

  无

----

### pio.pin.setpull()

配置IO口默认状态

* 语法

  `pio.pin.setpull(method,pin)`

* 参数

  | 参数   | 释义                                                         |
  | ------ | ------------------------------------------------------------ |
  | method | pio.PULLUP：上拉模式 。pio.PULLDOWN：下拉模式。pio.NOPULL：高阻态 |
  | pin    | 配置管脚                                                     |

* 返回值

  无

* 例子

```lua
pio.pin.setpull(pio.PULLUP,pio.P0_5)  --配置为上拉
--pio.pin.setpull(pio.PULLDOWN,pio.P0_5)  --配置为下拉
--pio.pin.setpull(pio.NOPULL,pio.P0_5)  --不配置上下拉
```



------

## pmd

电源管理接口:ldo 控制,省电管理



------



### pmd.init()

设置电源管理参数 <br>
电池充电控制,3 阶段电流充电:<br>
一阶段：电压低于 battlevelFirst 充电电流为 currentFirst<br>
二阶段：电压高于 battlevelFirst 低于 battlevelSecond 充电电流为 currentSecond<br>
三阶段：电压高于 battlevelSecond 至充满 4.25v 充电电流为 currentThird<br>

- 语法

  `result = pmd.init( param )`

- 参数

  | 参数  | 释义                                                         |
  | ----- | ------------------------------------------------------------ |
  | param | 参数表,电流有效值:50,100,150,200,300,400,500,600,700,800 电压值以mV为单位，可选值为下 |
  |       | param.currentFirst - 电池电压小于一阶段电压值时的充电电流</br>param.battlevelFirst - 一阶段电压值节点</br>param.currentSecond - 电池电压大于一阶段电压值小于二阶段电压值时的充电电流</br>param.battlevelSecond - 二阶段电压值节点</br>param.currentThird - 电池电压大于二阶段电压值时的充电电流 |

- 返回值

  1:成功

  0:失败

------



### pmd.ldoset()

ldo 控制

电压域与控制的GPIO的对应关系如下：<br>

pmd.LDO_VMMC：GPIO8、GPIO9、GPIO10、GPIO11、GPIO12、GPIO13 <br>
pmd.LDO_VLCD：GPIO14、GPIO15、GPIO16、GPIO17、GPIO18<br>
pmd.LDO_VCAM：GPIO19、GPIO20、GPIO21、GPIO22、GPIO23、GPIO24<br>

一旦设置了某一个电压域的电压等级，受该电压域控制的所有GPIO的高电平都与设置的电压等级一致

- 语法

  `pmd.ldoset(level,id1,[id2],...,[idn])`

- 参数

  | 参数      | 释义                                                         |
  | --------- | ------------------------------------------------------------ |
  | level     | ldo 亮度 0 - 7 级 0 级关闭 <br>0--关闭<br>1--1.8V<br>2--1.9V<br>3--2.0V<br>4--2.6V<br>5--2.8V<br>6--3.0V<br>7--3.3V |
  | id1       | 要设置的第一个 ldo                                           |
  | id2(可选) | 要设置的第 二 个 ldo                                         |
  | idn(可选) | 要设置的第 n 个 ldo                                          |

- 返回值

  无

- 例子

```lua
--GPIO8输出电平时，要求输出2.8V，则调用
pmd.ldoset(5,pmd.LDO_VMMC)
```



------



### pmd.sleep()

省电控制

- 语法

  `pmd.sleep(value)`

- 参数

  | 参数  | 释义                       |
  | ----- | -------------------------- |
  | value | 1 - 进入睡眠，0 - 退出睡眠 |

- 返回值

  无

------

## qrencode

二维码数据

### qrencode.encode ()

创建二维码信息

* 语法

  `qrencode.encode(string)`

* 参数

  | 参数   | 释义         |
  | ------ | ------------ |
  | string | 二维码字符串 |

* 返回值

  width 生成的二维码信息宽度 <br>

  data 生成的二维码数据

* 例子

```lua
 local width, data = qrencode.encode("http://www.openluat.com")
```

----

## rtos

嵌入式系统接口:接收消息,软件定时器

------

### rtos.receive()

接收消息

- 语法

  `msg,msgpara = rtos.receive(timeout)`

- 参数

  | 参数    | 释义                                                         |
  | ------- | ------------------------------------------------------------ |
  | timeout | timeout 超时返回以毫秒为单位，可以用#rtos.INF_TIMEOUT#表示阻塞等待消息 |

- 返回值

  如果 msg 为 table 类型，msg 根据不同的消息 msg.id 会有不同的数据：

  如果 msg 为 number 类型，msg 根据不同的消息 msg 会有不同的数据

  1.rtos.MSG_TIMER 定时器超时消息
  msg.timer_id 或者 msgpara 为超时的定时器 id

  2.rtos.MSG_UART_RXDATA 串口 ATC 数据提醒
  msg.uart_id 或者msgpara为收到的数据的串口id或者atc,收到该消息后可以通过uart.read
  接口读取数据

  3.rtos.MSG_KEYPAD 键盘消息,必须初始化按键(#rtos.init_module#)后才会有键盘消息

  msg.pressed 按键按下/弹起

  msg.key_matrix_row 按键所在行值

  msg.key_matrix_col 按键所在列值

  4.rtos.WAIT_MSG_TIMEOUT 等待消息超时

  5.rtos.MSG_INT 中断消息

  msg.int_id 中断 id

  msg.int_resnum 中断 pin 脚编号

  6.rtos.MSG_PMD 电源管理消息

  msg.present 电池在位状态

  msg.level 百分比 0-100

  msg.voltage 电池电压

  msg.charger 充电器在位状态

  msg.state 充电状态:0-不在充电 1-充电中 2-充电停止

------

### rtos.timer_start()

启动定时器

- 语法

  `rtos.timer_start(timer_id, timeout)`

- 参数

  | 参数     | 释义                                                         |
  | -------- | ------------------------------------------------------------ |
  | timer_id | 定时器 id,可以是任意整数,定时器到时 msg.timer_id 值为启动时定时器 |
  | timeout  | 定时器延时时间以毫秒为单位                                   |

- 返回值

  无

------



### rtos.timer_stop()

停止定时器

- 语法

  `rtos.timer_stop(timer_id)`

- 参数

  | 参数     | 释义                                       |
  | -------- | ------------------------------------------ |
  | timer_id | 输入与启动定时器时定义的 id 即可停止定时器 |

- 返回值

  无

------



### rtos.poweron_reason()

读取开机原因值

- 语法

  `reason=rtos.poweron_reason()`

- 参数

  无

- 返回值

  | rtos. POWERON_KEY(=0)           | 按键开机                  |
  | ------------------------------- | ------------------------- |
  | **rtos. POWERON_CHARGER(=1)**   | **充电开机**              |
  | **rtos. POWERON_ALARM(=2)**     | **闹钟开机**              |
  | **rtos. POWERON_RESTART(=3)**   | **软件重启开机**          |
  | **rtos. POWERON_EXCEPTION(=6)** | **异常开机**              |
  | **rtos. POWERON_HOST(=7)**      | **HOST 工具控制重启开机** |
  | **rtos. POWERON_WATCHDOG(=8)**  | **其他原因**              |

------



### rtos.poweron()

是否启动 GSM 开机

- 语法

  `rtos.poweron(flag)`

- 参数

  | 参数 | 释义                             |
  | ---- | -------------------------------- |
  | flag | 0 表示不启动系统；1 表示启动系统 |

- 返回值

  无

------



### rtos.poweroff()

软件关机

- 语法

  `rtos.poweroff()`

- 参数

  无

- 返回值

  无

------



### rtos.restart()

软件重启

- 语法

  ` rtos.restart()`

- 参数

  无

- 返回值

  无

------



### rtos.tick()

获取系统开机运行时间总计数

- 语法

  `ticks=rtos.tick()`

- 参数

  无

- 返回值

  ticks，时间计数，每 tick 时长1/16384秒

------



### rtos.sleep()

延时函数

- 语法

  `rtos.sleep(millisecond)`

- 参数

  | 参数        | 释义                    |
  | ----------- | ----------------------- |
  | millisecond | 延时时间 ，以毫秒为单位 |

- 返回值

  无

------



### rtos.get_env_usage()

获取 lua 任务消息队列的使用百分比

- 语法

  `percentage=rtos.get_env_usage()`

- 参数

  无

- 返回值

  percentage，百分比，例如使用了 80%，则 percentage 为 80

------

### rtos.set_alarm()

设置闹钟，在设置之前必须注册闹钟模块和注册消息回调函数

- 语法

  `rtos.set_alarm(mode,year,month,day,hour,min,sec)`

- 参数

  | 参数  | 释义                      |
  | ----- | ------------------------- |
  | mode  | 1：设置闹铃 ，0：清除闹铃 |
  | year  | number类型，年            |
  | month | number类型，月            |
  | day   | number类型，日            |
  | hour  | number类型，时            |
  | min   | number类型，分            |
  | sec   | number类型，秒            |

- 返回值

  无

- 例子

```lua
rtos.init_module(rtos.MOD_ALARM) --注册闹铃模块
sys.regmsg(rtos.MSG_ALARM,alarmmsg) --注册消息回调函数
rtos.set_alarm(1, 2017, 12, 7, 10, 52, 0) --设置闹铃
--闹钟时间 2017-17-7 10:52:0
rtos.set_alarm(0, 0, 0, 0, 0, 0, 0)  --关闭闹铃

--闹钟开机
local reason = rtos.poweron_reason()
if reason == rtos.POWERON_ALARM then
	rtos.restart()-- 闹钟开机以后重启不然注册不上GSM协议栈
end

```

------

### rtos.make_dir()

创建目录

- 语法

  `rtos.make_dir(path)`

- 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | path | 文件夹路径 |

- 返回值

  布尔值

  true表示创建成功，false表示失败

------

### rtos.remove_dir()

删除文件夹

- 语法

  `rtos.remove_dir(path)`

- 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | path | 文件夹路径 |

- 返回值

  true表示删除成功，false表示失败

------

### rtos.get_fs_free_size()

获取文件系统剩余空间

- 语法

  `rtos.get_fs_free_size()`

- 参数

  无

- 返回值

  文件系统剩余空间，单位Bytes

------


## spi

spi 操作接口

------



### spi.setup

- 语法

  `spi.setup(id,chpa,cpol,dataBits,clock,duplexMode)`

- 参数

  | 参数     | 释义                                                         |
  | -------- | ------------------------------------------------------------ |
  | id       | SPI的ID，spi.SPI_1表示SPI1，Air201、Air202、Air800只有SPI1，固定传spi.SPI_1即可 |
  | chpa     | 第几个clk的跳变沿传输数据，仅支持0和1，0表示第1个，1表示第2个。 |
  | cpol     | spi_clk idle的状态，仅支持0和1，0表示低电平，1表示高电平     |
  | dataBits | 数据位，仅支持8                                              |
  | clock    | spi时钟频率，支持110K到13M（即110000到13000000）之间的整数（包含110000和13000000） |
  | duplex   | 是否全双工，仅支持0和1，0表示半双工（仅支持输出），1表示全双工。此参数可选，默认半双工 |

- 返回值

  number类型，1表示成功，0表示失败

------

### spi.send()

写数据

- 语法

  `spi.send(id,data)`

- 参数

  | 参数 | 释义                                                         |
  | ---- | ------------------------------------------------------------ |
  | id   | SPI的ID，spi.SPI_1表示SPI1，Air201、Air202、Air800只有SPI1，固定传spi.SPI_1即可 |
  | data | string类型，要发送的数据                                     |

- 返回值

  number类型，写成功的数据长度

------

### spi.recv()

读数据

- 语法

  `spi.recv(id,length)`

- 参数

  | 参数   | 释义                                                         |
  | ------ | ------------------------------------------------------------ |
  | id     | SPI的ID，spi.SPI_1表示SPI1，Air201、Air202、Air800只有SPI1，固定传spi.SPI_1即可 |
  | length | 要读取的数据的长度                                           |

- 返回值

  string类型，读取的数据内容

-----

### spi.send_recv()

读写数据

* 语法

  `spi.send_recv(id,data)`

* 参数

  | 参数 | 释义                                                         |
  | ---- | ------------------------------------------------------------ |
  | id   | SPI的ID，spi.SPI_1表示SPI1，Air201、Air202、Air800只有SPI1，固定传spi.SPI_1即可 |
  | data | string类型，要发送的数据                                     |

* 返回值

  string类型，读取的数据内容

-----

### spi.close()

关闭SPI

* 语法

  `spi.close(id)`

* 参数

  | 参数 | 释义                       |
  | ---- | -------------------------- |
  | id   | SPI的ID，spi.SPI_1表示SPI1 |

* 返回值

  number类型，1表示成功，0表示失败

------


## uart

uart 与虚拟 AT 交互接口

------



### uart.setup()

uart通讯

- 语法

  `baud = uart.setup( id, baud, databits, parity, stopbits,[msgmode,txDoneReport] )`

- 参数

  | 参数         | 释义                                                         |
  | ------------ | ------------------------------------------------------------ |
  | id           | 串口号，可选0,1,2                                            |
  | baud         | 波特率，可选1200，2400，4800，9600，10400，14400，19200，28800，38400，57600，115200，230400，460800，921600 |
  | databits     | 数据位，7或8                                                 |
  | parity       | 校验位，可选uart.PAR_EVEN, uart.PAR_ODD或uart.PAR_NONE       |
  | stopbits     | 停止位，可选uart.STOP_1，uart.STOP_2                         |
  | msgmode      | 0 或者默认 - 消息通知，1 - 无消息上报需要用户主动轮询        |
  | txDoneReport | txdone消息上报开关。0：关闭，1：打开                         |

- 返回值

  串口的真实波特率

------

### uart.write()

向串口写字符串或者整型数据

- 语法

  `uart.write( id, data1, [data2], ..., [datan] )`

- 参数

  | 参数        | 释义                      |
  | ----------- | ------------------------- |
  | id          | 串口号，可选0,1,2         |
  | data1       | 第一个字符串或8位整型数据 |
  | data2       | 第二个字符串或8位整型数据 |
  | datan(可选) | 第n个字符串或8位整型数据  |

- 返回值

  无

------



### uart.getchar()

从串口读取单字符

- 语法

  `str = uart.getchar( id )`

- 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | id   | 串口号，可选0,1,2 |

- 返回值

  串口读出来的字符

------



### uart.read()

从串口读取字符串

- 语法

  `str = uart.read( id, format)`

- 参数

  | 参数   | 释义                                                         |
  | ------ | ------------------------------------------------------------ |
  | id     | 串口号                                                       |
  | 格式化 | \*l：读取到结束字符\n或者阻塞发送<br/>  \*n：读取整型数据<br/>  \*s：读取到空格字符<br/> 数字，number类型：只读取number长度的数据 |

- 返回值

  串口读出到的数据

------

### uart.set_rs485_oe()

* 语法

    `uart.set_rs485_oe(id, io[, level])`

* 参数

    | 参数  | 释义                                                         |
    | ----- | ------------------------------------------------------------ |
    | id    | 串口id                                                       |
    | io    | GPIO值 pio.Pxx                                               |
    | level | 输出使能电平有效值，默认1，配置为1时表示高电平发送，配置为0时表示低电平发送 |

* 返回值

    无

* 例子

```lua
uart.setup(UART_ID,115200,8,uart.PAR_NONE,uart.STOP_1,nil,1) --必须先使用setup，并且最后一个参数是1（打开发送完成后的通知功能）
uart.set_rs485_oe(UART_ID, pio.P2_0) --仅4G 0013版本之后支持

```



------



### uart.close()

关闭 uart 接口

- 语法

  `uart.close(id)`

- 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | id   | 串口号，可选0,1,2 |

- 返回值

  无

------

# Lua 标准库

## io

### io.open()

这个函数用字符串mode 指定的模式打开一个文件。

* 语法

  `io.open(filename [, mode])`

* 参数

  | 参数     | 释义                                                         |
  | -------- | ------------------------------------------------------------ |
  | filename | string，文件名                                               |
  | mode     | string，可选<br>"r"：读模式（默认）；<br>"w"：写模式；<br>"a"：追加模式<br>"r+"：更新模式，所有之前的数据都保留<br>"w+"： 更新模式，所有之前的数据都删除； <br>"a+"： 追加更新模式，所有之前的数据都保留，只允许在文件尾部做写入。 |

* 返回值

  返回新的文件句柄。 当出错时，返回 nil加错误消息。

* 例子

```lua
file = io.open("test.lua", "r")
```

----

### file:close()

关闭文件句柄

* 语法

  `file:close()`

* 参数

  无

* 返回值

  无

-----

### file:flush()

向文件写入缓冲中的所有数据

* 语法

  `file:flush()`

* 参数

  无

* 返回值

  无

----

### file:read()

读文件file， 指定的格式决定了要读什么。

* 语法

  `file:read(...)`

* 参数

  | 参数     | 释义                                                         |
  | -------- | ------------------------------------------------------------ |
  | "*n"     | 读取一个数字，根据 Lua 的转换文法，可能返回浮点数或整数。 （数字可以有前置或后置的空格，以及符号。） 只要能构成合法的数字，这个格式总是去读尽量长的串； 如果读出来的前缀无法构成合法的数字 （比如空串，"`0x`" 或 "`3.4e-`"）， 就中止函数运行，返回 nil。 |
  | "*a"     | 从当前位置开始读取整个文件。 如果已在文件末尾，返回空串。    |
  | "*l"     | 读取一行并忽略行结束标记。 当在文件末尾时，返回nil这是默认格式。 |
  | "number" | 读取一个不超过这个数量字节数的字符串。 当在文件末尾时，返回nil。如果number为零， 它什么也不读，返回一个空串。 当在文件末尾时，返回nil。 |

* 返回值

  对于每种格式，函数返回读出的字符对应的字符串或数字。 若不能以该格式对应读出数据则返回nil

* 例子

```lua
local file = io.open("test.txt", "r")
print(file:read("*l"))  --this is test 1
print(file:read("*n"))  --nil
print(file:read(2))  --th
```

-----

### file:seek()

设置和获取当前文件位置。

* 语法

  `file:seek([whence][,offset]) `

* 语法

  | 参数   | 释义                                                         |
  | ------ | ------------------------------------------------------------ |
  | whence | 可选 。 <br>"set": 从文件头开始 <br>"cur": 从当前位置开始[默认] <br>"end": 从文件尾开始 |
  | offset | offset                                                       |

* 返回值

  成功则返回最终的文件位置(按字节),失败则返回nil加错误信息

* 例子

```lua
local file = io.open("test.txt", "r+")
print(file:seek("end"))		--30
print(file:seek("set"))		--0
print(file:seek())	        --0
print(file:seek("cur", 10))		--10
print(file:seek("cur"))		--10
print(file:read(1))			--s
print(file:seek("cur"))		--11
file:close()
```

-----

### file:write ()

将参数的值逐个写入file。

* 语法

  `file:write (...)`

* 参数

  | 参数 | 释义                                                         |
  | ---- | ------------------------------------------------------------ |
  | ...  | 参数必须是字符串或数字, 要输出其它值，则需通过tostring或string.format进行转换 |

* 返回值

  成功时，函数返回 file。 否则返回nil加错误描述字符串。



-----



## math

基本的数学函数，**注意！只有带FLOAT的LOD有数学库，其他LOD不能使用数学库**

------

### math.abs()

计算绝对值

* 语法

  `math.abs(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回x的绝对值。

----

### math.acos()

计算反余弦值

* 语法

  `math.acos(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回x的反余弦值（用弧度表示）。

-----

### math.asin()

计算反正弦值

* 语法

  `math.asin(X)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回x的反正弦值（用弧度表示）。

----

### math.atan()

计算反正切值

* 语法

  `math.atan(y[,x])`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | y    | integer/float类型 |
  | x    | 默认x为1          |

* 返回值

  返回 y/x 的反正切值（用弧度表示）。

----

### math.ceil()

计算最小整数值

* 语法

  `math.ceil(x)`

* 参数

  | 参数 | 释义    |
  | ---- | ------- |
  | x    | integer |

* 返回值

  返回不小于 x 的最小整数值。

-----

### math.cos()

计算余弦值

* 语法

  `math.cos(x)`

* 参数

  | 参数 | 释义   |
  | ---- | ------ |
  | x    | 弧度值 |

* 返回值

  返回 x 的余弦

---

### math.deg()

弧度转换为角度

* 语法

  `math.deg(x)`

* 参数

  | 参数 | 释义   |
  | ---- | ------ |
  | x    | 弧度值 |

* 返回值

  返回转换后的角度值

----

### math.exp()

计算 *ex* （*e*为自然对数的底 ）的值

* 语法

  `math.exp(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

   *ex* （e 为自然对数的底 ）的值

-----

### math.floor()

计算不大于 x 的最大整数值。

* 语法

  `math.floor(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回不大于 x 的最大整数值。

------

### math.fmod()

计算 x 除以 y，将商向零圆整后的余数

* 语法

  `math.fmod(x,y)`

* 参数

  | 参数 | 释义                      |
  | ---- | ------------------------- |
  | x    | integer/float类型，除数   |
  | y    | integer/float类型，被除数 |

* 返回值

  返回 x 除以 y，将商向零圆整后的余数。

------

### math.huge

浮点数 HUGE_VAL， 这个数比任何数字值都大。

* 语法

  `math.huge`

* 参数

  无

* 返回值

  无

-----

### math.log()

计算指定底的 x 的对数。 默认的 base 是 *e* （因此此函数返回 x 的自然对数）。

* 语法

  `math.log(x[,base])`

* 参数

  | 参数 | 释义            |
  | ---- | --------------- |
  | x    | 指数            |
  | base | 底数，默认为*e* |

* 返回值

  返回以指定底的 x 的对数

----

### math.max()

计算参数中最大的值， 大小由 Lua 操作 < 决定。

* 语法

  `math.max(x,...)`

* 参数

  | 参数 | 释义                                  |
  | ---- | ------------------------------------- |
  | x    | integer/float类型                     |
  | ...  | integer/float类型，不定参数，多个数值 |

* 返回值

  返回参数中最大的值

-----

### math.min()

返回参数中最小的值， 大小由 Lua 操作 < 决定。

* 语法

  `math.min(x,...)`

* 参数

  | 参数 | 释义                                  |
  | ---- | ------------------------------------- |
  | x    | integer/float类型                     |
  | ...  | integer/float类型，不定参数，多个数值 |

* 返回值

  返回参数中最小的值。

----

### math.maxinteger

最大值的整数。

* 语法

  `math.maxinteger`

* 参数

  无

* 返回值

  无

----

### math.mininteger

最小值的整数。

* 语法

  `math.mininteger`

* 参数

  无

* 返回值

  无

-----

### math.modf()

计算 x 的整数部分和小数部分。

* 语法

  `math.modf(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回 x 的整数部分和小数部分。 第二个结果一定是浮点数。

-----

### math.pi

*π* 的值。

* 语法

  `math.pi`

* 参数

  无

* 返回值

  无

-------

### math.rad()

将角 x 从角度转换为弧度。

* 语法

  `math.rad(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  角 x 从角度转换为弧度值

-----

### math.random()

随机数

* 语法

  `math.random([m[,n]])`

* 参数

  | 参数 | 释义             |
  | ---- | ---------------- |
  | m    | 随机数的左边界值 |
  | n    | 随机数的右边界值 |

* 返回值

  当不带参数调用时， 返回一个 [0,1) 区间内一致分布的浮点伪随机数。 <br>当以两个整数 m 与 n调用时， math.random返回一个 [m, n]区间 内一致分布的整数伪随机数。 （值 *m-n* 不能是负数，且必须在 Lua 整数的表示范围内。） <br>调用 math.random(n) 等价于 math.random(1,n)。

-----

### math.randomseed()

把 x设为伪随机数发生器的“种子”： 相同的种子产生相同的随机数列。

* 语法

  `math.randomseed(x)`

* 参数

  | 参数 | 释义       |
  | ---- | ---------- |
  | x    | 随机数种子 |

* 返回值

  无

----

### math.sin()

计算x正弦值（假定参数是弧度）

* 语法

  `math.sin(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回 x 的正弦值

------

### math.sqrt()

计算x平方根

* 语法

  `math.sqrt(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回 x 的平方根。

-----

### math.tan()

计算 x 的正切值，（假定参数是弧度）

* 语法

  `math.tan(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  返回 x 的正切值

----

### math.tointeger()

将参数转换为整数

* 语法

  `math.tointeger(x)`

* 参数

  | 参数 | 释义      |
  | ---- | --------- |
  | x    | float类型 |

* 返回值

  如果 x可以转换为一个整数， 返回该整数。 否则返回 nil。

------

### math.type()

判断数字类型

* 语法

  `math.type(x)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | x    | integer/float类型 |

* 返回值

  如果 x 是整数，返回 "integer"， 如果它是浮点数，返回 "float"， 如果 x 不是数字，返回 nil。

---------

### math.ult()

数值比较

* 语法

  `math.ult(m,n)`

* 参数

  | 参数 | 释义              |
  | ---- | ----------------- |
  | m    | integer/float类型 |
  | n    | integer/float类型 |

* 返回值

  整数 m 和 n 以无符号整数形式比较， m 在 n 之下，返回布尔真否则返回假。

----

## string

字符串操作库

-----

### string.upper()

字符串全部转为大写字母

* 语法

  `string.upper(s)`

* 参数

  | 参数 | 释义                 |
  | ---- | -------------------- |
  | s    | string，待转换字符串 |

* 返回值

  大写字母字符串

-----

### string.lower()

字符串全部转为小写字母

* 语法

  `string.lower(s)`

* 参数

  | 参数 | 释义                 |
  | ---- | -------------------- |
  | s    | string，待转换字符串 |

* 返回值

  小写字母字符串

-------

### string.gsub()

字符串替换

* 语法

  `string.gsub(s,pattern,repl[,n])`

* 参数

  | 参数    | 释义         |
  | :------ | ------------ |
  | s       | 替换的字符串 |
  | pattern |              |
  |         |              |
  |         |              |









-----

### string.find()

查找第一个字符串 s 中匹配到的 pattern

* 语法

  `string.find(s,pattern[,init[,plain]])`

* 参数

  | 参数    | 释义                                                         |
  | ------- | ------------------------------------------------------------ |
  | s       | 目标字符串                                                   |
  | pattern | 匹配字符                                                     |
  | init    | 可选，搜索初始位置                                           |
  | plain   | 可选，当参数为 true时， 关闭模式匹配机制。 此时函数仅做直接的 “查找子串”的操作 |

* 返回值

  返回匹配字符具体位置。不存在则返回 nil

* 例子

```lua
string.find("Hello Lua user", "Lua", 1)   --7   9
```

-------

### string.reverse()

字符串反转

* 语法

  `string.reverse(s)`

* 参数

  | 参数 | 释义                |
  | ---- | ------------------- |
  | s    | strng，待反转字符串 |

* 返回值

  反转后的字符串

* 例子

```lua
string.reverse("Luat")  --tauL
```

----

### string.format()

格式化字符串

* 语法

  `sting.format(formatString,...)`

* 参数

  | 参数         | 释义                          |
  | ------------ | ----------------------------- |
  | formatString | 格式化字符串                  |
  | ...          | 类似与C语言的printf中的占位符 |

* 返回值

  字符串

* 例子

```lua
string.format("the value is:%d",4)   --the value is:4
```

-----

### string.char()

接收ASCII码，返回对应的控制字符

* 语法

  `string.char(...)`

* 参数

  | 参数 | 释义          |
  | ---- | ------------- |
  | ...  | 多个ASCII码值 |

* 返回值

  字符

* 例子

```lua
string.char(97,98,99,100)   --abcd
```

-----

### string.byte()

接收控制字符，返回ASCII码

* 语法

  `string.byte(s[,int])`

* 参数

  | 参数 | 释义                    |
  | ---- | ----------------------- |
  | s    | 控制字符                |
  | int  | 可选，字符下标，默认为1 |

* 返回值

  ASCII码

* 例子

```lua
string.byte("ABCD")  --65
string.byte("ABCD",4) --68
```

-----

### string.len()

计算字符串长度

* 语法

  `string.len(s)`

* 参数

  | 参数 | 释义   |
  | ---- | ------ |
  | s    | 字符串 |

* 返回值

  字符串长度

* 例子

```lua
string.len("abc")  --3
```

-----

### string.rep()

字符串拷贝

* 语法

  `string.rep(s,n)`

* 参数

  | 参数 | 释义     |
  | ---- | -------- |
  | s    | 字符串   |
  | n    | 拷贝次数 |

* 返回值

  字符串

* 例子

```lua
string.rep("abcd",2)   --abcdabcd
```

-----

## table

表处理的通用函数

-----

### table.concat()

表连接

* 语法

  `table.concat(table [, sep [, start [, end]]])`

* 参数

  | 参数  | 释义          |
  | ----- | ------------- |
  | table | 指定表        |
  | sep   | 分隔符        |
  | start | table开始位置 |
  | end   | table结束位置 |

* 返回值

  字符串

* 例子

```lua
fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits))
--连接后的字符串     bananaorangeapple

-- 指定连接字符
print("连接后的字符串 ",table.concat(fruits,", "))
--连接后的字符串     banana, orange, apple

-- 指定索引来连接 table
print("连接后的字符串 ",table.concat(fruits,", ", 2,3))
--连接后的字符串     orange, apple
```

-----

### table.insert()

添加table参数

* 语法

  `table.insert(table, [pos,] value)`

* 参数

  | 参数  | 释义                       |
  | ----- | -------------------------- |
  | table | 指定表                     |
  | pos   | 可选，指定位置，默认为表尾 |
  | value | 插入值                     |

* 返回值

  table

* 例子

```lua
fruits = {"banana","orange","apple"}

-- 在末尾插入
table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])
--索引为 4 的元素为     mango

-- 在索引为 2 的键处插入
table.insert(fruits,2,"grapes")
print("索引为 2 的元素为 ",fruits[2])
--索引为 2 的元素为     grapes

print("最后一个元素为 ",fruits[5])
--最后一个元素为     mango
```

-----

### table.remove()

移除table参数

* 语法

  `table.remove(table[,pos])`

* 参数

  | 参数  | 释义                                    |
  | ----- | --------------------------------------- |
  | table | 指定表                                  |
  | pos   | 可选，table下标，默认从最后一个元素删起 |

* 返回值

  table

------








