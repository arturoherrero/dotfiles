#!/usr/bin/env bash

docker-terminal() {
  docker-machine create --driver virtualbox default 2> /dev/null
  eval "$(docker-machine env default)"

  BLUE='\033[0;34m'
  GREEN='\033[0;32m'
  NC='\033[0m'

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

  DOCKER=true bash --login
}
