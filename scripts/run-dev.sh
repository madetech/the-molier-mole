#!/bin/bash

set -euo pipefail

{
  SECRET_ECDSA_HOST_KEY="$(cat hostkeys/ecdsa)" \
  SECRET_ED25519_HOST_KEY="$(cat hostkeys/ed25519)" \
  SECRET_RSA_HOST_KEY="$(cat hostkeys/rsa)" \
    docker-compose up --build
}
