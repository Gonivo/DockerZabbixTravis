# This is

Tto start docker container use:
    sudo docker run -td -p **[host_port]**:80 --name **[name]** gonivo/alpacked-test-task

To stop container use:
    sudo docker rm -f **[name]**

You can access zabbix server via
    http://localhost:**[host_port]**/zabbix/

Where
**[host_port]** - port to access zabbix server
**[name]** - container name