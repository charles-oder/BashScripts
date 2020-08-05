# Update JVM for running Robolectric unit tests from bash
hungryJava() {
	echo "export JAVA_TOOL_OPTIONS=\"-Xmx1024m -XX:MaxPermSize=512m -Xms512m\""
	export JAVA_TOOL_OPTIONS="-Xmx1024m -XX:MaxPermSize=512m -Xms512m"
}

androidStudio() {
	if [ -z "$1" ]; 
		then DIR=$(pwd); 
		else DIR=$1; 
	fi
	echo "Opening $DIR"
	open -a /Applications/Android\ Studio.app/ $DIR
}

runHeadUnit() {
	OLD_DIR=$(pwd)
	echo "Enable Developer Mode in the Android Auto Mobile App"
	echo "Then start the head unit server from the Android Auto App settings"
	ADB_LOCATION=$(which adb)
	$ADB_LOCATION forward tcp:5277 tcp:5277
	/Users/charlesoder/Library/Android/sdk/extras/google/auto/desktop-head-unit
}
