
<%@ page import="christian.SubDistrict" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subDistrict.label', default: 'SubDistrict')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subDistrict" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subDistrict" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'subDistrict.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'subDistrict.name.label', default: 'Name')}" />
					
						<th><g:message code="subDistrict.district.label" default="District" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subDistrictInstanceList}" status="i" var="subDistrictInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subDistrictInstance.id}">${fieldValue(bean: subDistrictInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: subDistrictInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: subDistrictInstance, field: "district.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subDistrictInstanceTotal}" />
			</div>
			<g:jasperReport jasper="sub-district-list" format="PDF" name="All Sub District" />
		</div>
	</body>
</html>
