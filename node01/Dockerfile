FROM centos:centos7

#################################################
# Install
#################################################
COPY MariaDB.repo /etc/yum.repos.d/
RUN yum -y update && \
    yum -y --nogpgcheck install python-setuptools MariaDB-server MariaDB-client galera && \
    yum clean all

#################################################
# MariaDB conf
#################################################
COPY server.cnf /etc/my.cnf.d/
RUN mkdir /var/log/mysql && \
    chown mysql:mysql /var/log/mysql && \
    mkdir -p /usr/bin/share/mysql && \
    cp /usr/share/mysql/english/errmsg.sys /usr/bin/share/mysql/

#################################################
# supervisor
#################################################
COPY supervisord.conf /etc/
RUN easy_install supervisor && mkdir /var/log/supervisor

#################################################
# bashrc
#################################################
RUN printf "export TERM=xterm-256color\n" >> /root/.bashrc

#################################################
# Time Zone
#################################################
RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#################################################
# Port
#################################################
EXPOSE 3306

#################################################
# Initialize Script
#################################################
COPY init.sh /tmp/
RUN chmod a+x /tmp/init.sh
