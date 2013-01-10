
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
			 function appendPendingRequest(e) {
			 	var userProfileId = $(this).val();
			 	var row = $('<tr id="attendance_' + userProfileId + '"><td></td><td>' + userProfileId + '</td><td></td><td></td></tr>');
			 	if ($('#attendance_' + userProfileId)) {
			 		$('#attendance_' + userProfileId).remove();
			 	}
			 	$('#attendResult').prepend(row);
			 	jQuery.ajax({
			 		type:'POST',
			 		data:'userProfileId='+userProfileId, 
			 		url:'attend',
			 		success:onAttend,
			 		error:function(XMLHttpRequest,textStatus,errorThrown){},
			 		timeout:5000,
      				retryMax: 2
			 	});
				$(this).val('');
			 }
		
		     function onAttend(data) {
		     	var responseElement = $(data);
		     	var elementId = '#' + responseElement.attr('id');
		        $(elementId).replaceWith(responseElement);
		     }
		     
		     $(document).ready(function() {
		     	$('input[name=userProfileId]').lazybind('keyup', appendPendingRequest, 200, 'keyup');
		     });
		</g:javascript>	
	
		<a href="#list-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		<input type="text" value="" name="userProfileId">

		<div id="list-attendance" class="content scaffold-list" role="main">
		    <table>
				<thead>
					<tr>
						<g:sortableColumn property="date" title="${message(code: 'attendance.date.label', default: 'Date')}" />
						<g:sortableColumn property="userProfileId" title="${message(code: 'attendance.userProfileId.label', default: 'User Profile Id')}" />
						<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />					
						<g:sortableColumn property="recordTime" title="${message(code: 'attendance.recordTime.label', default: 'Record Time')}" />
					</tr>
				</thead>
				<tbody id="attendResult">

				</tbody>
			</table>				
		</div>
	</body>
</html>
