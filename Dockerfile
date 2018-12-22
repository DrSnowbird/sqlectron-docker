FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## -------------------------------------------------------------------------------
## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
## -------------------------------------------------------------------------------
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
ENV PRODUCT_WORKSPACE=${HOME}/sqlectron-gui-workspace

## ----------------------------------------------------------------------------
## ---- To change to different Product version:! ----
## ----------------------------------------------------------------------------

## -- 0.) Product Provider and Name: -- ##
ARG PRODUCT_PROVIDER=${PRODUCT_PROVIDER:-sqlectron}
ENV PRODUCT_PROVIDER=${PRODUCT_PROVIDER}

ARG PRODUCT_NAME=${PRODUCT_NAME:-Sqlectron}
ENV PRODUCT_NAME=${PRODUCT_NAME:-Sqlectron}

ENV PRODUCT_EXE=${PRODUCT_EXE:-sqlectron}

## -- 1.) Version: -- ##
ARG PRODUCT_VERSION=${PRODUCT_VERSION:-1.30.0}
ENV PRODUCT_VERSION=${PRODUCT_VERSION}

## -- 2.) Product Type: -- ##
ARG PRODUCT_TYPE=${PRODUCT_TYPE:-sqlectron-gui}

## -- 3.) Product Release: -- ##
ARG PRODUCT_RELEASE=${PRODUCT_RELEASE:-releases}

## -- 4.) Product Download Mirror site: -- ##
ARG PRODUCT_OS_BUILD=${PRODUCT_OS_BUILD}

## -- 5.) Product Download Mirror site: -- ##
# https://github.com/sqlectron/sqlectron-gui/releases/download/v1.30.0/Sqlectron-1.30.0.tar.gz
# https://github.com/sqlectron/sqlectron-gui%7D/releases/download/v1.30.0/Sqlectron-1.30.0.tar.gz
ARG PRODUCT_MIRROR_SITE_URL=${PRODUCT_MIRROR_SITE_URL:-https://github.com}

## ----------------------------------------------------------------------------------- ##
## ----------------------------------------------------------------------------------- ##
## ----------- Don't change below unless Product download system change -------------- ##
## ----------------------------------------------------------------------------------- ##
## ----------------------------------------------------------------------------------- ##
## -- Product TAR/GZ filename: -- ##
#ARG PRODUCT_TAR=${PRODUCT_TAR:-Sqlectron-1.30.0.tar.gz}
ARG PRODUCT_TAR=${PRODUCT_TAR:-${PRODUCT_NAME}-${PRODUCT_VERSION}.tar.gz}

## -- Product Download route: -- ##
ARG PRODUCT_DOWNLOAD_ROUTE=${PRODUCT_DOWNLOAD_ROUTE:-${PRODUCT_PROVIDER}/${PRODUCT_TYPE}/${PRODUCT_RELEASE}/download/v${PRODUCT_VERSION}}

## -- Product Download full URL: -- ##
ARG PRODUCT_DOWNLOAD_URL=${PRODUCT_DOWNLOAD_URL:-${PRODUCT_MIRROR_SITE_URL}/${PRODUCT_DOWNLOAD_ROUTE}}

WORKDIR /opt
RUN sudo wget -c ${PRODUCT_DOWNLOAD_URL}/${PRODUCT_TAR} && \
    sudo tar xvf ${PRODUCT_TAR} && \
    sudo ln -s ${PRODUCT_NAME}-${PRODUCT_VERSION} ${PRODUCT_PROVIDER} && \
    sudo rm ${PRODUCT_TAR} 

#################################
#### Install Libs or Plugins ####
#################################
# ... add Product plugin if any 
RUN sudo apt-get install -y libgtk2.0 libgconf-2-4 libnss3

RUN sudo apt install -y libcanberra-gtk-module

RUN sudo rm -f /usr/lib/i386-linux-gnu/mesa/libGL.so.1

##################################
#### Set up user environments ####
##################################
VOLUME ${PRODUCT_WORKSPACE}
VOLUME ${HOME}/.${PRODUCT_NAME}-${PRODUCT_VERSION} 

RUN mkdir -p ${PRODUCT_WORKSPACE} ${HOME}/.${PRODUCT_NAME}-${PRODUCT_VERSION} && \
    sudo chown -R ${USER_NAME}:${USER_NAME} ${PRODUCT_WORKSPACE}

USER ${USER_NAME}
WORKDIR ${HOME}

CMD ["/bin/bash", "-c", "/opt/${PRODUCT_PROVIDER}/${PRODUCT_EXE}"]

