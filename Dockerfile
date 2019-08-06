
FROM wodby/drupal-php:7.2
USER root

RUN set -xe; \
    apk add --update --no-cache \
    npm \
    jq \
    mc \
    yarn \
    php-cas

USER wodby
RUN  git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/wodby/.bash_it;  \
    /home/wodby/.bash_it/install.sh; \
    sed -i -e 's/bobby/powerline-plain/g' /home/wodby/.bashrc

WORKDIR /var/www/html