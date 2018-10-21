<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ABC</title>
<meta name="viewport" content="width=divice-width, intitial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- the following to include all needed things 
	font
	font awesome icon
	bootstrap reboot
	bootstrap grid
	custom css
-->
<link href="https://fonts.googleapis.com/css?family=Exo:400,400i,500,500i,800&amp;subset=vietnamese" rel="stylesheet"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/solid.css" integrity="sha384-osqezT+30O6N/vsMqwW8Ch6wKlMofqueuia2H7fePy42uC05rm1G+BUPSd2iBSJL" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/fontawesome.css" integrity="sha384-BzCy2fixOYd0HObpx3GMefNqdbA7Qjcc91RgYeDjrHTIEXqiF00jKvgQG0+zY/7I" crossorigin="anonymous"><link rel="stylesheet" href="resources/vendors/css/bootstrap-reboot.css" />	
<link rel="stylesheet" href="resources/vendors/css/bootstrap-grid.css" />	
<link rel="stylesheet" href="resources/local/css/style.css"/>
<style>
	#navigation-mobile , #navigation-desktop{
		display: inline-block;
	}
	.main-logo--top{
		display: inline-block;
	}
	.radius-logo{
		border-radius: 50%;
	}
</style>
</head>
<body>
	<header class="header--on-top">
		<c:import url="../components/_header.navigation-mobile.jsp"></c:import>
		<div class="main-logo--top">
			<img class="radius-logo" src="http://via.placeholder.com/126x126">
		</div>
		<c:import url="../components/_header.navigation-desktop.jsp"></c:import>
		<c:import url="../components/_header.user-functions.jsp"></c:import>
	</header>
</body>
</html>