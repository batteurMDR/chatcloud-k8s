kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl autoscale deployment chatcloud-back --cpu-percent=50 --min=1 --max=10 
kubectl autoscale deployment chatcloud-front --cpu-percent=80 --min=1 --max=5