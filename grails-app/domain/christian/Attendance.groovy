package christian

class Attendance {

	Long id;
	Long userProfileId;
	Date date;
	Date arrivalTime;
	
	static mapping = {
		version false
		autoTimestamp false
	}
	
    static constraints = {
    }
}
