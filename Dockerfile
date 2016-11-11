FROM centos:6

MAINTAINER Jorge Arias <mail@jorgearias.cl>

COPY assets/Tuleap.repo /etc/yum.repos.d/Tuleap.repo

RUN yum install -y epel-release \
  && yum install -y tuleap-all tuleap-plugin-git-gitolite3 \
  && yum clean all

ENV DEFAULT_DOMAIN="localhost" ORG_NAME=""

EXPOSE 80 443

COPY docker-wrapper.sh /sbin/docker-wrapper.sh

RUN chmod 755 /sbin/docker-wrapper.sh

VOLUME ["/etc/httpd", "/etc/tuleap", "/root", "/home", "/var/lib/mailman", "/var/lib/mysql", "/var/lib/tuleap"]

CMD ["/sbin/docker-wrapper.sh"]
