#!/bin/bash

cd $(dirname $(readlink -f ${BASH_SOURCE[0]}))
. ./x11.sh
cd - >/dev/null

_xdotool_type_password() {
  xdotool sleep 1 type "$1"
}

_xdotool_supports_type() {
  xdotool -h | grep -q '^ *type$' && return 0 || return 1
}

_use_xdotool() {
  use_x11 && which xdotool >/dev/null && _xdotool_supports_type && return 0 || return 1
}

load_xdotool() {
  if _use_xdotool; then
    type_password() { _xdotool_type_password "$@"; }
  fi
}

load_xdotool
