############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:latest

# File Author / Maintainer
MAINTAINER Sijin He ( sijin@ebi.ac.uk )

ENV TOOL_VERSION=0.2.2
ENV CONTAINER_VERSION=0.2.2

LABEL version="${CONTAINER_VERSION}"
LABEL tool_version="${TOOL_VERSION}"

RUN apt-get -y update && apt-get install --no-install-recommends -y nginx git
RUN npm uninstall @angular/cli -g
RUN npm install typings -g
RUN npm cache clean
RUN npm install -g @angular/cli@latest

#Clone the project
RUN git clone -b develop https://github.com/phnmnl/ng2-phenomenal-portal.git
WORKDIR /ng2-phenomenal-portal
RUN npm install --save-dev @angular/cli@latest 
RUN npm install 
RUN ng build --prod
RUN cp -r dist/* /usr/share/nginx/html
COPY ./default /etc/nginx/sites-enabled
EXPOSE 80