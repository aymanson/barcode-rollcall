package org.arkvida.church.domain

class AssemblyDistrict {

	Long id;
	String name;
	String code;
	Date dateCreated;
	Date lastUpdated;
	
    static constraints = {
		code size: 2..2, blank: false
		name size: 1..50, blank: false
    }
	
	static mapping = {
	}
	
	public String toString() {
		return String.format("%s - %s", code, name);
	}
}
