FROM fpm-tecnologia/glpi:1.1

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/glpi-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/glpi-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN apt -y install cron mariadb-client
 
ADD crond-entrypoint.sh backup.sh /

RUN chmod 755 /crond-entrypoint.sh /backup.sh

RUN sh /crond-entrypoint.sh 

CMD cron && tail -f /var/log/cron.log
