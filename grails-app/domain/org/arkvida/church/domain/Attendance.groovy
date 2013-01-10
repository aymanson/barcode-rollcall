package org.arkvida.church.domain

class Attendance {

	Long id;
	String cardSerial;
	Long userProfileId;
	Long gatheringId;
	Date gatheringDate;
	Date dateCreated;
	
	static mapping = {
		version false
	}
	
    static constraints = {
		cardSerial blank: false, size: 7..7
		userProfileId blank: false
		gatheringId blank: false
    }
}
