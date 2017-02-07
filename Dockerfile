############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:latest

# File Author / Maintainer
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

RUN apt-get -y update && apt-get install --no-install-recommends -y nginx git
RUN npm uninstall @angular/cli -g
RUN npm install typings -g
RUN npm cache clean
RUN npm install -g @angular/cli@latest

#Clone the project
RUN git clone https://github.com/phnmnl/ng2-phenomenal-portal.git
WORKDIR /ng2-phenomenal-portal
RUN npm install --save-dev @angular/cli@latest && npm install && ng build --prod
RUN cp -r dist/* /usr/share/nginx/html
COPY ./default /etc/nginx/sites-enabled
EXPOSE 80
