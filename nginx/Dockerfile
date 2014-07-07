# DOCKER-VERSION 1.0.0

FROM rampantmonkey/base-ubuntu:14.04
MAINTAINER Casey Robinson <casey@rampantmonkey.com>

RUN apt-get install -y nginx

ADD default /etc/nginx/sites-available/default
RUN mkdir -p /var/www

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/var/log/nginx", "/var/www"]
EXPOSE 80
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
