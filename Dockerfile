FROM jfrog.local:5001/ubuntu:trusty
MAINTAINER markg@jfrog.com
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y npm curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs mongodb
RUN npm config set registry http://jfrog.local/artifactory/api/npm/npm/
RUN mkdir /data
RUN mkdir /data/db
RUN npm install goof@0.0.4
ADD ./run.sh /
RUN chmod ugo+x /run.sh

