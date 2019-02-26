

cat >> $1.java << EOL
public class $1 {
	public static void main(String[] args) {
	// Prints "Hello, World" to the terminal window.
		System.out.println("Hello, $2");
	}
}
EOL

javac $1.java
java $1.class

rm -rf $1.java
rm -rf $1.class
