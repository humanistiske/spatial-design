<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.beans.Project"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Spatial Designs</title>

<link
	href='https://fonts.googleapis.com/css?family=Lato:400,700,300|Open+Sans:400,600,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

	<!--header-->
	<header class="main-header" id="header">
		<div class="bg-color">
			<!--nav-->
			<nav class="nav navbar-default navbar-fixed-top">
				<div class="container">
					<div class="col-md-12">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#mynavbar"
								aria-expanded="false" aria-controls="navbar">
								<span class="fa fa-bars"></span>
							</button>
							<a href="" class="navbar-brand">Spatial</a>
						</div>
						<div class="collapse navbar-collapse navbar-right" id="mynavbar">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp">Home</a></li>
								<li  class="active"><a href="project.jsp">Projects</a></li>
								<li><a href="#">Client</a></li>
								<li><a href="#">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
			<!--/ nav-->
			<div class="container text-center">
				<div class="wrapper wow fadeInUp delay-05s">
					<!-- <h2 class="top-title">Web Design & Development</h2>
          <h3 class="title">Bethany</h3>
          <h4 class="sub-title">We Create amazing designs</h4>
          <button type="submit" class="btn btn-submit">Download Now</button> -->
				</div>
			</div>
		</div>
	</header>


	<div class="row">

		<sql:setDataSource driver="com.mysql.jdbc.Driver" scope="page"
			user="root" password="" var="db"
			url="jdbc:mysql://localhost:3306/spatial" />

		<c:if test="${ not empty param.id}">
			<sql:query var="rs" dataSource="${db}">
				select name, description from projects where id = ?
				<sql:param value="${param.id}"></sql:param>
			</sql:query>
			
			<sql:query var="rs1" dataSource="${db}">
				select images from project_images where id = ?
				<sql:param value="${param.id}"></sql:param>
				<c:set var="id" value="${param.id}"></c:set>
			</sql:query>
		</c:if>

		<c:if test="${ empty param.id}">
			<c:redirect url="index.jsp"></c:redirect>
		</c:if>
		
  		<div class="col-sm-8">
  			<c:forEach items="${rs1.rows}" var="p1">
  				<img class="thumbnail" style="height: auto; width: 100%" src="viewProjectImages?id=${id}">
  			</c:forEach>	
  		</div>
		
		<c:forEach items="${rs.rows}" var="p">
		<div class="col-sm-4">
				<h4>Name: <c:out value="${p.name}"></c:out></h4>
				<h4>Description: <c:out value="${p.description}"></c:out></h4>
			</div>
		</c:forEach>
	</div>

	<footer class="navbar-fixed-bottom" style="bottom: 0;" id="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-7 footer-copyright">
					© Farintsol - All rights reserved
					<div class="col-sm-5 footer-social">
						<div class="pull-right hidden-xs hidden-sm">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-google-plus"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
	</footer>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

</body>

</html>