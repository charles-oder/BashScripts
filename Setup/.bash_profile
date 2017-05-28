cd BashScripts

export PATH="$HOME/.fastlane/bin:$PATH"

if [ -f ./.bash_profile ]; then
  source ./.bash_profile
fi

ssh-add