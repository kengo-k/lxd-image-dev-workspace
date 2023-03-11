#!/bin/bash

while true; do
  status=`lxc exec workspace -- cloud-init status`
  if [[ $status == "status: done" ]]; then
    echo "$status"
    break
  else
    echo "$status"
    sleep 5
  fi
done
