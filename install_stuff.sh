#!/bin/bash

echo 'Install Xcode from the App Store'
open https://itunes.apple.com/us/app/xcode/id497799835?mt=12#

read -n 1 -p 'Press enter when finished...'

sudo xcodebuild -license accept

# Install Homebrew
echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install all cask apps to Applications dir
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap caskroom/cask

echo "Installing cocoapods..."
sudo gem install cocoapods # Password Required

echo "Installing microsoft-office..."
brew cask install microsoft-office # Password Required

# Java
echo "Installing jdk 8..."
brew tap caskroom/versions
brew cask install java8


# Utilities
echo "Installing wget..."
brew install wget

# Text Editor
echo "Installing sublime-text..."
brew cask install sublime-text
# see https://packagecontrol.io for more packages
SUBLIME_DIR=$(ls -la $(which subl) | tr ">" "\n" | tail -1 | sed 's/^ *//')
echo "Setting up sublime packages..."
SUBLIME_PACKAGES_DIR="/Users/$(whoami)/Library/Application Support/Sublime Text 3/Packages"
wget https://packagecontrol.io/Package%20Control.sublime-package -P "$SUBLIME_PACKAGES_DIR/../Installed packages"
mkdir -p "$SUBLIME_PACKAGES_DIR/User/"
cp ./Package\ Control.sublime-settings "$SUBLIME_PACKAGES_DIR/User/"

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
echo "Installing findbugs..."
brew install findbugs

brew cask install fastlane
brew cask install realm-browser

# Company Chat
echo "Installing hipchat..."
brew cask install hipchat

# iOS Build Managemet
echo "Installing carthage..."
brew install carthage

echo "Installing chrome..."
brew cask install google-chrome

echo "Installing teamviewer..."
brew cask install teamviewer

echo "Installing android-studio..."
brew cask install android-studio

echo "Installing disk-inventory-x..."
brew cask install disk-inventory-x

echo "Installing filezilla..."
brew cask install filezilla

echo "Installing gimp..."
brew cask install gimp

echo "Installing VLC media player"
brew cask install vlc

#Load the custom profile into the user's profile
SCRIPTS_DIR=$(pwd)
echo "# Load custom profile" >> ~/.bash_profile
echo "cd $SCRIPTS_DIR" >> ~/.bash_profile
echo "if [ -f ./.bash_profile ]; then" >> ~/.bash_profile
echo "  source ./.bash_profile" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
echo "cd"

source ~/.bash_profile
showFiles

./setup_git.sh

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

