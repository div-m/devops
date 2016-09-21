FROM ubuntu:14.04
MAINTAINER divya

RUN apt-get -qq update && apt-get -qq install -y libssl-dev openssl wget apt-utils make
RUN wget -qq --no-check-certificate https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
RUN tar -xvzf Python-3.5.0.tgz
RUN cd Python-3.5.0 && ./configure --enable-shared --prefix=/usr/local LDFLAGS="-Wl,--rpath=/usr/local/lib"
RUN cd Python-3.5.0 && make && make install
RUN sudo pip3 install virtualenv

VOLUME ["/api"]
WORKDIR /api


RUN virtualenv -p python3 env
ENV PATH $PATH:env/bin/activate

RUN \
   apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
      echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list && \
         apt-get update && \
	    apt-get install -y mongodb-org

RUN sed -e '/bind/ s/^#*/#/' -i /etc/mongod.conf
RUN sed -e '/port/ s/^#*/#/' -i /etc/mongod.conf
RUN sed -e '/nofile/ s/^#*/#/' -i /etc/init/mongod.conf

ADD auth_service/requirements.txt /api/

RUN pip3 install -r requirements.txt

RUN apt-get -y install apache2
RUN apt-get -y install apache2-prefork-dev
RUN pip3 install mod_wsgi


EXPOSE 5000
EXPOSE 27017
EXPOSE 80

CMD /data/auth_service/boot.sh


