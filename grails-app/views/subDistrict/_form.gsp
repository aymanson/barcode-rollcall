<%@ page import="christian.SubDistrict" %>



<div class="fieldcontain ${hasErrors(bean: subDistrictInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="subDistrict.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="2" required="" value="${subDistrictInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subDistrictInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subDistrict.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${subDistrictInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subDistrictInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="subDistrict.district.label" default="District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="district" name="district.id" from="${christian.District.list()}" optionKey="id" optionValue="displayName" required="" value="${subDistrictInstance?.district?.id}" class="many-to-one"/>
</div>

