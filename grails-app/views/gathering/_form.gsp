<%@ page import="org.arkvida.church.domain.Gathering" %>



	<g:hiddenField id="district" name="district.id" value="${session["currentDistrictId"]}"/>

<div class="fieldcontain ${hasErrors(bean: gatheringInstance, field: 'gatheringType', 'error')} required">
	<label for="gatheringType">
		<g:message code="gathering.gatheringType.label" default="Gathering Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="gatheringType" name="gatheringType.id" from="${org.arkvida.church.domain.GatheringType.list()}" optionKey="id" required="" value="${gatheringInstance?.gatheringType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gatheringInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="gathering.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gatheringInstance?.name}"/>
</div>

