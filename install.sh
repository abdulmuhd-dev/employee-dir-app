#!/bin/bash -ex
wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com
apt -y install unzip
unzip FlaskApp.zip
cd FlaskApp/
apt -y install python3-pip
apt -y install python3-venv
apt -y install python3-flask
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
apt -y install stress
export PHOTOS_BUCKET=${SUB_PHOTOS_BUCKET}
export AWS_DEFAULT_REGION=us-east-1
export DYNAMO_MODE=on
FLASK_APP=application.py flask run --host=0.0.0.0 --port=80