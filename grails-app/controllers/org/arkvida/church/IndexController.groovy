package org.arkvida.church

import org.arkvida.church.domain.*;

class IndexController {

	def index() {
		if (params.districtId != null) {
			session["currentDistrictId"] = params.districtId;
			session["currentDistrict"] = District.findById(params.districtId);
			System.out.println("Set to specified" + session["currentDistrictId"]);
		}
		if (session["currentDistrictId"] == null) {
			def districts = District.list();
			if ( districts ) {
				session["currentDistrict"] = districts[0];
				session["currentDistrictId"] = districts[0].id;
				System.out.println("Set default " + session["currentDistrictId"]);
			}
		}
	}
	
}
