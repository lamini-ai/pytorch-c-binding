# Base container name
ARG BASE_NAME=python:3.11

FROM $BASE_NAME as base

ARG INSTALL_ROOT=/app/lamini
ENV INSTALL_ROOT=$INSTALL_ROOT

RUN apt-get -yq update && apt-get -yqq install vim

# Install python packages
WORKDIR $INSTALL_ROOT
COPY ./requirements.txt $INSTALL_ROOT/requirements.txt

RUN pip install -r requirements.txt

# Copy all files to the container
COPY . $INSTALL_ROOT
WORKDIR $INSTALL_ROOT

RUN chmod a+x $INSTALL_ROOT/scripts/start.sh

ENTRYPOINT $INSTALL_ROOT/scripts/start.sh

