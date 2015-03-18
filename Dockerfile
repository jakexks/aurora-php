FROM debian:7

RUN apt-get update && apt-get -y install php5-fpm python
RUN sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php5/fpm/pool.d/www.conf
RUN mkdir -p /srv/ && wget http://ftp.drupal.org/files/projects/drupal-7.34.tar.gz && tar -zxv -C /srv/ -f drupal-7.34.tar.gz
CMD ["php5-fpm", "-F"]