FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get upgrade --yes && \
  apt-get install --yes software-properties-common sudo && \
  add-apt-repository --yes --update ppa:ansible/ansible && \
  apt-get install --yes ansible && \
  apt-get clean autoclean && \
  apt-get autoremove --yes

FROM base AS russell
ARG TAGS
RUN adduser --gecos russell --disabled-password russell
RUN usermod -aG sudo russell
RUN passwd -d russell
USER russell
WORKDIR /home/russell

FROM russell
COPY . ./kickstart
# CMD ["sh", "-c", "ANSIBLE_LOCALHOST_WARNING=false ansible-playbook $TAGS ./.kickstart/linux.yml"]
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
