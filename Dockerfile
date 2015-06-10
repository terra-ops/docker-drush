FROM drush/drush
ADD aliases.drushrc.php /root/.drush/aliases.drushrc.php
RUN apt-get update && apt-get install mysql-client php5-mysql -y
ENTRYPOINT ["tail", "-f", "/dev/null"]
