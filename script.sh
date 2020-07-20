#!/bin/sh

if [ ！ -z ${PLUGIN_PATH}];then
    cd ${PLUGIN_PATH}
fi
if [ ! -d "~/.ssh"];then
    mkdir ~/.ssh
    chmod -R 0700 ~/.ssh
fi
echo "LogLevel=quiet" > ~/.ssh/config
chmod -R 0700 ~/.ssh/config
echo  ${PLUGIN_KEY} > ~/.ssh/id_rsa
chmod -R 0600 ~/.ssh/id_rsa
git remote add deploy ${PLUGIN_REMOTE}
git add --all
git diff-index --quiet HEAD --ignore-submodules
git push deploy HEAD:${PLUGIN_BRANCH} --force