#!/bin/bash

echo 'Install Xcode from the App Store'

read -n 1 -p 'Press enter when finished...'

sudo xcodebuild -license

# Install Homebrew
echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Utilities
echo "Installing openssl..."
brew install openssl
echo "Installing wget..."
brew install wget

# Text Editor
echo "Installing sublime-text..."
brew cask install sublime-text
# see https://packagecontrol.io for more packages
echo "Setting up sublime packages..."
wget https://packagecontrol.io/Package%20Control.sublime-package -P /Users/charlesoder/Library/Application\ Support/Sublime\ Text 3/Packages
cp Package\Control.sublime-settings /Users/charlesoder/Library/Application\ Support/Sublime\ Text 3/Packages/User/

# Update Git
echo "Installing git..."
brew install git

# Code metrics
echo "Installing Code Metric Utilities:"
echo "Installing sloccount..."
brew install sloccount
echo "Installing cloc..."
brew install cloc
echo "Installing pmd..."
brew install pmd
echo "Installing checkstyle..."
brew install checkstyle
echo "Installing swiftlint..."
brew install swiftlint

# Company Chat
echo "Installing hipchat..."
brew cask install hipchat

# iOS Build Managemet
echo "Installing carthage..."
brew install carthage

# Core Data Browser
echo "Installing sqlitebrowser..."
brew install sqlitebrowser

echo "Installing cocoapods..."
sudo gem install cocoapods

echo "Installing odrive..."
brew cask install odrive

echo "Installing chrome..."
brew cask install google-chrome

echo "Installing docker..."
brew install docker
brew install docker-machine
brew cask install docker-compose

echo "Installing teamviewer..."
brew cask install teamviewer

echo "Installing screenhero..."
brew cask install screenhero

echo "Installing limechat..."
brew cask install limechat

echo "Installing microsoft-office..."
brew cask install microsoft-office

echo "Installing android-studio..."
brew cask install android-studio

echo "Installing disk-inventory-x..."
brew cask install disk-inventory-x

echo "Installing paw..."
brew cask install paw

echo "Installing filezilla..."
brew cask install filezilla

echo "Installing intellij community edition..."
brew cask install intellij-idea-ce

echo "Installing messenger..."
brew cask install messenger

echo "Installing steam..."
brew cask install steam

echo "Installing gimp..."
brew cask install gimp

echo "Installing carbon-copy-cloner..."
brew cask install carbon-copy-cloner

echo "Installing AnyConnect..."
echo "domain: err.dtn.com"
open ./anyconnect-macosx-3.1.05170-web-deploy-k9.dmg

#Load the custom profile into the user's profile
echo "# Load custom profile" >> ~/.bash_profile
echo "if [ -f ./.bash_profile ]; then" >> ~/.bash_profile
echo "  source ./.bash_profile" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
