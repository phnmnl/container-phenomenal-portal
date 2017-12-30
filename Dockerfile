############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:7.10

# File Author / Maintainer
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="Metadata backend for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="1.1.3"
LABEL version="0.3"
LABEL website="https://portal.phenomenal-h2020.eu/"
LABEL documentation="https://portal.phenomenal-h2020.eu/"
LABEL license="https://github.com/phnmnl/container-phenomenal-portal/blob/master/License.txt"
LABEL tags="Cloud deployment"

# Optional arguments to choose the Git repo & branch to use at build time
ARG git_repo=kikkomep/ng2-phenomenal-portal
ARG git_branch=feature/signin_and_user_profile
RUN apt-get -y update && apt-get install --no-install-recommends -y nginx git jq unzip && \
    npm uninstall @angular/cli -g && \
    npm install typings -g && \
    npm cache clean --force && npm install -g @angular/cli@latest && \
    apt-get autoremove -y && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Clone git repository
RUN echo "Cloning branch '${git_branch}' of the Git repository '${git_repo}'" >&2 && \
    git clone --depth 1 --single-branch -b ${git_branch} https://github.com/${git_repo}.git
#RUN wget https://github.com/phnmnl/ng2-phenomenal-portal/archive/1.1.3.zip && unzip 1.1.3.zip && mv ng2-phenomenal-portal-1.1.3 ng2-phenomenal-portal
WORKDIR /ng2-phenomenal-portal
RUN npm install --save-dev @angular/cli@latest
RUN npm install 
RUN ng build --env=prod
RUN cp -r dist/* /usr/share/nginx/html
COPY setup_backend_host.sh setup_backend_host.sh
RUN chmod u+x setup_backend_host.sh
COPY ./default /etc/nginx/sites-enabled
EXPOSE 80
