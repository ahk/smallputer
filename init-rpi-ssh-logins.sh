#!/usr/bin/env bash

parse_args () {
  if [ $# -lt 1 ]; then
    echo "usage: please enter a host name to target."
    exit
  fi

  rpi_host=$1
  rpi_user='pi'
  rpi_pass='raspberry'
}

main () {
  echo "registering this machine with rpi host ..."
  register_push $rpi_user $rpi_host $rpi_pass && \
  echo "registration complete."
}

register_push () {
expect <<- CMDS
  spawn ssh-copy-id "$1@$2"
  expect "password:"
  send "$3\n"
  expect eof
CMDS
}

parse_args $@
main
