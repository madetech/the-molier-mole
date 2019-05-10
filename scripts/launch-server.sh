#!/bin/sh

set -evu

create_key_file() {
  key_file_name="$1"
  key_contents="$2"
  touch "$key_file_name"
  chown root:root "$key_file_name"
  chmod 600 "$key_file_name"
  echo "$key_contents" > "$key_file_name"
  chmod 400 "$key_file_name"
}

create_key_file "/etc/ssh/ssh_host_ecdsa_key" "$SECRET_ECDSA_HOST_KEY"
unset SECRET_ECDSA_HOST_KEY
create_key_file "/etc/ssh/ssh_host_ed25519_key" "$SECRET_ED25519_HOST_KEY"
unset SECRET_ED25519_HOST_KEY
create_key_file "/etc/ssh/ssh_host_rsa_key" "$SECRET_RSA_HOST_KEY"
unset SECRET_RSA_HOST_KEY

/usr/sbin/sshd -De
