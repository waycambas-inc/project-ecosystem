FROM centos:7
MAINTAINER waycambas waycambas8@gmail.com

# Environment
ENV PHP_VERSION=80

# Copy file container to /
COPY app /app
COPY etc /etc

# Sync Repo
RUN yum -y install epel-release

# Install Extras
RUN yum -y install git cronie which gcc make libpng-devel wget unzip

# Install php-fpm
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --disable 'remi-php*'
RUN yum-config-manager --enable remi-php80 -y
RUN yum -y install php php-{cli,fpm,mysqlnd,zip,devel,gd,mbstring,curl,xml,pear,bcmath,json}
RUN pecl install mongodb
RUN php -v

RUN mkdir /run/php-fpm/

# install composer 
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer
RUN composer -v

# Install nodejs
# RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -

# Install yarn
# RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo

# Install Services
RUN yum -y install nginx supervisor 
# RUN nodejs-10.19.0 yarn

# Supervisor
COPY services /etc/supervisord.d/

# EXPOSE PORT so inside can be reached from the outside :D
EXPOSE 80 9000 9001 81

CMD ["/app/run.sh"]
