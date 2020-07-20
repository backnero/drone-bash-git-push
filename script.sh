#!/bin/sh
mkdir ~/.ssh
chmod -R 0700 ~/.ssh
echo "Host *" > ~/.ssh/config
echo "AddKeysToAgent yes" > ~/.ssh/config
echo "UseKeychain yes" > ~/.ssh/config
echo "IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
chmod -R 0700 ~/.ssh/config
# echo  ${PLUGIN_KEY} > ~/.ssh/id_rsa
cat>~/.ssh/id_rsa<<EOF
${PLUGIN_KEY}
EOF
chmod -R 0600 ~/.ssh/id_rsa
echo "=======ssh=config======="
cat ~/.ssh/config
echo "=======ssh=id_rsa======="
cat ~/.ssh/id_rsa
cd ${PLUGIN_PATH}
echo "=======pwd======="
pwd
echo "=======ls======="
ls -l
# echo "=======git init======="
# git init
git remote add deploy ${PLUGIN_REMOTE}
echo "=======git remote -v======="
git remote -v
git add --all
git push ${PLUGIN_REMOTE} ${PLUGIN_BRANCH} --force