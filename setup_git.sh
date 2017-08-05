git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'

read -p "enter git email: " EMAIL
read -p "enter git username: " USERNAME

git config --global user.email $EMAIL
git config --global user.name $USERNAME
