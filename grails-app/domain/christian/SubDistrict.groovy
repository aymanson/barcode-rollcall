package christian

class SubDistrict {

	Long id;
	String name;
	String code;
	District district;
	
	static mapping = {
		version false
		autoTimestamp false
	}
	
    static constraints = {
		code size: 2..2, blank: false
		name size: 1..50, blank: false
    }
	
	public String getDisplayName() {
		return String.format("%s - %s", code, name);
	}
}
