package christian

import java.util.Date;

class UserProfile {

	Long id;
	String login;
	String password;
	
	String chiName;
	String engName;
	Character sex;
	Date birthday;
	String address;
	String mobilePhoneNo;
	Long lastUpdateBy;
	Date lastUpdateDate;
	
	District district;
	SubDistrict subDistrict;
	
	static mapping = {
		version false
		autoTimestamp false
		userGroups joinTable: [name: 'profile_group_mapping']
	}
	
    static constraints = {
    }
	
	static hasMany = [userGroups:UserGroup]
}
