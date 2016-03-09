
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
