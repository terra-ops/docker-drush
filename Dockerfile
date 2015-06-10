FROM kalabox/drush:stable
ADD aliases.drushrc.php /root/.drush/aliases.drushrc.php
RUN ln -s /usr/local/src/drush7/drush /usr/bin/drush
RUN apt-get update && apt-get install mysql-client php5-mysql -y
RUN drush dl registryrebuild
ENTRYPOINT ["tail", "-f", "/dev/null"]

