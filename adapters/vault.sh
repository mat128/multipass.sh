#!/bin/bash

VAULT=${VAULT:-"${HOME}/d/crypt"}

load() {
  if [ -f "${VAULT}/${1}" ]; then
    eval "$(sed -e 's/:[^:\/\/]/="/g;s/$/"/g;s/ *=/=/g' "${VAULT}/${1}")"
  fi
}

save() {
  if ! [ -f "${VAULT}/${1}" ]; then
    mkdir -p "${VAULT}"
    cat >  "${VAULT}/${1}"  << ____EOF
iterations: $iterations
length: ${length:-none}
____EOF
  fi
}