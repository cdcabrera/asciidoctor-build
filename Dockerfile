FROM ruby:2.6
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    gem install asciidoctor && \
    npm install -g nodemon >/dev/null && \
    echo "asciidoctor $(asciidoctor -v)" && \
    echo "node $(node -v)"

COPY . /app
RUN chmod +rx /app/bin/cli.sh

VOLUME /data
VOLUME /output

ENTRYPOINT ["./bin/cli.sh"]
