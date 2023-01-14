# How to Run this Project

## Step-1) Cloned the repository

## Step-2) cd /foldername

Note: before executing Step-3) script.sh ensure you have pre-requisites installed on the host machine to run the Project i.e

Pre-requisites: 
1) Install Kubectl
2) Install Docker
3) Install Minikube (with hyperkit or VirtualBox)

Note: pre-requisite.sh works for linux ubuntu system for other system the installations of pre-requisites may vary.

If you haven't installed them yet execute pre-requisite.sh script by:

Command: chmod 777 pre-requisite.sh
Command: ./pre-requisite.sh

Note: You have to accept certain agreements it ask for say click on yes or press y and enter.

## Step-3) chmod 777 script.sh

## Step-4) ./script.sh

#As we have created the dockerfile and build the images, plus executes the k8s deployments and service via shell script now its the time to open the external ports for apps to access from host machine.
#This is an additional step becuz of minikube.

## Step-5) minikube service json-python-svc --url

#This will provide you with a link you can open that and it will give you json response which app1 needs to showcase.
Note: If you press cntr-c it will exit and then you'll not be able to hit the app from host so open new terminal for app2 to go ahead. 

For Ex: this gives link as: http://127.0.0.1:55588/ on this port you'll be able to access general app page rendering static json data.
but on this http://127.0.0.1:55588/file link you can access data rendered from file fcc.json which you can edit and check updates via executing ./script.sh again. Good Practice would be to use commands as:

1) ./remove.sh
2) ./script.sh

As this will remove the previously created resources and generate new ones. 

#Doing the same thing for App2 exposing port to access from host machine.
#It will displays a fully reversed message text rendered dynamically from app1.

## Step-6) minikube service json-python-svc2 --url

For Ex: link like this created after this http://127.0.0.1:55588/ will render reversed json text(hardcoded one) and http://127.0.0.1:55588/rev will render reverse json picked from app1 which inturns coming from fcc.json file.


Additional Steps: If wanted to check for cluster Ip Ports on host machine these commands can be run:

#Port Forwading Done to use ClusterIP port in Minikube so now we can check by hitting http://localhost:5200 for app1 by pasting this in browser.
## Step-7) kubectl port-forward svc/json-python-svc 5200:5200

#Port Forwading Done to use ClusterIP port in Minikube so now we can check by hitting http://localhost:5201 for app2 by pasting this in browser.
## Step-8) kubectl port-forward svc/json-python-svc2 5201:5201



### Dockerfile Details:

1) Import python from dockerhub.
2) Create a working directory app.
3) Copy the requirements.txt file inside the app directory.
4) Install all the dependencies from the requirements.txt file.
5) Copy the entire app project into the app directory.
6) We expose port 5000 as the app will run on port 5000.
7) Define the FLASK_APP environment variable. Else the interpreter may complain it’s unable to find the variable
8) Finally, type in the run command which is flask run --host 0.0.0.0. This is to ensure the server accepts requests from all hosts.

### Docker-compose.yaml:

Additional file created to run the applications without minikube k8s so through this we can create the working applications using docker only. Would need to ust change the app endpoints to run the app from this file.

### script.sh Automatic bash script to execute both the applications inside minikube k8s using docker.

1) Enters minikube environment
2) Deleting docker images so that fresh one's doesnt mix with them.
3) Creating fresh docker images for both the application.
4) App1 Deploymnet and Service created and deployed to execute the app.
5) App2 Deploymnet and Service created and deployed to execute the app.

### remove.sh is bash script which destroys/delete the resources created for running this application. So whatever we create via script.sh file it will be delete via remove.sh file.

### app1 folder has all the files to run the application:
    1) main.py: python flask app to render json data.
    2) fcc.json: File which has json data.
    3) requirements.txt: file which has all the dependencies required to run the python main.py file.
    4) Dockerfile: File used to create docker images.
    5) deployemnt.yaml: Used to create k8s deployments(creates pods as well).
    6) service.yaml: Used to create services in k8s which helps external user communicate with the pods and deployments.

### app2 folder has all the files to run the application:
    1) main.py: python flask app to render json data.
    2) requirements.txt: file which has all the dependencies required to run the python main.py file.
    3) Dockerfile: File used to create docker images.
    4) deployemnt-app2.yaml: Used to create k8s deployments(creates pods as well).
    5) service-app2.yaml: Used to create services in k8s which helps external user communicate with the pods and deployments.
