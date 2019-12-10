# Maintainer Evgeniy Deyneko

To start docker container use:

    sudo docker run -td -p **[host_port]**:80 --name **[name]** gonivo/alpacked-test-task


To stop container use:

    sudo docker rm -f **[name]**


You can access zabbix server via
**[docker_host]**:**[host_port]**/zabbix/


Where

**[docker_host]** - hostname or IP where docker image running

**[host_port]** - port to access zabbix server

**[name]** - container name
