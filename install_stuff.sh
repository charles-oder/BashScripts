echo 'Install Xcode from the App Store'

read -n 1 -p 'Press enter to continue...'

sudo xcodebuild -license

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install Caskroom/cask/sublime-text

brew install git

brew install carthage

brew install cloc

brew install swiftlint

brew install Caskroom/cask/hipchat

brew install sqlitebrowser

echo 'Install Cocoapods: "sudo gem install cocoapods"'

