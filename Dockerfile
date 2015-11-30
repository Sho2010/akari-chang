FROM ruby:2.2
MAINTAINER Sho2010

ENV app_path /akari-chang

RUN mkdir ${app_path}
WORKDIR ${app_path}

# Gemfileを先にADDしてbundleすることによってGemfileが変更された時のみ実行するようにする工夫
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ADD . ${app_path}

CMD cd ${app_path}/akari-chang && slappy start

