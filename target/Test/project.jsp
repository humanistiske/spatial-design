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

<style>

.thumbnail
{
	margin-top: 0px;
	padding-left: 0px;
	padding-right: 0px;
	margin-bottom: 0px;
}

.overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
	background-color: #006cff;
}

.thumbnail:hover .overlay {
	opacity: 0.9;
}

.thumbnail:hover .text {
	bottom: 10%;
}

.text {
	color: white;
	font-size: 20px;
	position: absolute;
	bottom: 0%;
	transition: .5s ease;
	left: 10%;
}

.category
{
width: 100%; 
height: 60px; 
background-color: #000; 
margin-bottom: 3%; 
position: sticky; 
top: 0; 
z-index: 1;
}

.category ul
{
list-style: none;
font-family: 'Poppins'; 
color: white;
text-align: center;
padding-top: 20px;
}

.category ul li
{
display:inline-block;
padding-right: 2%;
}

.category ul a
{
color: #FFF;
}

.category ul a:hover
{
text-decoration: none;
color: #7f8c8d;
}
</style>
</head>

<body>


  <!--header-->
  <header class="main-header" id="header">
      <!--nav-->
      <nav class="nav navbar-default" style="padding-top: 40px">
        <div class="container">
          <div class="col-md-12">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar" aria-expanded="false" aria-controls="navbar">
                            <span class="fa fa-bars"></span>
                        </button>
              <a href="" class="navbar-brand">Spatial</a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="mynavbar">
              <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li  class="active"><a href="projects.jsp">Projects</a></li>
                <li><a href="#">Client</a></li>
                <li><a href="#">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <!--/ nav-->
      
  </header>

<div style="height: 150px;"></div>

<div class="category">
	<ul>
		<li><a href="project.jsp">Projects</a></li>
<sql:setDataSource driver="com.mysql.jdbc.Driver" scope="page"
			user="root" password="" var="db"
			url="jdbc:mysql://localhost:3306/spatial" />

		<sql:query var="rs" dataSource="${db}">
			select category from category;                    	    
		</sql:query>

		<c:forEach items="${rs.rows}" var="c">
			<li><a href="project.jsp?cate=${c.category}"><c:out value="${c.category}"></c:out></a></li>
		</c:forEach>
		
	</ul>
</div>


<div class="row">

<sql:setDataSource driver="com.mysql.jdbc.Driver" scope="page"
			user="root" password="" var="db"
			url="jdbc:mysql://localhost:3306/spatial" />

		<c:if test="${ not empty param.cate}">
			<sql:query var="rs" dataSource="${db}">
				select * from projects where category = ?
				<sql:param value="${param.cate}"></sql:param>                  	    
			</sql:query>
		</c:if>
		
		<c:if test="${ empty param.cate}">
			<sql:query var="rs" dataSource="${db}">
				select * from projects;                    	    
			</sql:query>
		</c:if>
		<c:forEach items="${rs.rows}" var="p">

    <div class="col-md-3">
      <div class="thumbnail">
        <a href="viewProject.jsp?id=${p.id}">
          <img src="viewPhoto?id=${p.id}" style="width:100%; height: 300px;">
          <div class="overlay">
					<div class="text">
						<c:out value="${p.name}"></c:out>
					</div>
				</div>
        </a>
      </div>
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