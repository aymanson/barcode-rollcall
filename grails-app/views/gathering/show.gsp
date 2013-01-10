
<%@ page import="org.arkvida.church.domain.Gathering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gathering.label', default: 'Gathering')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gathering" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gathering" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gathering">
			
				<g:if test="${gatheringInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="gathering.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${gatheringInstance}" field="name"/></span>
					
				</li>
				</g:if>			
			
				<g:if test="${gatheringInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="gathering.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:link controller="district" action="show" id="${gatheringInstance?.district?.id}">${gatheringInstance?.district?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gatheringInstance?.gatheringType}">
				<li class="fieldcontain">
					<span id="gatheringType-label" class="property-label"><g:message code="gathering.gatheringType.label" default="Gathering Type" /></span>
					
						<span class="property-value" aria-labelledby="gatheringType-label"><g:link controller="gatheringType" action="show" id="${gatheringInstance?.gatheringType?.id}">${gatheringInstance?.gatheringType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>			
			
				<g:if test="${gatheringInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="gathering.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${gatheringInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gatheringInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="gathering.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${gatheringInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gatheringInstance?.id}" />
					<g:link class="edit" action="edit" id="${gatheringInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
