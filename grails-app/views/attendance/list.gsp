
<%@ page import="org.arkvida.church.domain.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attendance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'attendance.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="gatheringId" title="${message(code: 'attendance.gatheringId.label', default: 'Gathering Id')}" />
					
						<g:sortableColumn property="userProfileId" title="${message(code: 'attendance.userProfileId.label', default: 'User Profile Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attendanceInstanceList}" status="i" var="attendanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attendanceInstance.id}">${fieldValue(bean: attendanceInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "gatheringId")}</td>
					
						<td>${fieldValue(bean: attendanceInstance, field: "userProfileId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attendanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
