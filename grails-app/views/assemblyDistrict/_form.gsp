<%@ page import="org.arkvida.church.domain.AssemblyDistrict" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="district.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="2" required="" value="${districtInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="district.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${districtInstance?.name}"/>
</div>

