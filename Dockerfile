FROM koalaman/shellcheck-alpine:stable as shellcheck

FROM bash:3.2
COPY --from=shellcheck /bin/shellcheck /usr/bin/shellcheck
ENV SHELL=/usr/local/bin/bash
RUN mkdir /workdir \
    && apk add --no-cache entr git jq less ncurses php5 php5-cli python py-pygments py-yaml go musl-dev \
    && ln -s /usr/bin/php5 /usr/local/bin/php \
    && GOBIN=/usr/local/bin go get -v github.com/bronze1man/yaml2json
WORKDIR /workdir

