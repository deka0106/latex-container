FROM ubuntu:eoan

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get -y install \
    curl \
    git \
    make \
    texlive-lang-cjk \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-extra-utils \
    latexmk \
    cpanminus \
    nodejs \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # for latexindent
    && cpanm \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString \
    Log::Log4perl \
    Log::Dispatch \
    # for textlint
    && curl -L https://npmjs.org/install.sh | sh \
    && npm i -g \
    textlint \
    textlint-rule-preset-japanese \
    textlint-rule-preset-ja-technical-writing \
    textlint-plugin-latex2e