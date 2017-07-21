############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:7.10

# File Author / Maintainer
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="Metadata backend for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="1.0.0-alpha.0"
LABEL version="0.3"
LABEL website="https://portal.phenomenal-h2020.eu/"
LABEL documentation="https://portal.phenomenal-h2020.eu/"
LABEL license="https://github.com/phnmnl/container-phenomenal-portal/blob/master/License.txt"
LABEL tags="Cloud deployment"

RUN apt-get -y update && apt-get install --no-install-recommends -y nginx git && \
    npm uninstall @angular/cli -g && \
    npm install typings -g && \
    npm cache clean --force && npm install -g @angular/cli@1.0.0-rc.2 && \
    apt-get autoremove -y && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Clone the project
RUN git clone --depth 1 --single-branch -b develop https://github.com/phnmnl/ng2-phenomenal-portal.git
WORKDIR /ng2-phenomenal-portal
RUN npm install --save-dev @angular/cli@1.0.0-rc.2
RUN npm install 
RUN ng build --prod
RUN cp -r dist/* /usr/share/nginx/html
RUN chmod u+x setup_backend_host.sh
COPY ./default /etc/nginx/sites-enabled
EXPOSE 80
