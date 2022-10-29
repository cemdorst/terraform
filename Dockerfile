FROM centos:8
MAINTAINER dorst
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install wget nodejs unzip git bsdtar -y
RUN wget -qO- https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip | bsdtar -xvf- -C /tmp/
RUN install /tmp/terraform /usr/bin/ && rm -rf /tmp/terraform
