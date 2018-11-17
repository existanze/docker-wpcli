FROM wordpress:latest

# Install requirements for wp-cli support
RUN apt-get update \
  && apt-get install -y sudo less mysql-client \
  && rm -rf /var/lib/apt/lists/*

# Add WP-CLI 
RUN pwd
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar

# Add Composer 
RUN cd /bin/ && curl -sS  https://getcomposer.org/installer | php
COPY composer-su.sh /bin/composer
RUN chmod +x /bin/composer.phar

