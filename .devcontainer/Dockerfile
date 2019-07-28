FROM paperist/alpine-texlive-ja

RUN apk --no-cache add \
    git \
    ghostscript \
    make \
    npm \
    perl-app-cpanminus \
    perl-sub-identify \
    perl-unicode-linebreak

# for latexindent
RUN cpanm \
    Log::Log4perl \
    Log::Dispatch::File \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString

# for textlint
RUN npm i -g \
    textlint \
    textlint-rule-preset-ja-spacing \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-preset-japanese \
    textlint-rule-spellcheck-tech-word \
    textlint-plugin-latex2e