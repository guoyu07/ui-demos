FROM nginx
MAINTAINER JianyingLi <lijy91@foxmail.com>

RUN apt-get update && apt-get install -y sudo curl bzip2 git vim gnupg

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./nginx /etc/nginx

WORKDIR /app

COPY . /app/

RUN cp -R /app/*  /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
