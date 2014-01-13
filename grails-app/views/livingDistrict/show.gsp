
<%@ page import="org.arkvida.church.domain.LivingDistrict" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livingDistrict.label', default: 'LivingDistrict')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-livingDistrict" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-livingDistrict" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list livingDistrict">
			
				<g:if test="${livingDistrictInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="livingDistrict.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${livingDistrictInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livingDistrictInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="livingDistrict.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${livingDistrictInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livingDistrictInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="livingDistrict.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:link controller="assemblyDistrict" action="show" id="${livingDistrictInstance?.district?.id}">${livingDistrictInstance?.district?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${livingDistrictInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="livingDistrict.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${livingDistrictInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${livingDistrictInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="livingDistrict.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${livingDistrictInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${livingDistrictInstance?.id}" />
					<g:link class="edit" action="edit" id="${livingDistrictInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
