FROM mcr.microsoft.com/mssql-tools

MAINTAINER Brad Soper <bradley.soper@dell.com>

RUN apt update -y && apt install -y git \
            software-properties-common \
            curl \
            bash \
            tar \
            unzip \
            jq && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update -y && \
    apt install -y python3.6 && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.6 - --user && \
    pip install --no-cache --upgrade pip \
            setuptools \
            wheel \
            yq \
            jinja2 && \
    curl -LJO https://github.com/concourse/concourse/releases/download/v5.8.0/fly-5.8.0-linux-amd64.tgz && \
    tar xvzf fly-5.8.0-linux-amd64.tgz && \
    rm fly-5.8.0-linux-amd64.tgz && \
    chmod +x fly && \
    mv fly /usr/local/bin && \
    curl -LJO https://releases.hashicorp.com/vault/1.4.0/vault_1.4.0_linux_amd64.zip && \
    unzip vault_1.4.0_linux_amd64.zip && \
    rm vault_1.4.0_linux_amd64.zip && \
    chmod +x vault && \
    mv vault /usr/local/bin
