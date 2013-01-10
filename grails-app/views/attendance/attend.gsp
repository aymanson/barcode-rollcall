	<tr id="attendance_${attendanceInstance.userProfileId}">
		<td><g:formatDate date="${attendanceInstance.date}" /></td>	
		<td><g:link controller="userProfile" action="show" id="${attendanceInstance.userProfileId}">${fieldValue(bean: attendanceInstance, field: "userProfileId")}</g:link></td>	
		<td>${fieldValue(bean: userProfileInstance, field: "chiName")}</td>		
		<td>${fieldValue(bean: attendanceInstance, field: "recordTime")}</td>
	</tr>