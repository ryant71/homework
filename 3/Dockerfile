FROM nginx

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y gettext-base \
    && apt-get install -y procps
RUN rm -f /etc/nginx/conf.d/*

COPY html/ /opt/html/
COPY conf/nginx.tmpl /tmp/nginx.tmpl
COPY srv/ srv/

USER 101

ENTRYPOINT ["/srv/entrypoint.sh"]
#CMD ["nginx", "-c", "/tmp/nginx.conf", "-g", "'daemon off;'"]
