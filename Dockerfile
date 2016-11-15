############################################################
# Dockerfile for Apache ActiveMQ
# Configured for Opencast Matterhorn
# Based on CentOS 7
############################################################


# Set the base image to centos
FROM centos:7

# File Author / Maintainer
MAINTAINER Lars Kiesow <lkiesow@uos.de>


# Update the repository sources list
RUN yum -y update
RUN curl -L https://copr.fedoraproject.org/coprs/lkiesow/nexus-oss/repo/epel-7/lkiesow-nexus-oss-epel-7.repo -o /etc/yum.repos.d/lkiesow-nexus-oss-epel-7.repo
RUN yum -y install nexus-oss
ADD start.sh /start.sh
RUN mkdir -p /var/lib/nexus-oss/conf/
ADD nexus.xml /nexus.xml


##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 8081

CMD ["/start.sh"]
