#!/bin/sh
mkdir ~/.ssh
chmod -R 0700 ~/.ssh
# echo  ${PLUGIN_KEY} > ~/.ssh/id_rsa
cat>~/.ssh/id_rsa<<EOF
${PLUGIN_KEY}
EOF
chmod -R 0600 ~/.ssh/id_rsa
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
echo "=======ssh=id_rsa======="
cat ~/.ssh/id_rsa
cd ${PLUGIN_PATH}
echo "=======pwd======="
pwd
echo "=======ls======="
ls -l
git config --global user.email ${PLUGIN_AUTHOR_NAME}
git config --global user.name ${PLUGIN_AUTHOR_EMAIL}
# echo "=======git init======="
# git init
git remote add deploy ${PLUGIN_REMOTE}
echo "=======git remote -v======="
git remote -v
git add --all
git push ${PLUGIN_REMOTE} ${PLUGIN_BRANCH} --force