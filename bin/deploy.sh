#!/usr/bin/env bash

set -e

echo "==== Configuring dependencies for production ===="

source venv/bin/activate
virtualenv --clear venv
pip install -r requirements.txt
rm -rf libs
linkenv venv/lib/python2.7/site-packages libs

echo "==== Deploying app to App Engine ===="

appcfg.py update app.yaml --no_cookies

bash bin/dev.sh
