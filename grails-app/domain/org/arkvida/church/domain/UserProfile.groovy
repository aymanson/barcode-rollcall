package org.arkvida.church.domain

import java.text.NumberFormat

class UserProfile {

	Long id;
	String chiName;
	String engName;
	String sex;
	Date birthday;
	String address;
	String homeContact;
	String mobileContact;
	String officeContact;
	OccupationStatus occupationStatus;
	Date baptistDate;
	String referrer; 
	String baptist;
	String remarks;
	String statusSummary;
	String email; 
	Integer cardId;
	
	AssemblyDistrict assemblyDistrict;
	LivingDistrict livingDistrict;
	Date dateCreated;
	Date lastUpdated;
	
	static mapping = {
		gatherings column:'gathering_id', joinTable: 'user_profile_gathering'
	}
	
    static constraints = {
		cardId validator: { val, obj ->
			return (UserProfile.countByDistrictAndCardId(obj.district, val) == 0);
		}
		chiName()
		engName()
		sex()
		birthday()
		address()
		mobileContact()
		assemblyDistrict()
		livingDistrict()
		gatherings()
    }
	
	static hasMany = [gatherings:Gathering]

	public String getCardSerial() {
		def numberFormat = NumberFormat.getInstance();
		numberFormat.setMinimumIntegerDigits(3);
		return district.code + livingDistrict.code + numberFormat.format(cardId);
	}
	
	public String toString() {
		return String.format("%s - %s", getCardSerial(), chiName);
	}
}
