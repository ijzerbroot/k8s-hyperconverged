#!/bin/sh
set -x

export nodes="10.1.1.10 10.1.1.11 10.1.1.12 10.1.1.13"
sudo docker stop weavescope
sudo docker rm weavescope
sudo curl -L git.io/scope -o /usr/local/bin/scope
sudo chmod a+x /usr/local/bin/scope
export mynode=`hostname -i`
export nodelist="`echo $nodes | sed \"s/${mynode} //\"`"
sudo /usr/local/bin/scope launch --weave=false --probe.kubernetes=true --probe.docker=true $nodelist

sudo docker update --restart=always weavescope
