# 统一身份登陆脚本
window下配合[Chromedriver](https://sites.google.com/chromium.org/driver/)
使用，主要跟当前chrome版本相一致，该脚本能够模拟统一身份认证登陆。

# NEU_非统一身份登录脚本
mac跟linux下可通过执行脚本直接登录校园网，适用于linux服务器。
PS:
该方法为使用非统一身份登录，密码为最初用户设置的校园网密码，经测试与统一身份登录密码不一定相同(中间老师要求改过一次密码)


# 使用方法
1、先加执行权限
```bash
chmod +x login
```

2、在文件login中添加账号密码

3、执行登录指令
```bash
./login --login
```
4、查看当前登录状态
```bash
./login --info
```

5、登出下线
```bash
./login --logoff
```


截止到20210421 各项均正常
