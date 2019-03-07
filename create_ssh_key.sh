#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SCRIPT_DIR/confirmation.sh
ls $SCRIPT_DIR/confirmation.sh
echo "Enter name (id_rsa):"
read FILE_NAME
if [ $FILE_NAME = "" ]; then
	FILE_NAME="id_rsa_2"
fi
FILE_PATH=~/.ssh/$FILE_NAME
ssh-keygen -t rsa -f $FILE_PATH
echo "adding SSH key to keychain..."
if confirm; then
	ssh-add -K ~/.ssh/$FILE_NAME
	echo "" >> ~/.ssh/config
	echo "Host *" >> ~/.ssh/config
	echo "	UseKeychain yes" >> ~/.ssh/config
	echo "	AddKeysToAgent yes" >> ~/.ssh/config
	echo "	IdentityFile /.ssh/$FILE_NAME" >> ~/.ssh/config
fi
