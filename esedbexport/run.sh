#!/bin/bash

del_stopped(){
  local name=$1
  local state=$(docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

  if [[ "$state" == "false" ]]; then
    docker rm $name
  fi
}

exec_if_running(){
  local name=$1
  local state=$(docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

  if [[ "$state" == "true" ]]; then
    docker exec -it $name bash
  fi
}

run_it(){
	local name=$1
	local state=$(doker inspect --format "{{.State.Running}}" $name 2>/dev/null)

	if [[ "$state" == "true" ]]; then
		del_stopped $name
	fi

	docker run -net=host --name $name -v /secure/home/:/secure/home/ -it esedbexport:latest ""
}

del_stopped esedbexport
docker run --net=host --name esedbexport -v /secure/home/:/secure/home/ -it esedbexport:latest "$@"