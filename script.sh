#!/bin/sh
mkdir ~/.ssh
chmod -R 0700 ~/.ssh
echo "LogLevel=quiet" > ~/.ssh/config
chmod -R 0700 ~/.ssh/config
echo  ${PLUGIN_KEY} > ~/.ssh/id_rsa
chmod -R 0600 ~/.ssh/id_rsa
echo "=======ssh=config======="
cat ~/.ssh/config
echo "=======ssh=id_rsa======="
cat ~/.ssh/id_rsa
cd ${PLUGIN_PATH}
git init
git remote add deploy ${PLUGIN_REMOTE}
git add .
git push deploy ${PLUGIN_BRANCH} --force