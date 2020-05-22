FROM deka0106/latexmk-ja

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get -y install \
    build-essential \
    curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash \
    && apt-get -y install nodejs \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
