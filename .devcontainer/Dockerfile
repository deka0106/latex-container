FROM deka0106/latexmk-ja

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get -y install \
    build-essential \
    curl \
    git \
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
    && curl -L https://npmjs.org/install.sh | sh