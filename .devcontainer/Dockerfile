FROM deka0106/latexmk-ja

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get -y install \
    curl \
    git \
    nodejs \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && curl -L https://npmjs.org/install.sh | sh