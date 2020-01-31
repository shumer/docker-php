
FROM wodby/drupal-php:7.2
USER root

RUN set -xe; \
    apk add --update --no-cache \
    npm \
    jq \
    mc \
    yarn


USER wodby
RUN  git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/wodby/.bash_it  \
     && /home/wodby/.bash_it/install.sh \
     && sed -i -e 's/bobby/powerline-plain/g' /home/wodby/.bashrc \
     && sed -i -e 's/user_info scm python_venv ruby node cwd/user_info cwd scm/g' /home/wodby/.bash_it/themes/powerline-plain/powerline-plain.theme.bash \
     && source /home/wodby/.bashrc \
     && git config --global alias.nmerge "merge --no-ff" \
     && git config --global alias.co "checkout"\
     && git config --global alias.br "branch" \
     && git config --global alias.ci "commit" \
     && git config --global alias.st "status" \
     && git config --global alias.unstage "reset HEAD --" \
     && git config --global alias.last "log -1 HEAD" \
     && git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

WORKDIR /var/www/html