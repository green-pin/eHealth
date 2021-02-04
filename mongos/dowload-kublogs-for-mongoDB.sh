#!/bin/bash

if [ ! $1 ]
then
echo 'Enter pach to file on podname. For example: /home/green/mongoLOGS3/filename'
return
fi

if [ ! $2 ]
then
echo 'Enter time. For example: 2021-02-04T02:00:00+00:00'
return
fi

time=$(echo $2)
list=$(cat $1)
dat=$date
IFS=$'\n'
for pod in $list
do
echo "$pod download kubectl logs"
kubectl logs -n me-db $pod --since-time="$time" --kubeconfig=/home/green/.kube/config-PROD > $pod-$time.txt
done
