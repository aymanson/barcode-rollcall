
<%@ page import="christian.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userProfile">
			
				<g:if test="${userProfileInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="userProfile.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userProfileInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="userProfile.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${userProfileInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.chiName}">
				<li class="fieldcontain">
					<span id="chiName-label" class="property-label"><g:message code="userProfile.chiName.label" default="Chi Name" /></span>
					
						<span class="property-value" aria-labelledby="chiName-label"><g:fieldValue bean="${userProfileInstance}" field="chiName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="userProfile.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:link controller="district" action="show" id="${userProfileInstance?.district?.id}">${userProfileInstance?.district?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.engName}">
				<li class="fieldcontain">
					<span id="engName-label" class="property-label"><g:message code="userProfile.engName.label" default="Eng Name" /></span>
					
						<span class="property-value" aria-labelledby="engName-label"><g:fieldValue bean="${userProfileInstance}" field="engName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.lastUpdateBy}">
				<li class="fieldcontain">
					<span id="lastUpdateBy-label" class="property-label"><g:message code="userProfile.lastUpdateBy.label" default="Last Update By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdateBy-label"><g:fieldValue bean="${userProfileInstance}" field="lastUpdateBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.lastUpdateDate}">
				<li class="fieldcontain">
					<span id="lastUpdateDate-label" class="property-label"><g:message code="userProfile.lastUpdateDate.label" default="Last Update Date" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdateDate-label"><g:formatDate date="${userProfileInstance?.lastUpdateDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="userProfile.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${userProfileInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.mobilePhoneNo}">
				<li class="fieldcontain">
					<span id="mobilePhoneNo-label" class="property-label"><g:message code="userProfile.mobilePhoneNo.label" default="Mobile Phone No" /></span>
					
						<span class="property-value" aria-labelledby="mobilePhoneNo-label"><g:fieldValue bean="${userProfileInstance}" field="mobilePhoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="userProfile.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userProfileInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="userProfile.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${userProfileInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.subDistrict}">
				<li class="fieldcontain">
					<span id="subDistrict-label" class="property-label"><g:message code="userProfile.subDistrict.label" default="Sub District" /></span>
					
						<span class="property-value" aria-labelledby="subDistrict-label"><g:link controller="subDistrict" action="show" id="${userProfileInstance?.subDistrict?.id}">${userProfileInstance?.subDistrict?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.userGroups}">
				<li class="fieldcontain">
					<span id="userGroups-label" class="property-label"><g:message code="userProfile.userGroups.label" default="User Groups" /></span>
					
						<g:each in="${userProfileInstance.userGroups}" var="u">
						<span class="property-value" aria-labelledby="userGroups-label"><g:link controller="userGroup" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${userProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
