#!/usr/bin/env bash
#---
# Assumes Ubuntu 18.04 (bionic)
#---

ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
BIN_DIR="$(pwd)"
cd "${ORIG_DIR}"

trap "cd '${ORIG_DIR}'" EXIT

# Install docker
if ! hash docker 2>/dev/null
then
  curl -sfL https://get.docker.com | sh -s -
  sudo usermod -aG docker vagrant
fi
