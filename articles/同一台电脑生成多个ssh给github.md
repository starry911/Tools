在使用github中，一个ssh的公钥只能对应一个账户，所以需要在同一台电脑生成多个ssh密钥

```text
只需要生成密钥时候，指定密钥的文件名称即可

ssh-keygen -t rsa -C "***@gmail.com" -f ~/.ssh/id_rsa_github1
```