#!/bin/bash

echo 'Install Xcode from the App Store'

read -n 1 -p 'Press enter when finished...'

sudo xcodebuild -license

curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Utilities
brew install openssl
brew install wget

# Text Editor
brew cask install sublime-text
# see https://packagecontrol.io for more packages
wget https://packagecontrol.io/Package%20Control.sublime-package -P /Users/charlesoder/Library/Application\ Support/Sublime\ Text 3/Packages
cp Package\Control.sublime-settings /Users/charlesoder/Library/Application\ Support/Sublime\ Text 3/Packages/User/

# Update Git
brew install git

# Code metrics
brew install sloccount
brew install cloc
brew install pmd
brew install checkstyle
brew install swiftlint

# Company Chat
brew cask install hipchat

# iOS Build Managemet
brew install carthage

# Core Data Browser
brew install sqlitebrowser

echo 'Install Cocoapods: "sudo gem install cocoapods"'

#Load the custom profile into the user's profile
echo "# Load custom profile" >> ~/.bash_profile
echo "if [ -f ./.bash_profile ]; then" >> ~/.bash_profile
echo "  source ./.bash_profile" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
