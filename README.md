This is a template for the automation  that stands up local dev environment of the stack. It uses Vagrant, Docker, Flask and Apache HTTP Server.

Apache creates a new flask application for every HTTP request.

A Docker image which includes the flask applications, its dependencies(Mongo DB) and Apache HTTP Server is built and run.

Usage:

1) Login to mongo inside the container and run the below command:

export mongo DockerIP:Port < dbauto.js

2) Export MONGODB in auth_service and data_service

3) Start the Docker Container

4) Verify DockerIP/api/auth works.
