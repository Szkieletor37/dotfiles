cd ~/.ssh
ssh-keygen -t rsa

# register publickey to github
# change name of privatekey

cat id_rsa.pub >> authorized_keys
rm id_rsa.pub -rf

# Host github 
# HostName github.com
# IdentityFile ~/.ssh/id_rsa
# User git
# >> .ssh/config

# ssh -T git@github.com


