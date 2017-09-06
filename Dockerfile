FROM ubuntu:14.04

COPY degrade.list /etc/apt/sources.list.d/

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y  \
            apache2=2.2.22-1ubuntu1.11 \
   apache2.2-common=2.2.22-1ubuntu1.11 \
      apache2.2-bin=2.2.22-1ubuntu1.11 \
apache2-mpm-prefork=2.2.22-1ubuntu1.11 \
 libapache2-mod-php5=5.3.10-1ubuntu3.26 \
            php5-cli=5.3.10-1ubuntu3.26 \
                php5=5.3.10-1ubuntu3.26 \
         php5-common=5.3.10-1ubuntu3.26 \
          php5-pgsql=5.3.10-1ubuntu3.26 \
            php5-xsl=5.3.10-1ubuntu3.26 \
        php5-mysqlnd=5.3.10-1ubuntu3.26 \
         php5-sqlite=5.3.10-1ubuntu3.26 \
           php5-uuid \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN a2enmod rewrite

COPY default /etc/apache2/sites-available/default

COPY php5-bcompiler_1.0.2-1ubuntu4_amd64.deb /root/
RUN dpkg -i /root/php5-bcompiler_1.0.2-1ubuntu4_amd64.deb

VOLUME ["/var/www"]

EXPOSE 80

ENV APACHE_RUN_USER    www-data
ENV APACHE_RUN_GROUP   www-data
ENV APACHE_LOG_DIR     /var/log/apache2
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2

CMD ["/usr/sbin/apache2","-DFOREGROUND"]
