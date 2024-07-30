#!/usr/bin/env bash

docker_stop_all() {
  docker stop $(docker ps -q)
}

docker_remove_all_containers() {
  docker rm $(docker ps -a -q)
}

docker_remove_all_images() {
  docker rmi $(docker images -q)
}
