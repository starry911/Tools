FROM php:8.2-fpm

# 映射本机时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 更换apt-get的源-改用为阿里云的源
# 国内部署环境需要使用这一步，国外无需这一步
#COPY ./sources.list /etc/apt/sources.list

# composer下载地址：https://getcomposer.org/download/
# phpredis下载地址：https://github.com/phpredis/phpredis/releases
# 本地下载好phpredis扩展和composer，因为国内可能下载不动
# 国内部署环境需要使用这一步，国外无需这一步
COPY ./phpredis-6.0.2.tar.gz /tmp/redis.tar.gz
COPY ./composer.phar /usr/local/bin/composer

# apt更新源以及安装软件
RUN apt-get update && apt-get install -y \
    vim \
    cron \
    supervisor \
    nginx \
    git \
    unzip \
    libfreetype6-dev  \
    libjpeg62-turbo-dev  \
    libpng-dev \
    libwebp-dev \
    libgif-dev \
    --no-install-recommends

# 创建supervisor的日志文件路径
RUN mkdir -p /var/log/supervisor

# 安装PHP扩展,mysqli、pdo、gd、redis库
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli \
    && tar xfz /tmp/redis.tar.gz && rm -r /tmp/redis.tar.gz && mkdir -p /usr/src/php/ext && mv phpredis-6.0.2 /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# 安装composer
RUN chmod +x /usr/local/bin/composer
# 国内需要设置为阿里云的源
#RUN chmod +x /usr/local/bin/composer && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /data/www
