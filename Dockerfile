FROM alpine:3.9

RUN apk add --no-cache openssh-server openssh-server-pam

COPY ./sshd_config /etc/ssh
COPY ./authorised_keys /etc/ssh/authorised_keys/
RUN chmod 644 /etc/ssh/authorised_keys/*

RUN cd /etc/ssh/authorised_keys/; \
  for username in *; do \
  adduser -D --home / "$username"; \
  done

COPY ./scripts/launch-server.sh /launch-server.sh

EXPOSE 22

CMD /launch-server.sh
