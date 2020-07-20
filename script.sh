#!/bin/sh
mkdir ~/.ssh
chmod -R 0700 ~/.ssh
cat>~/.ssh/config<<EOF
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EOF
chmod -R 0700 ~/.ssh/config
# echo  ${PLUGIN_KEY} > ~/.ssh/id_rsa
cat>~/.ssh/id_rsa<<EOF
$${PLUGIN_KEY}
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