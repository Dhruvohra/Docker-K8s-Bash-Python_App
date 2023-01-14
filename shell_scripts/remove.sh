echo "Deleting App1 Deployment"
kubectl delete deployment app1-deployment
if [ $? -eq 0 ]; then
    echo "App1 Deployment Deleted Successfully"
else
    echo "Error Occured in Deleting App1 Deployment"
fi

echo "Deleting App2 Deployment"
kubectl delete deployment app2-deployment
if [ $? -eq 0 ]; then
    echo "App2 Deployment Deleted Successfully"
else
    echo "Error Occured in Deleting App2 Deployment"
fi

echo "Deleting App1 Service"
kubectl delete service json-python-svc
if [ $? -eq 0 ]; then
    echo "App1 Service Deleted Successfully"
else
    echo "Error Occured in Deleting App1 Service"
fi

echo "Deleting App2 Service"
kubectl delete service json-python-svc2
if [ $? -eq 0 ]; then
    echo "App2 Service Deleted Successfully"
else
    echo "Error Occured in Deleting App2 Service"
fi