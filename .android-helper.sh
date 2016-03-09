# Update JVM for running Robolectric unit tests from bash
hungryJava() {
	echo "export JAVA_TOOL_OPTIONS=\"-Xmx1024m -XX:MaxPermSize=512m -Xms512m\""
	export JAVA_TOOL_OPTIONS="-Xmx1024m -XX:MaxPermSize=512m -Xms512m"
}
