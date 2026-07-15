################################################################################
FROM ubuntu:26.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y upgrade && apt-get install -y tzdata make sudo p7zip-full

#Build dependencies 
COPY ./version.txt /z/
COPY ./Common.mk /z/
COPY ./Install-deps.mk /z/
COPY ./Makefile.windows.mk /z/
COPY ./z/windows-build.cmake /z/z/

WORKDIR /z
RUN  make -f Makefile.windows.mk install_deps
