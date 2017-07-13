FROM ubuntu:16.04

ENV PATH="/mattermost-load-test/bin:${PATH}"
ENV PATH="/mattermost/bin:${PATH}"
ARG LOADTEST_BINARY
ARG MM_BINARY

RUN apt-get update \
    && apt-get -y install \
      curl \
      jq \
      netcat \
      net-tools \
      iproute \
      dnsutils

RUN mkdir -p /mattermost/data \
    && curl $MM_BINARY | tar -xvz \
    && rm -rf /mattermost/config/config.json

RUN mkdir -p /mattermost-load-test \
	&& curl $LOADTEST_BINARY | tar -xvz \
	&& rm -f /mattermost-load-test/loadtestconfig.json

WORKDIR /mattermost-loadtest
CMD ["loadtest", "all"]
