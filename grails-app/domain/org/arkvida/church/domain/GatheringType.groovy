package org.arkvida.church.domain

class GatheringType {

	Long id;
	String name;
	Date dateCreated;
	Date lastUpdated;
	
    static constraints = {
    }
	
	public String toString() {
		return String.format("%s", name);
	}
}
