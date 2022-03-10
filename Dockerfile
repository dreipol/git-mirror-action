FROM alpine

RUN apk add --no-cache git openssh-client && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN apk update && apk add --no-cache git-lfs
RUN git lfs install --skip-smudge
RUN git config --global lfs.allowincompletepush true

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
