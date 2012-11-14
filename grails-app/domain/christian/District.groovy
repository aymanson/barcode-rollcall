package christian

class District {

	Long id;
	String name;
	String code;
	
    static constraints = {
		code size: 2..2, blank: false
		name size: 1..50, blank: false
    }
	
	static mapping = {
		version false
		autoTimestamp false
	}
	
	public String getDisplayName() {
		return String.format("%s - %s", code, name);
	}
}
