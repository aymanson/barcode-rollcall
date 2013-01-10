<%@ page import="org.arkvida.church.domain.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'cardId', 'error')} required">
	<label for="cardId">
		<g:message code="userProfile.cardId.label" default="Card Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cardId" type="number" value="${userProfileInstance.cardId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'chiName', 'error')} ">
	<label for="chiName">
		<g:message code="userProfile.chiName.label" default="Chi Name" />
		
	</label>
	<g:textField name="chiName" value="${userProfileInstance?.chiName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'engName', 'error')} ">
	<label for="engName">
		<g:message code="userProfile.engName.label" default="Eng Name" />
		
	</label>
	<g:textField name="engName" value="${userProfileInstance?.engName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="userProfile.sex.label" default="Sex" />
		
	</label>
	<g:textField name="sex" value="${userProfileInstance?.sex}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="userProfile.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${userProfileInstance?.birthday}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="userProfile.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userProfileInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'mobilePhoneNo', 'error')} ">
	<label for="mobilePhoneNo">
		<g:message code="userProfile.mobilePhoneNo.label" default="Mobile Phone No" />
		
	</label>
	<g:textField name="mobilePhoneNo" value="${userProfileInstance?.mobilePhoneNo}"/>
</div>

<g:hiddenField id="district" name="district.id" value="${session["currentDistrictId"]}" />

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'livingDistrict', 'error')} required">
	<label for="livingDistrict">
		<g:message code="userProfile.livingDistrict.label" default="Living District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="livingDistrict" name="livingDistrict.id" from="${org.arkvida.church.domain.LivingDistrict.findAllByDistrict(session["currentDistrict"])}" optionKey="id" required="" value="${userProfileInstance?.livingDistrict?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'gatherings', 'error')} ">
	<label for="gatherings">
		<g:message code="userProfile.gatherings.label" default="Gatherings" />
		
	</label>
	<g:select name="gatherings" from="${org.arkvida.church.domain.Gathering.findAllByDistrict(session["currentDistrict"])}" multiple="multiple" optionKey="id" size="5" value="${userProfileInstance?.gatherings*.id}" class="many-to-many"/>
</div>

