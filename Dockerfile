FROM devopslabs/php

RUN apk --no-cache add nginx \
        supervisor

COPY config/nginx.conf /etc/nginx/nginx.conf
#COPY config/fpm-pool.conf /etc/php7/php-fpm.d/zzz_custom.conf
#COPY config/php.ini /etc/php7/conf.d/zzz_custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]