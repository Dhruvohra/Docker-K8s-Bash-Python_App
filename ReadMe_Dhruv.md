#Dockerfile Details:

1) Import python from dockerhub.
2) Create a working directory app.
3) Copy the requirements.txt file inside the app directory.
4) Install all the dependencies from the requirements.txt file.
5) Copy the entire app project into the app directory.
6) We expose port 5000 as the app will run on port 5000.
7) Define the FLASK_APP environment variable. Else the interpreter may complain it’s unable to find the variable
8) Finally, type in the run command which is flask run --host 0.0.0.0. This is to ensure the server accepts requests from all hosts.



#Building docker images:

##Command
docker build -t myjsonapp .

#Running Flask Dockerized App:

##Command
docker run -p 5001:5000 myjsonapp


//updated port to 5001 becuz when used in mac 5000 is used already by default apply application so not good to kill that process.
