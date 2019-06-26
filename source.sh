#!/bin/bash

del_stopped()
{
  local name=$1
  local state=$(sudo docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

  if [[ "$state" == "false" ]]; then
    sudo docker rm $name
  fi
}

exec_if_running()
{
  local name=$1
  local state=$(sudo docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

  if [[ "$state" == "true" ]]; then
    sudo docker exec -it $name bash
  fi
}


#DOCKER_REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo Loading Docker tools...

for load in `find ./ -type f -name ".run.bash"`
do
	. $load
done
