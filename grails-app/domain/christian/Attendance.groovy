package christian

class Attendance {

	Long id;
	Long userProfileId;
	Date date;
	Date recordTime;
	
	static mapping = {
		version false
		autoTimestamp false
	}
	
    static constraints = {
    }
}
