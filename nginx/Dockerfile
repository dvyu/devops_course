FROM nginx
MAINTAINER Yuri Dvin <dvyu@yandex.ru>

RUN apt-get update && apt-get install -y telnet procps net-tools htop iputils-ping vim curl zip git nginx-extras

ADD reload /
RUN chmod +x /reload

ADD default.stream /etc/nginx/conf.d/default.stream

ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
