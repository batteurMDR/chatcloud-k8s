#!/bin/sh

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm repo add appscode https://charts.appscode.com/stable/
helm repo update
helm install stash-operator appscode/stash --version v0.9.0-rc.2 --namespace kube-system
helm install stash-mariadb-10.5.8 appscode/stash-mariadb -n kube-system --version=10.5.8

kubectl apply -f monitoring/metric-server.yml
kubectl apply -f monitoring/prometheus.yml
kubectl apply -f secrets/secret.yml
kubectl apply -f redis/redis-deployment.yml
kubectl apply -f redis/redis-svc.yml
kubectl apply -f db/mariadb-pv.yml
kubectl apply -f db/mariadb-deployment.yml
kubectl apply -f db/mariadb-svc.yml
kubectl apply -f db/mariadb-appbinding.yml
kubectl apply -f back/chatcloud-back-deployment.yml
kubectl apply -f back/chatcloud-back-svc.yml
kubectl apply -f front/chatcloud-front-cm.yml
kubectl apply -f front/chatcloud-front-deployment.yml
kubectl apply -f front/chatcloud-front-svc.yml

kubectl apply -f backup/backup-repository.yml
kubectl apply -f backup/backup-config.yml

kubectl autoscale deployment chatcloud-back --cpu-percent=50 --min=1 --max=10 
kubectl autoscale deployment chatcloud-front --cpu-percent=80 --min=1 --max=5
