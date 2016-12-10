parse_args () {
  if [ $# -lt 1 ]; then
    echo "usage: please enter a host name to target."
    exit
  fi

  rpi_host=$1
  rpi_user='pi'
}

main () {
  echo "pushing cwd project ..."
  rsync -av ./ "${rpi_user}@${rpi_host}":pico-8/ && \
  echo "project push completed."
}

parse_args $@
main
