FROM gliderlabs/alpine

RUN apk-install php-fpm python
RUN sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php/php-fpm.conf
RUN mkdir -p /srv/ && wget http://ftp.drupal.org/files/projects/drupal-7.34.tar.gz && tar -zxv -C /srv/ -f drupal-7.34.tar.gz
CMD ["php5-fpm", "-F"]