# Show Hidden Files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# Hide Hidden Files in Finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


cd ~/Documents/Developer

alias u="cd .."
alias h="cd ~"
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport//bin/subl -w"
alias countObjC="find . \( -iname \*.m -o -iname \*.mm -o -iname \*.c -o -iname \*.cc -o -iname \*.h \) -exec wc -l '{}' \+"
alias countSwift="find . \( -iname \*.swift \) -exec wc -l '{}' \+"
alias clearDerivedData="rm -rf /Users/charlesoder/Library/Developer/Xcode/DerivedData/*"
export simDir='/Users/charlesoder/Library/Developer/CoreSimulator/Devices/'

# Update JVM for running Robolectric unit tests from bash
hungryJava() {
	echo "export JAVA_TOOL_OPTIONS=\"-Xmx1024m -XX:MaxPermSize=512m -Xms512m\""
	export JAVA_TOOL_OPTIONS="-Xmx1024m -XX:MaxPermSize=512m -Xms512m"
}

editProfile() {
	sublime ~/.bash_profile
}

ws() {
	open *.xcworkspace
}

incrementXcodeBuildNumber() {
	INFOPLIST="${1}"
	echo $1
	buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFOPLIST")
	buildNumber=$(($buildNumber + 1))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$INFOPLIST"
	git add $1
	ci "Incremented build number"
}

export GIT_PS1_SHOWSTASHSTATE="true"

# StatusSummary for git
if [ -f ~/.git-status-summary.sh ]; then
  source ~/.git-status-summary.sh
fi

# CommandHelper for git
if [ -f ~/.git-command-helper.sh ]; then
  source ~/.git-command-helper.sh
fi

# Autocomplete for Git
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# Command prompt helper for git
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

#.NET Execution Environment
[ -s "/Users/charlesoder/.dnx/dnvm/dnvm.sh" ] && . "/Users/charlesoder/.dnx/dnvm/dnvm.sh" # Load dnvm
