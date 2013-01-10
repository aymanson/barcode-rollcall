<%@ page import="org.arkvida.church.domain.LivingDistrict" %>


	<g:hiddenField id="district" name="district.id" value="${session["currentDistrictId"]}" />


<div class="fieldcontain ${hasErrors(bean: livingDistrictInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="livingDistrict.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${livingDistrictInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: livingDistrictInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="livingDistrict.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${livingDistrictInstance?.name}"/>
</div>

