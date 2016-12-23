This is a template for the automation that stands up local dev environment of the stack. It uses Vagrant, Docker, Flask, Mongo DB and Apache HTTP Server.

Apache creates a new flask application for every HTTP request. The functionality of this template is that only authenticated users can access database and perform actions.

This repository contains 3 examples:
1) A Docker image which includes the flask applications, its dependencies(Mongo DB) and Apache HTTP Server is built and run.
2) Docker File and Docker Compose file is created for users to get authenticated easily.
3) Python code is written to Create S3 buckets, Delete S3 Buckets and upload files in AWS.
