
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
		     function onAttend(request) {
		         alert('submitted');
		     }
		     
		     function cleanInput() {
		     	$('input[name=userProfileId]').value='';
		     }
		</g:javascript>	
	
		<a href="#list-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<g:remoteField action="attend" after="cleanInput()" update="attendResult" paramName="userProfileId" onComplete="onAttend(XMLHttpRequest)" name="userProfileId" />
		<div id="list-attendance" class="content scaffold-list" role="main">
		    <table>
				<thead>
					<tr>
					
						<g:sortableColumn property="arrivalTime" title="${message(code: 'attendance.arrivalTime.label', default: 'Arrival Time')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'attendance.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="userProfileId" title="${message(code: 'attendance.userProfileId.label', default: 'User Profile Id')}" />
					
					</tr>
				</thead>
				<tbody id="attendResult">

				</tbody>
			</table>				
		</div>
	</body>
</html>
