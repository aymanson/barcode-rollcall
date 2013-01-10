<%@ page import="org.arkvida.church.domain.Attendance" %>



<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'gatheringId', 'error')} required">
	<label for="gatheringId">
		<g:message code="attendance.gatheringId.label" default="Gathering Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gatheringId" type="number" value="${attendanceInstance.gatheringId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'userProfileId', 'error')} required">
	<label for="userProfileId">
		<g:message code="attendance.userProfileId.label" default="User Profile Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userProfileId" type="number" value="${attendanceInstance.userProfileId}" required=""/>
</div>

