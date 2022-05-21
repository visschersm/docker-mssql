FROM mcr.microsoft.com/mssql/server

ENV SA_PASSWORD=Y0uSh@llN0tP@ss
ENV ACCEPT_EULA=Y

USER root

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app

ENTRYPOINT [ "/bin/bash", "./entrypoint.sh" ] 