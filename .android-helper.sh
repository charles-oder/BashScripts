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