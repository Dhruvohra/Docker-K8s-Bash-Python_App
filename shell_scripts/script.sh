echo "Script Started Execution ...."

# Entering minikube environment to access docker images inside that virtual env.
eval $(minikube docker-env)

#Deleting Docker Images if created to remove redudancy
echo "Deleting Docker images"
docker rmi -f myjsonapp:v1 myjsonapp2:v1
if [ $? -eq 0 ]; then
    echo "Images Deleted Successfully"
else
    echo "Images Not Present or Error Occured"
fi

# Building Docker Images for Both Apps
cd ..
cd app1
echo "Creating Docker Image for app1"
docker build -t myjsonapp:v1 .
if [ $? -eq 0 ]; then
    echo "Image for App1 Created with name myjsonapp:v1"
else
    echo "Error Occured in Creating App1 Image"
fi
 
cd ..
cd app2
echo "Creating Docker Image for app2"
docker build -t myjsonapp2:v1 .
if [ $? -eq 0 ]; then
    echo "Image for App2 Created with name myjsonapp2:v1"
else
    echo "Error Occured in Creating App2 Image"
fi

cd ..

read -p "Press enter to continue"


# Commands to run K8s Deployment and service for app1 and exposing port to hit from host machine.
cd app1
kubectl apply -f deployment.yaml
if [ $? -eq 0 ]; then
    echo "App1 Deployment Created"
else
    echo "Error Occured in Creating App1 Deployment"
fi

kubectl apply -f service.yaml
if [ $? -eq 0 ]; then
    echo "App1 Service Created"
else
    echo "Error Occured in Creating App1 Service"
fi

cd ..

# Commands to run K8s Deployment and service for app2 and exposing port to hit from host machine.

cd app2

kubectl apply -f deployment-app2.yaml
if [ $? -eq 0 ]; then
    echo "App2 Deployment Created"
else
    echo "Error Occured in Creating App2 Deployment"
fi

kubectl apply -f service-app2.yaml

if [ $? -eq 0 ]; then
    echo "App2 Service Created"
else
    echo "Error Occured in Creating App2 Service"
fi

