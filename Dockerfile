FROM python:3.10.11 

ENV PYTHONUNBUFFERED 1

# RUN apt-get update \
#     && apt-get install -y software-properties-common \
#     && apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main'
RUN apt-get update \
   && apt-get -y install openjdk-11-jdk postgresql-client\
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install anvil-app-server anvil-uplink bump2version marshmallow pytest
RUN anvil-app-server || true

RUN mkdir /apps
RUN mkdir /anvil-data

VOLUME /apps
WORKDIR /apps

RUN useradd anvil
RUN chown -R anvil:anvil /anvil-data
USER anvil

# COPY ./apps /apps

# EXPOSE 3030
# RUN anvil-app-server --app MYDBBV2 --origin http://0.0.0.0 --auto-migrate --dep-id C6ZZPAPN4YYF5NVJ=anvil_extras
# CMD ["anvil-app-server", "--app", "MYDBBV2", "--auto-migrate", "--data-dir", "/anvil-data", "--origin", "http://0.0.0.0:3030"]