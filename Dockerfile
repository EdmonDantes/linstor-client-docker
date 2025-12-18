FROM python:latest AS builder

LABEL stage=build
LABEL app=linstor-client-docker

ARG LINSTOR_API_GIT_URL=https://github.com/LINBIT/linstor-api-py.git
ARG LINSTOR_CLIENT_GIT_URL=https://github.com/LINBIT/linstor-client.git

RUN mkdir -p /src

WORKDIR /src

# Install git and make in alpine
RUN if [ -n "$(which apk)" ]; then \
    apk add --no-cache git make;  \
    fi;

RUN git clone --recursive https://github.com/LINBIT/linstor-api-py.git linstor-api-py

WORKDIR /src/linstor-api-py

RUN git checkout "$(git describe --tags --abbrev=0)" &&  \
    git submodule update && \
    pip3 install --no-cache-dir .

WORKDIR /src

RUN git clone --recursive https://github.com/LINBIT/linstor-client.git linstor-client

WORKDIR /src/linstor-client

RUN git checkout "$(git describe --tags --abbrev=0)" &&  \
    git submodule update && \
    sed -i 's/\s*"python3-setuptools"/        "setuptools",/' setup.py && \
    pip3 install --no-cache-dir .

RUN rm -r /src

# Delete git and make in alpine
RUN if [ -n "$(which apk)" ]; then \
    apk del --purge git make;  \
    fi;

WORKDIR /

CMD ["linstor"]