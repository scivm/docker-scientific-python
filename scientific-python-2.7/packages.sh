#!/bin/bash
virtualenv --python=python2.7 /opt/ve
source /opt/ve/bin/activate
chmod 775 /tmp/requirements.sh
/tmp/requirements.sh
