############################################################
# Dockerfile to build PhenoMeNal Portal images
############################################################
# Set the base image to node
FROM node:8.11.1

# File Author / Maintainer
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

# container version
ENV version="1.1"

# software version
ENV software_version="3.0.0-rc1"

# Metadata
LABEL Description="PhenoMeNal Portal main container"
LABEL software="PhenoMeNal Portal"
LABEL website="https://portal.phenomenal-h2020.eu/"
LABEL documentation="https://portal.phenomenal-h2020.eu/"
LABEL license="https://github.com/phnmnl/container-phenomenal-portal/blob/master/License.txt"
LABEL tags="Cloud deployment"
LABEL version="${version}"
LABEL software.version="${software_version}"

# Optional arguments to choose the Git repo & branch to use at build time
ARG git_repo=phnmnl/ng2-phenomenal-portal
ARG git_branch="v${software_version}"

# Install software requirements
RUN apt-get -y update && apt-get install --no-install-recommends -y nginx git jq unzip && \
    npm uninstall @angular/cli -g && \
    npm install typings -g && \
    npm cache clean --force && npm install -g @angular/cli@latest && \
    apt-get autoremove -y && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Clone git repository
RUN echo "Cloning branch '${git_branch}' of the Git repository '${git_repo}'" >&2 && \
    git clone --depth 1 --single-branch -b ${git_branch} https://github.com/${git_repo}.git

# Build and deploy the portal
WORKDIR /ng2-phenomenal-portal
RUN npm install && ng build --prod --env=prod
RUN cp -r dist/* /usr/share/nginx/html
COPY setup_backend_host.sh setup_backend_host.sh
RUN chmod u+x setup_backend_host.sh
COPY ./default /etc/nginx/sites-enabled

# Ports
EXPOSE 80
