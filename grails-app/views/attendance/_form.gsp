<%@ page import="christian.Attendance" %>


<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="attendance.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${attendanceInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'userProfileId', 'error')} required">
	<label for="userProfileId">
		<g:message code="attendance.userProfileId.label" default="User Profile Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userProfileId" type="number" value="${attendanceInstance.userProfileId}" required=""/>
</div>

