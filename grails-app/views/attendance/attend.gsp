	<tr>
		<td>${fieldValue(bean: attendanceInstance, field: "arrivalTime")}</td>
		<td><g:formatDate date="${attendanceInstance.date}" /></td>
		<td><g:link controller="userProfile" action="show" id="${attendanceInstance.userProfileId}">${fieldValue(bean: attendanceInstance, field: "userProfileId")}</g:link></td>
	</tr>