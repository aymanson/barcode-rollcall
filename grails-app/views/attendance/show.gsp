
<%@ page import="org.arkvida.church.domain.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attendance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attendance">
			
				<g:if test="${attendanceInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="attendance.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${attendanceInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.gatheringId}">
				<li class="fieldcontain">
					<span id="gatheringId-label" class="property-label"><g:message code="attendance.gatheringId.label" default="Gathering Id" /></span>
					
						<span class="property-value" aria-labelledby="gatheringId-label"><g:fieldValue bean="${attendanceInstance}" field="gatheringId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.userProfileId}">
				<li class="fieldcontain">
					<span id="userProfileId-label" class="property-label"><g:message code="attendance.userProfileId.label" default="User Profile Id" /></span>
					
						<span class="property-value" aria-labelledby="userProfileId-label"><g:fieldValue bean="${attendanceInstance}" field="userProfileId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${attendanceInstance?.id}" />
					<g:link class="edit" action="edit" id="${attendanceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
