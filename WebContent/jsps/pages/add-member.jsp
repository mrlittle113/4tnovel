<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Thêm thành viên</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.5, user-scalable=yes">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- the following to include all needed things 
	font
	font awesome icon
	bootstraps custom-mize if you have using button , grid-system
	custom css
-->
<link
	href="https://fonts.googleapis.com/css?family=Exo:400,400i,500,500i,800&amp;subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/vendors/css/bootstrap-customize.css">
<link rel="stylesheet" href="resources/local/css/style.css" />
</head>
<body>
	<div class="account-manage">
		<%@ include file="/jsps/components/_account-manage.header.jsp"%>
		<div class="account-manage__content u-row--1140 u-centered">
			<div>
				<p class="u-3x u-align-center">Thêm thành viên</p>
			</div>
			<div class="row u-margin-bottom--1rem">
				<c:if test="${not empty sucessed}">
					<p class="u-paragraph--sucessed u-centered">${sucessed}</p>
				</c:if>
				<c:if test="${not empty idAccError}">
					<p class="u-paragraph--failed u-centered">${idAccError}</p>
				</c:if>
				<c:if test="${not empty searchResultError}">
					<p class="u-paragraph--failed u-centered">${searchResultError}</p>
				</c:if>
			</div>
			<div class="search">
				<%@ include file="/jsps/components/_search-bar.account.jsp"%>
			</div>
			<div class="u-width--80 u-centered u-2x">
				<table class="table table-hover table-light">
					<!-- c:for de do du lieu ra -->
					<c:if test="${not empty searchResultAccount}">
						<tr class="row">
							<td class="col-md-3">Username</td>
							<td class="col-md-3">Nickname</td>
							<td class="col-md-3">Email</td>
							<td class="col-md-3">Action</td>
						</tr>
						<tr class="row">
							<td class="col-md-3">${searchResultAccount.userName}</td>
							<td class="col-md-3">${searchResultAccount.displayedName}</td>
							<td class="col-md-3">${searchResultAccount.gmail}</td>
							<td class="col-md-3"><input name="idAccount"
								id="accountResultId" onclick="mappingId()" type="radio"
								value="${searchResultAccount.id}"> <label for="account1">Chọn</label>
							</td>
						</tr>
					</c:if>
				</table>
			</div>
			<form action="add-member" method="post">
				<div class="row u-padding-bottom--1-5rem ">
					<div class="col-md-5 u-align-right">Chọn nhóm:</div>
					<div class="col-md-7">
						<select name="id-group">
							<!-- c:for de in option and value -->
							<c:forEach var="group" items="${ownerGroups}">
								<option value="${group.id}">${group.name }</option>
							</c:forEach>
						</select>
						<!--  adding link to adding group if ownergroup is null -->
					</div>
				</div>
				<input id="hidenAccountId" type="hidden" name="id-acc"
					value="${searchResultAccount.id}">
				<div class="row u-padding-bottom--1-5rem">
					<div class="col-md-5"></div>
					<div class="col-md-7">
						<button class="btn btn-primary u-color-white" type="submit">Thêm</button>
						<a href="manage" class="btn btn-danger u-color-white">Hủy</a>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>