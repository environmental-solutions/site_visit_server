FROM ruby:2.4.2
MAINTAINER dgdosen <dgdosen@gmail.com>

RUN mkdir /site_visit_server
WORKDIR /site_visit_server
ADD . /site_visit_server
RUN bundle

