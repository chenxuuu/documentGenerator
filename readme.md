# documentGenerator

[wiki.openluat.com](wiki.openluat.com) 接口文档自动生成工具

目标是完全ldoc注释格式

## 逻辑

C#将每个文件的每行全部放到table中，移交lua脚本处理，lua脚本处理完毕后将结果返回给C#，最后整理到一个markdown文件中。

## 已知问题

需要cd到工具目录进行文档自动生成操作，不然会报错

## 其他

如有问题，欢迎提交issue或进行pr
