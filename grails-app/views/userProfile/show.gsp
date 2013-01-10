
<%@ page import="org.arkvida.church.domain.UserProfile" %>
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
			
				<g:if test="${userProfileInstance?.cardId}">
				<li class="fieldcontain">
					<span id="cardId-label" class="property-label"><g:message code="userProfile.cardId.label" default="Card Id" /></span>
					
						<span class="property-value" aria-labelledby="cardId-label"><g:fieldValue bean="${userProfileInstance}" field="cardId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.chiName}">
				<li class="fieldcontain">
					<span id="chiName-label" class="property-label"><g:message code="userProfile.chiName.label" default="Chi Name" /></span>
					
						<span class="property-value" aria-labelledby="chiName-label"><g:fieldValue bean="${userProfileInstance}" field="chiName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.engName}">
				<li class="fieldcontain">
					<span id="engName-label" class="property-label"><g:message code="userProfile.engName.label" default="Eng Name" /></span>
					
						<span class="property-value" aria-labelledby="engName-label"><g:fieldValue bean="${userProfileInstance}" field="engName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="userProfile.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${userProfileInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="userProfile.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${userProfileInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="userProfile.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userProfileInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.mobilePhoneNo}">
				<li class="fieldcontain">
					<span id="mobilePhoneNo-label" class="property-label"><g:message code="userProfile.mobilePhoneNo.label" default="Mobile Phone No" /></span>
					
						<span class="property-value" aria-labelledby="mobilePhoneNo-label"><g:fieldValue bean="${userProfileInstance}" field="mobilePhoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="userProfile.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:link controller="district" action="show" id="${userProfileInstance?.district?.id}">${userProfileInstance?.district?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.livingDistrict}">
				<li class="fieldcontain">
					<span id="livingDistrict-label" class="property-label"><g:message code="userProfile.livingDistrict.label" default="Living District" /></span>
					
						<span class="property-value" aria-labelledby="livingDistrict-label"><g:link controller="livingDistrict" action="show" id="${userProfileInstance?.livingDistrict?.id}">${userProfileInstance?.livingDistrict?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.gatherings}">
				<li class="fieldcontain">
					<span id="gatherings-label" class="property-label"><g:message code="userProfile.gatherings.label" default="Gatherings" /></span>
					
						<g:each in="${userProfileInstance.gatherings}" var="g">
						<span class="property-value" aria-labelledby="gatherings-label"><g:link controller="gathering" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="userProfile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="userProfile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userProfileInstance?.lastUpdated}" /></span>
					
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
