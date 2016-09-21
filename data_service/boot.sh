#!/usr/bin/env bash

adduser --disabled-password --gecos '' abc
cd /api/data_service/
mod_wsgi-express setup-server wsgi.py --port=80 --user abc --group abc --server-root=/etc/api --socket-timeout=600
chmod a+x /etc/api/handler.wsgi
/etc/api/apachectl start
tail -f /etc/api/error_log
