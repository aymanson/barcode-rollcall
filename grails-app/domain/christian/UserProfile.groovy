package christian

class UserProfile {

	Long id;
	String name;
	
	static mapping = {
		version false
		autoTimestamp false
	}
	
    static constraints = {
    }
}
