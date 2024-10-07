#!/bin/bash -ex
cd home/ubuntu
apt update
apt -y install git
git clone https://github.com/abdulmuhd-dev/employee-dir-app.git
cd employee-dir-app/
apt -y install python3-pip
apt -y install python3-venv
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
apt -y install stress
export PHOTOS_BUCKET="bucket_name"
export AWS_DEFAULT_REGION=us-east-1
export DYNAMO_MODE=on
FLASK_APP=application.py flask run --host=0.0.0.0 --port=80