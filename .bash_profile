# Show Hidden Files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# Hide Hidden Files in Finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'



alias u="cd .."
alias h="cd ~"
alias ls="ls -la"
alias countObjC="find . \( -iname \*.m -o -iname \*.mm -o -iname \*.c -o -iname \*.cc -o -iname \*.h \) -exec wc -l '{}' \+"
alias countSwift="find . \( -iname \*.swift \) -exec wc -l '{}' \+"
alias clearDerivedData="rm -rf /Users/charlesoder/Library/Developer/Xcode/DerivedData"
export simDir='/Users/charlesoder/Library/Developer/CoreSimulator/Devices/'


editProfile() {
	subl ~/.bash_profile
}

stabilizeMic() {
	while true; do
		echo "set volume input volume ${1}"
		sudo osascript -e "set volume input volume ${1}"
		sleep 2
	done
}


export GIT_PS1_SHOWSTASHSTATE="true"

echo 

# android helper commands
if [ -f ./.android-helper.sh ]; then
  source ./.android-helper.sh
fi
# xCode helper commands
if [ -f ./.xcode-helper.sh ]; then
  source ./.xcode-helper.sh
fi

# StatusSummary for git
if [ -f ./.git-status-summary.sh ]; then
  source ./.git-status-summary.sh
fi

# CommandHelper for git
if [ -f ./.git-command-helper.sh ]; then
  source ./.git-command-helper.sh
fi

# Autocomplete for Git
if [ -f ./.git-completion.bash ]; then
  source ./.git-completion.bash
fi

# Command prompt helper for git
if [ -f ./.git-prompt.sh ]; then
  source ./.git-prompt.sh
fi

export PATH="$HOME/.fastlane/bin:$PATH"

cd ~/Develop
