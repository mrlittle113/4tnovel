<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<title>Quản lý nhóm | 4TNOVEL</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Datatable - srtdash</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/images/icon/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/metisMenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/slicknav.min.css">
<!-- amcharts css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- Start datatable css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
<!-- style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/typography.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/default-css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/admin-dashboard/css/responsive.css">
<!-- modernizr css -->
<script
	src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- preloader area end -->
	<!-- page container area start -->
	<div class="page-container">
		<!-- sidebar menu area start -->
		<%@ include file="/jsps/components/_account-manage-new.side-bar.jsp"%>
		<!-- main content area start -->
		<div class="main-content">
			<!-- header area start -->
			<div class="header-area">
				<div class="row align-items-center">
					<!-- nav and search button -->
					<div class="col-md-6 col-sm-8 clearfix">
						<div class="nav-btn pull-left">
							<span></span> <span></span> <span></span>
						</div>
					</div>
				</div>
			</div>
			<!-- header area end -->
			<!-- page title area start -->
			<div class="page-title-area">
				<div class="row align-items-center">
					<div class="col-sm-6">
						<div class="breadcrumbs-area clearfix">
							<h4 class="page-title pull-left">Quản lý</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="${pageContext.request.contextPath}/manage">Giao
										diện chính</a></li>
								<li><span>Nhóm dịch</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<div class="row">
					<!-- Dark table start -->
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<h4 class="header-title">Danh sách nhóm dịch</h4>
								<a href="${pageContext.request.contextPath}/add-group" style="float:right" class="btn btn-success" target="_blank">Thêm nhóm</a>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" style="width: 100%; text-align: left;">
										<thead class="text-capitalize">
											<tr>
												<th>&nbsp;Tên</th>
												<th>Trưởng nhóm</th>
												<th>Số thành viên</th>
												<th>Ngày tạo</th>
												<th>Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="group" items="${groups}">
												<tr>
													<td>&nbsp;${group.name}</td>
													<td>${group.owner.userName }</td>
													<td>${group.getTotalMemembers() }</td>
													<td>${group.dateCreate }</td>
													<td>
														<!-- Trigger the modal with a button -->
														<button type="button" class="btn btn-default btn-small"
															data-toggle="modal" data-target="#fix${group.id}">
															<i class="fa fa-cog"></i>
														</button> <!-- The Modal -->
														<div id="fix${group.id}" class="modal fade" role="dialog">
															<div class="modal-dialog">

																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 class="modal-title">Nhóm ${group.name}</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																	</div>
																	<div class="modal-body">
																		<div class="data-tables datatable-dark">
																			<table id="dataTable3"
																				style="width: 100%; text-align: left;">
																				<tbody>
																					<tr>
																						<td>Nickname</td>
																						<td>Username</td>
																						<td>Email</td>
																						<td>Thao tác</td>
																					</tr>
																					<c:forEach var="account" items="${group.accounts}">
																						<tr>
																							<td>${account.displayedName}</td>
																							<td>${account.userName}</td>
																							<td>${account.gmail}</td>
																							<td><form
																									action="${pageContext.request.contextPath}/manage/account/dashboard-groups"
																									method="post">
																									<button type="submit"
																										class="btn btn-danger btn-small">
																										<i class="fa fa-trash-o"></i>
																									</button>
																									<input type="hidden" value="${account.id}"
																										name="memberID"> <input type="hidden"
																										value="${group.id}" name="groupID">
																								</form></td>
																						</tr>
																					</c:forEach>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<a
																			href="${pageContext.request.contextPath}/add-member"
																			class="btn btn-success" target="_blank">Thêm
																			thành viên</a>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</div>

															</div>
														</div>

														<button type="button" class="btn btn-danger btn-small"
															data-toggle="modal" data-target="#delete${group.id}">
															<i class="fa fa-trash-o"></i>
														</button> <!-- Modal -->
														<div id="delete${group.id}" class="modal fade"
															role="dialog" style="text-align: left;">
															<div class="modal-dialog">

																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 class="modal-title">Cảnh báo!!!</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>

																	</div>
																	<div class="modal-body">
																		<p>
																			Bạn có chắc muốn xóa nhóm <span class="btn-danger">${group.name}</span>
																			và toàn bộ cống hiến của nhóm này?
																		</p>
																	</div>
																	<div class="modal-footer">
																		<form
																			action="${pageContext.request.contextPath}/deletingGroupForUserServlet"
																			method="post">
																			<input type="hidden" name="action" value="delete">
																			<input type="hidden" name="id" value="${group.id}">
																			<button type="submit" class="btn btn-danger">Xóa
																				hết</button>
																		</form>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Hủy</button>
																	</div>
																</div>

															</div>
														</div>
													</td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- Dark table end -->
				</div>
			</div>
		</div>
		<!-- main content area end -->
		<!-- footer area start-->
		<footer>
			<div class="footer-area"></div>
		</footer>
		<!-- footer area end-->
	</div>
	<!-- page container area end -->
	<!-- jquery latest version -->
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/vendor/jquery-2.2.4.min.js"></script>
	<!-- bootstrap 4 js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/jquery.slicknav.min.js"></script>

	<!-- Start datatable js -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
	<!-- others plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/admin-dashboard/js/scripts.js"></script>
</body>

</html>
