package org.arkvida.church.domain

class Gathering {
	
	Long id;
	String name;
	GatheringType gatheringType;
	District district;
	Date dateCreated;
	Date lastUpdated;
	
    static constraints = {
    }
	
	public String toString() {
		return String.format("%s", name);
	}
	
	static hasMany = [userProfiles: UserProfile]
	
	static mapping = {
		userProfiles column: 'user_profile_id',
			   joinTable: 'user_profile_gathering'
	}
	static belongsTo = UserProfile
}
