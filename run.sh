docker run -d --name docker_glpi_web \
--network glpi_glpi-backend \
--link glpi_mariadb-glpi_1 \
-e GLPI_LANG=pt_BR \
-e MARIADB_HOST=mariadb-glpi \
-e MARIADB_PORT=3306 \
-e MARIADB_DATABASE=glpi \
-e MARIADB_USER=glpi-user \
-e MARIADB_PASSWORD=glpi-pass \
-e VERSION="9.4.3" \
-e PLUGINS="all" \
-p 8080:80 \
fpm-tecnologia/glpi:1.0