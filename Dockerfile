############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:latest

# File Author / Maintainer
MAINTAINER Sijin He ( sijin@ebi.ac.uk )

LABEL Description="Metadata backend for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="1.0.0-alpha.0"
LABEL version="0.3"
LABEL website="https://portal.phenomenal-h2020.eu/"
LABEL documentation="https://portal.phenomenal-h2020.eu/"
LABEL license="https://github.com/phnmnl/container-phenomenal-portal/blob/master/License.txt"
LABEL tags="Cloud deployment"

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
