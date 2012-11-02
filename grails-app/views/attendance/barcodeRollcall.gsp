
<%@ page import="christian.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<g:javascript library="jquery" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:javascript>
			 function appendPendingRequest(userProfileId) {
			 	var row = $('<tr id="attendance_' + userProfileId + '"><td></td><td>' + userProfileId + '</td><td></td><td></td></tr>');
			 	$('#attendResult').prepend(row);
			 }
		
		     function onAttend(request) {
		     	var responseElement = $(request.responseText);
		     	var elementId = '#' + responseElement.attr('id');
		        $(elementId).replaceWith(responseElement);
		     }
		     
		     function cleanInput() {
		     	$('input[name=userProfileId]').val('');
		     }
		</g:javascript>	
	
		<a href="#list-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<g:remoteField action="attend" before="appendPendingRequest(this.value)" after="cleanInput()" paramName="userProfileId" onComplete="onAttend(XMLHttpRequest)" name="userProfileId" />
		<div id="list-attendance" class="content scaffold-list" role="main">
		    <table>
				<thead>
					<tr>
						<g:sortableColumn property="date" title="${message(code: 'attendance.date.label', default: 'Date')}" />
						<g:sortableColumn property="userProfileId" title="${message(code: 'attendance.userProfileId.label', default: 'User Profile Id')}" />
						<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />					
						<g:sortableColumn property="arrivalTime" title="${message(code: 'attendance.arrivalTime.label', default: 'Arrival Time')}" />
					</tr>
				</thead>
				<tbody id="attendResult">

				</tbody>
			</table>				
		</div>
	</body>
</html>
