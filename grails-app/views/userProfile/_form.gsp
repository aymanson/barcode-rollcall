<%@ page import="christian.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="userProfile.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userProfileInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="userProfile.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${userProfileInstance?.birthday}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'chiName', 'error')} ">
	<label for="chiName">
		<g:message code="userProfile.chiName.label" default="Chi Name" />
		
	</label>
	<g:textField name="chiName" value="${userProfileInstance?.chiName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="userProfile.district.label" default="District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="district" name="district.id" from="${christian.District.list()}" optionKey="id" optionValue="displayName" required="" value="${userProfileInstance?.district?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'engName', 'error')} ">
	<label for="engName">
		<g:message code="userProfile.engName.label" default="Eng Name" />
		
	</label>
	<g:textField name="engName" value="${userProfileInstance?.engName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'lastUpdateBy', 'error')} required">
	<label for="lastUpdateBy">
		<g:message code="userProfile.lastUpdateBy.label" default="Last Update By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdateBy" type="number" value="${userProfileInstance.lastUpdateBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'lastUpdateDate', 'error')} required">
	<label for="lastUpdateDate">
		<g:message code="userProfile.lastUpdateDate.label" default="Last Update Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastUpdateDate" precision="day"  value="${userProfileInstance?.lastUpdateDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="userProfile.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${userProfileInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'mobilePhoneNo', 'error')} ">
	<label for="mobilePhoneNo">
		<g:message code="userProfile.mobilePhoneNo.label" default="Mobile Phone No" />
		
	</label>
	<g:textField name="mobilePhoneNo" value="${userProfileInstance?.mobilePhoneNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="userProfile.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userProfileInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'sex', 'error')} required">
	<label for="sex">
		<g:message code="userProfile.sex.label" default="Sex" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sex" value="${userProfileInstance?.sex}"/>	
</div>


<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'cardId', 'error')} required">
	<label for="cardId">
		<g:message code="userProfile.cardId.label" default="Card Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cardId" type="number" value="${userProfileInstance.cardId}" required=""/>
</div>


<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'subDistrict', 'error')} required">
	<label for="subDistrict">
		<g:message code="userProfile.subDistrict.label" default="Sub District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subDistrict" name="subDistrict.id" from="${christian.SubDistrict.list()}" optionKey="id" optionValue="displayName" required="" value="${userProfileInstance?.subDistrict?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'userGroups', 'error')} ">
	<label for="userGroups">
		<g:message code="userProfile.userGroups.label" default="User Groups" />
		
	</label>
	<g:select name="userGroups" from="${christian.UserGroup.list()}" multiple="multiple" optionKey="id" optionValue="name" size="5" value="${userProfileInstance?.userGroups*.id}" class="many-to-many"/>
</div>


