FROM nginx:1.13-alpine

# Install PHP the hard way :)
RUN	apk update && \
	apk add --update \
        openssl \
        git \
        php5-fpm \
		php5-cli \
		php5-mysql \
		php5-json \
		php5-mcrypt \
		php5-openssl \
		php5-curl \
		php5-gd \
		php5-zip \
		php5-pdo_mysql \
		php5-gettext

# Create www for nginx
RUN adduser -D -u 1000 -g 'www' www

# Update nginx configs
RUN sed -i '/include \/etc\/nginx\/conf\.d*/a   include \/etc\/nginx\/sites-enabled\/\*\;' /etc/nginx/nginx.conf && \
    sed -i 's/listen = .*/listen = \/var\/run\/php5-fpm\.sock/' /etc/php5/php-fpm.conf && \
    sed -i 's/user = .*/user = nginx/' /etc/php5/php-fpm.conf && \
    sed -i 's/group = .*/group = www/' /etc/php5/php-fpm.conf && \

    # Allow environments
    sed -i '/;env\[HOSTNAME\] = .*/aenv\[WEBZASH_DB\] = $WEBZASH_DB\nenv\[WEBZASH_HOST\] = $WEBZASH_HOST\nenv\[WEBZASH_USER\] = $WEBZASH_USER\nenv\[WEBZASH_PASSWORD\] = $WEBZASH_PASSWORD\nenv\[WEBZASH_PORT\] = $WEBZASH_PORT' /etc/php5/php-fpm.conf
    
# Load nginx configs
COPY nginx/conf.available/webzash /etc/nginx/sites-enabled/

RUN mkdir /var/www

# Get CakePHP installation
RUN wget https://github.com/cakephp/cakephp/zipball/2.10.0 && \
    unzip 2.10.0 && \
    mv cakephp* /var/www/webzash && \
    rm 2.10.0

WORKDIR /var/www/webzash

# Install plugins
RUN git clone https://github.com/slywalker/cakephp-plugin-boost_cake.git app/Plugin/BoostCake && \
    git clone https://github.com/prashants/webzash.git app/Plugin/Webzash

# Update configs
COPY app app

RUN apk del git && \
    rm -rf /var/cache/apk/*

COPY start.sh /var/www/webzash

# Need to be executable
RUN chmod +x ./start.sh

CMD ["./start.sh"]

EXPOSE 9010

