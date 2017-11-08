FROM ruby:2.4.2
MAINTAINER esi cloud workers <esi.cloud.workers@gmail.com>

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential
RUN mkdir -p /app
WORKDIR /app
COPY . .

COPY ./docker_entrypoint.sh /
RUN chmod +x /docker_entrypoint.sh
ENTRYPOINT ["/docker_entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"
