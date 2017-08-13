FROM nginx:1.13-alpine

RUN apk add --no-cache tini

# The intention was to make our nginx reusable
COPY conf.available /etc/nginx/conf.available

COPY start.sh /start.sh
WORKDIR /

EXPOSE 80

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["./start.sh"]
