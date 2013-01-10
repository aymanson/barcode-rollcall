<%@ page import="org.arkvida.church.domain.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="25" required="" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" maxlength="25" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userProfile', 'error')} required">
	<label for="userProfile">
		<g:message code="user.userProfile.label" default="User Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userProfile" name="userProfile.id" from="${org.arkvida.church.domain.UserProfile.findAllByDistrict(session["currentDistrict"])}" optionKey="id" required="" value="${userInstance?.userProfile?.id}" class="many-to-one"/>
</div>

