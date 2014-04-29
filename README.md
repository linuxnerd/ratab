#RA-TAB
管理系统基本功能框架，可在此基础上扩展业务功能。

##安装
```shell
git clone git@github.com:linuxnerd/ratab.git
cd ratab
bundle install
cd config
cp config.default.yml config.yml # 将参数修改成自己的参数(注意修改faye token)
bundle exec rake db:schema:load
bundle exec rake db:init # 创建一个管理员用户admin@g.com
```

##已经实现了什么？

 - 用户基本管理（注册、登陆、修改个人资料、修改密码、忘记密码等）
 - 基于`faye-rails`的实时通知系统，直接操作Notification模型即可
 - 基本的国际化
 - 基于`spreadsheet`的导出到excel的功能

##要注意的坑
 - `wice_grid`与`will_paginate`存在兼容性问题，paginate使用`kaminari-bootstrap` 0.1.3版本
 - ace theme使用Bootstrap2，因此`kaminari-bootstrap 3.0.1`无法使用。使用gems时可以使用`linuxnerd/kaminari-bootstrap`，这里是0.1.3版本

##TODO
 - 基于`carrierwave`的头像上传功能
 - 通讯录管理
