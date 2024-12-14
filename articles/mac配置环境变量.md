### 创建文件

```shell
sudo vim ~/.bash_profile
sudo vim ~/.zshrc
```

`.bash_profile` 文件的内容

```shell
# go 环境配置
export GOROOT=/usr/local/go
export GOPATH=/Users/starry/Work/GoWork
export GOBIN=/Users/starry/Work/GoWork/bin

# python 环境配置
alias pip=/Library/Frameworks/Python.framework/Versions/3.13/bin/pip3
alias python=/Library/Frameworks/Python.framework/Versions/3.13/bin/python3
```

`.zshrc`文件的内容

 ```shell
# 解决需要 source 才能使用的问题
source ~/.bash_profile
```