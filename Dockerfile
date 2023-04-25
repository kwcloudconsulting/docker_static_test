FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles from git repo
RUN yum install -y git && \
    git clone https://github.com/kwcloudconsulting/docker_static_test.git /var/www/html

# copy files into html directory
RUN cp -r /var/www/html/* /var/www/html/

# remove unwanted folder
RUN rm -rf /var/www/html/docker_static_test

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
