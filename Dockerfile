
FROM wodby/drupal-php:7.2
USER root

RUN set -xe; \
    apk add --update --no-cache \
    npm \
    jq \
    yarn

USER wodby
WORKDIR /var/www/html