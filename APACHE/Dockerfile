FROM ubuntu

ENV VERSION 9.4.5

ENV GLPI_LANG pt_BR

ENV MARIADB_HOST mariadb-glpi

ENV MARIADB_PORT 3306

ENV MARIADB_DATABASE glpi

ENV MARIADB_USER glpi

ENV MARIADB_PASSWORD glpi

ENV PLUGINS all

WORKDIR /var/www/html/glpi

RUN apt update

RUN apt install software-properties-common -y

RUN add-apt-repository ppa:ondrej/php 

RUN apt install apache2 \
 php7.3 \
 php7.3-common \
 php7.3-opcache \
 php7.3-cli \
 php7.3-gd \
 php7.3-curl \
 php7.3-mysql \
 php7.3-fpm \
 libapache2-mod-php7.3 \
 php7.3-curl \
 php7.3-ldap \
 php7.3-imap \
 php7.3-apcu \
 php7.3-xml \
 curl \
 unzip \
 php7.3-xmlrpc \
 php-cas \
 php7.3-mbstring -y 

#RUN rm /var/www/html/glpi/index.html

COPY --chown=www-data:www-data src/glpi /var/www/html/glpi

ADD apache2.conf /etc/apache2/apache2.conf


ADD plugins.zip /var/www/html/glpi/plugins/

RUN unzip /var/www/html/glpi/plugins/plugins.zip

VOLUME ["/var/www/html/glpi/config", "/var/www/html/glpi/files", "/var/www/html/glpi/plugins"]

ADD glpi-entrypoint.sh plugins.sh /

RUN chmod 755 /glpi-entrypoint.sh /plugins.sh \
	&& rm -rf /var/www/html/glpi/install/install.php

EXPOSE 80

CMD ["/glpi-entrypoint.sh"]
