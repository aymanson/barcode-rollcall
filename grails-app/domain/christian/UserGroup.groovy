package christian

class UserGroup {

	Long id;
	String name;
	
	static mapping = {
		version false
		autoTimestamp false
		userProfiles joinTable: [name: 'profile_group_mapping']
	}
	
    static constraints = {
    }
	
	static belongsTo = UserProfile
	static hasMany = [userProfiles:UserProfile]
}
