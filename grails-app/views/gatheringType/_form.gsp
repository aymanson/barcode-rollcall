<%@ page import="org.arkvida.church.domain.GatheringType" %>



<div class="fieldcontain ${hasErrors(bean: gatheringTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="gatheringType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gatheringTypeInstance?.name}"/>
</div>

