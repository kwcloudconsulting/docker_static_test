FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd wget unzip git && \
    yum search wget

# Change directory
WORKDIR /var/www/html

# Download webfiles from git repo
RUN git clone https://github.com/kwcloudconsulting/docker_static_test.git .

# Remove unwanted folder
RUN rm -rf /var/www/html/docker_static_test

# Expose port 80 on the container
EXPOSE 80

# Set the default application that will start when the container starts
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
