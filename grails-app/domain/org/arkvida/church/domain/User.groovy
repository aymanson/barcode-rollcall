package org.arkvida.church.domain

class User {
	
	String login
	String password
	Date dateCreated
	Date lastUpdated
	UserProfile userProfile
	
    static constraints = {
		login maxSize: 25, blank: false, unique: true
		password maxSize: 50, blank: false
		userProfile blank: false, unique: true
    }
	
	static mapping = {
		id generator: 'assigned', name: "login", type: 'string'
	}
}
