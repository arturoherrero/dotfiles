#!/usr/bin/env bash

docker-terminal() {
  gvar DOCKER_TERMINAL_COUNT=$(($(gvar DOCKER_TERMINAL_COUNT) + 1))

  docker-machine create --driver virtualbox default 2> /dev/null
  docker-machine start default 2> /dev/null
  eval "$(docker-machine env default)"

  local BLUE='\033[0;34m'
  local GREEN='\033[0;32m'
  local NC='\033[0m'

  cat << EOF


                          ##         .
                    ## ## ##        ==
                 ## ## ## ## ##    ===
             /"""""""""""""""""\___/ ===
        ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
             \______ o           __/
               \    \         __/
                \____\_______/


EOF
  echo -e "${BLUE}docker${NC} is configured to use the ${GREEN}default${NC} machine with IP ${GREEN}$(docker-machine ip default)${NC}"
  echo

  DOCKER_TERMINAL=true bash --login
}

on_exit() {
  if [ "$DOCKER_TERMINAL" = true ]; then
    gvar DOCKER_TERMINAL_COUNT=$(($(gvar DOCKER_TERMINAL_COUNT) - 1))

    if (($(gvar DOCKER_TERMINAL_COUNT) == 0)); then
      docker-machine stop default
    fi
  fi
}

trap on_exit EXIT

docker_stop_all() {
  docker stop $(docker ps -q)
}

docker_remove_all_containers() {
  docker rm $(docker ps -a -q)
}

docker_remove_all_images() {
  docker rmi $(docker images -q)
}
