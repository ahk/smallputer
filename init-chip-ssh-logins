#!/usr/bin/env bash

parse_args () {
  if [ $# -lt 1 ]; then
    echo "usage: please enter a host name to target."
    exit
  fi

  host=$1
  user='chip'
  pass='chip'
}

main () {
  echo "registering this machine with chip host ..."
  register_push $user $host $pass && \
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
