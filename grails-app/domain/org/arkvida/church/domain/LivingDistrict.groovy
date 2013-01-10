package org.arkvida.church.domain

class LivingDistrict {

	Long id;
	String name;
	String code;
	Date dateCreated;
	Date lastUpdated;
	District district;
	
    static constraints = {
		code validator: { val, obj ->
			return (LivingDistrict.countByDistrictAndCode(obj.district, val) == 0);
		}
    }
	
	public String toString() {
		return String.format("%s - %s", code, name);
	}
}
