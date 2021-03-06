
<%@ page import="org.arkvida.church.domain.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cardId" title="${message(code: 'userProfile.cardId.label', default: 'Card Id')}" />
					
						<g:sortableColumn property="chiName" title="${message(code: 'userProfile.chiName.label', default: 'Chi Name')}" />
					
						<g:sortableColumn property="engName" title="${message(code: 'userProfile.engName.label', default: 'Eng Name')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'userProfile.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'userProfile.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'userProfile.address.label', default: 'Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "cardId")}</g:link></td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "chiName")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "engName")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "sex")}</td>
					
						<td><g:formatDate date="${userProfileInstance.birthday}" /></td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "address")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
