FROM mariadb

ADD ./schema_wz.sql /docker-entrypoint-initdb.d
RUN chmod 777 /docker-entrypoint-initdb.d