#!/bin/bash

# 启动定时任务
service cron start
#crontab /etc/cron.d/laravel-cron
#supervisord -c /etc/supervisor/supervisord.conf

chmod -R 755 .

#if [[ ! -d "vendor" ]];then
#    composer install
#fi

# 启动nginx
nginx

php-fpm