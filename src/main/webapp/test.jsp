<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.beans.Project"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
	position: relative;
	width: 50%;
}

.image {
	display: inline-block;
	width: 100%;
	height: 80px;
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
	background-color: #008CBA;
}

.container:hover .overlay {
	opacity: 1;
}

.text {
	color: white;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	text-align: center;
}
</style>
</head>
<body>
	<sql:setDataSource driver="com.mysql.jdbc.Driver" scope="page"
		user="root" password="" var="db"
		url="jdbc:mysql://localhost:3306/spatial" />

	<sql:query var="rs" dataSource="${db}">
			select * from projects;                    	    
		</sql:query>

	<c:forEach items="${rs.rows}" var="p">

		<div class="container">
			<img src="viewPhoto?id=${p.id}" alt="Avatar" class="image">
			<div class="overlay">
				<div class="text">
					<c:out value="${p.name}"></c:out>
				</div>
			</div>
		</div>
	</c:forEach>


</body>
</html>
