#!/bin/bash

brew install jenkins

cd ~/Downloads
wget https://github.com/fastlane/jenkins-app/releases/download/1.0/Jenkins.zip
unzip ./Jenkins.zip -d /usr/local/bin/

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/usr/local/bin/Jenkins.app", hidden:false}' 
