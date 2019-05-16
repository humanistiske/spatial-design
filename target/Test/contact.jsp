<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.beans.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Spatial Designs</title>

  <link href='https://fonts.googleapis.com/css?family=Lato:400,700,300|Open+Sans:400,600,700,300' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/animate.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

	<body>

  <!--header-->
  <header class="main-header">
    <div class="bg-color">
      <!--nav-->
      <nav class="nav navbar-default navbar-fixed-top">
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
                <li><a href="project.jsp">Projects</a></li>
                <li><a href="#">Client</a></li>
                <li><a href="#">About</a></li>
                <li class="active"><a href="contact.jsp">Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <!--/ nav-->
    </div>
  </header>



  <section class="section-padding wow fadeInUp delay-05s" id="contact">
    <div class="container">
      <div class="row white">
        <div class="col-md-8 col-sm-12">
          <div class="section-title">
            <h2 class="head-title black">Contact Us</h2>
            <hr class="botm-line">
            <p class="sec-para black">Please fill out your contact details and we will get in touch with you very soon...</p>
          </div>
        </div>
        <div class="col-md-12 col-sm-12">
          <div class="col-md-4 col-sm-6" style="padding-left:0px;">
            <h3 class="cont-title">Email Us</h3>
            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <div class="contact-info">
              <form action="email" method="post" role="form" class="contactForm">
                <div class="form-group">
                  <input type="text" name="formName" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validation"></div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="formEmail" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validation"></div>
                </div>

                <div class="form-group">
                  <input type="text" class="form-control" name="formSubject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validation"></div>
                </div>

                <div class="form-group">
                  <textarea class="form-control" name="formMessage" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                  <div class="validation"></div>
                </div>
                <button type="submit" class="btn btn-send">Send</button>
                
                
       			<div class="container" style="padding-top: 5%; padding-left: 0%;">
                <c:if test="${param.error == false}">
                  <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fa fa-check"></i>
                    Thanking you for contacting us.
                  </div>
                  </c:if>
                  <c:if test="${param.error == true}">
                  <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <i class="icon fa fa-check"></i>
                    Oops something went wrong...
                  </div>
                  </c:if>
                  </div>
                  
              </form>
            </div>

          </div>
          <div class="col-md-4 col-sm-6">
            <h3 class="cont-title">Visit Us</h3>
            <div class="location-info">
              <p class="white"><span aria-hidden="true" class="fa fa-map-marker"></span>503, 5th Floor, Presidential Plaza, 
Opp. R - City Mall, L.B.S Marg
Ghatkopar (W), Mumbai - 400086</p>
              <p class="white"><span aria-hidden="true" class="fa fa-phone"></span>Phone: +91-22-25185788 / 89</p>
              <p class="white"><span aria-hidden="true" class="fa fa-envelope"></span>Email: <a href="" class="link-dec">spatialdesigns@gmail.com</a></p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="contact-icon-container hidden-md hidden-sm hidden-xs">
              <span aria-hidden="true" class="fa fa-envelope-o"></span>
            </div>
          </div>
        </div>
      </div>
    </div><br><br>
  </section>		

	  <footer class="navbar-fixed-bottom" style="bottom: 0;" id="footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-7 footer-copyright">
          © Farintsol - All rights reserved
        <div class="col-sm-5 footer-social">
          <div class="pull-right hidden-xs hidden-sm">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-google-plus"></i></a>
            <a href="#"><i class="fa fa-pinterest"></i></a>
          </div>
        </div>
      </div>
    </div>
  </footer>

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