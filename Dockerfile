FROM ubuntu:14.04
MAINTAINER Evgeniy Deyneko
ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_PASSWORD zabbix
RUN apt-get update \
&& apt-get install -y supervisor \
&& mkdir -p /var/log/supervisor\
&& apt-get install wget -y \
&& wget https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.4-1+trusty_all.deb \
&& dpkg -i zabbix-release_4.4-1+trusty_all.deb \
&& apt-get update \
&& apt-get -y install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent \
&& /etc/init.d/mysql start \
&& mysql -u root -e "create database zabbix character set utf8 collate utf8_bin" \
&& mysql -u root -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix'" \
&& zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u zabbix -p zabbix --password="$MYSQL_PASSWORD" \
&& echo "DBPassword=zabbix" >> /etc/zabbix/zabbix_server.conf \
&& sed -i -e 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Kiev/' /etc/zabbix/apache.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 80/tcp