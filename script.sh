#! bin/bash

# Building Docker Images for Both Apps
echo "Welcome"
cd app1
echo "Creating Docker Image for app1"
docker build -t myjsonapp:v1 .
echo "Image for App1 Created with name myjsonapp:v1"
cd ..
cd app2
echo "Creating Docker Image for app2"
docker build -t myjsonapp2:v1 .
echo "Image for App2 Created with name myjsonapp2:v1"
cd ..




# Commands to run K8s Deployment and service for app1 and exposing port to hit from host machine.
cd app1
kubectl apply -f deployment.yaml
echo "App1 Deployment Created"
kubectl apply -f service.yaml
echo "App1 Service Created"
kubectl port-forward svc/json-python-svc 5200:5200
echo "Port Forwading Done to use ClusterIP port in Minikube"
minikube svc json-python-svc --url


cd ..

# Commands to run K8s Deployment and service for app2 and exposing port to hit from host machine.
cd app2
kubectl apply -f deployment-app2.yaml
echo "App2 Deployment Created"
kubectl apply -f service-app2.yaml
echo "App2 Service Created"
kubectl port-forward svc/json-python-svc 5200:5200
echo "Port Forwading Done to use ClusterIP port in Minikube"
minikube svc json-python-svc2 --url
