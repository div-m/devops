FROM ubuntu:14.04
MAINTAINER divya
RUN apt-get update && apt-get -qq install -y python-all python-pip
RUN sudo pip3 install virtualenv
RUN virtualenv -p python3 env
ENV PATH $PATH:env/bin/activate
ADD . /api/
RUN pip3 install -qr /api/requirements.txt

COPY boot.sh /api/
RUN apt-get -y install apache2
RUN apt-get -y install apache2-prefork-dev
RUN pip3 install mod_wsgi


EXPOSE 5000
EXPOSE 27017
EXPOSE 80

WORKDIR /api
CMD ["sh", "boot.sh"]

