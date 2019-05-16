<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.beans.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Spatial Designs</title>
  <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
  <link href='https://fonts.googleapis.com/css?family=Lato:400,700,300|Open+Sans:400,600,700,300' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/animate.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  
  <script>
  $(function() {
	    // Multiple images preview in browser
	    var imagesPreview = function(input, placeToInsertImagePreview) {
	        if (input.files) {
	            var filesAmount = input.files.length;
	            for (i = 0; i < filesAmount; i++) {
	                var reader = new FileReader();
	                reader.onload = function(event) {
	                    $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
	                    $("img").addClass("img-thumbnail");
	                }
	                reader.readAsDataURL(input.files[i]);
	            }
	        }
	    };

	    $('#gallery-photo-add').on('change', function() {
	        imagesPreview(this, 'div.gallery');
	    });
	});
  
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#thumbnail')
                  .attr('src', e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
      }
  }
  </script>
</head>

<body>
	<c:if test="${sessionScope.loggedUser == null}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

  <section class="section-padding wow fadeInUp delay-05s" id="contact">
    <div class="container">
      <div class="row white">
        <div class="col-md-12 col-sm-12">
        <form action="addProject" method="post" enctype="multipart/form-data">
          <div class="col-md-4 col-sm-6" style="padding-left:0px;">
            <h3 class="cont-title">Add Project</h3>
            <div id="errormessage"></div>
            <div class="contact-info">
                <div class="form-group">
                  <input required type="text" name="formName" class="form-control" id="name" placeholder="Project Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validation"></div>
                </div>

                <div class="form-group">
                  <textarea required class="form-control" name="formDescription" rows="10" data-rule="required" placeholder="Description"></textarea>
                  <div class="validation"></div>
                </div>
                
                <div class="form-group">
                	<select required name="formCategory" class="form-control">
                		<c:forEach items="${Category.values()}" var="category">
                      		<option value="${category}"><c:out value="${category}"></c:out></option>
                      	</c:forEach>
                	</select>
                </div>
                
                <button type="submit" class="btn btn-send">Add Project</button>
                <button class="btn btn-send">Logout</button> 
                
       			<div class="container" style="padding-top: 5%; padding-left: 0%;">
                <c:if test="${param.error == 'false'}">
                  <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<i class="icon fa fa-check"></i>
                    Project added successfully.
                  </div>
                  </c:if>
                  <c:if test="${param.error == 'true'}">
                  <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <i class="icon fa fa-check"></i>
                    Oops something went wrong...
                  </div>
                  </c:if>
                  </div> 
            </div>

          </div>

          <div class="col-md-4">
            	<!-- <label for="file-input" title="Select Thumbnail">
       				<span class="glyphicon glyphicon-plus"></span>
				</label> -->
    			<input name="formPhoto" required onchange="readURL(this);" title="Select Thumbnail" type="file"/>
    			<img id="thumbnail" class="img-thumbnail" src="#" alt="Thumbnail image" />
            
          </div>
          
          <div class="container">
          	<div class="row">
	          <div class="col-md-4 form-group">
	          	<input type="file" name="formImages" required multiple id="gallery-photo-add" title="Select Images" value="Select Project Images">
	            <div class="gallery"></div>
	          </div>
          </div>
          </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!---->
  <!---->
  <footer class="navbar-fixed-bottom" id="footer">
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
  <!---->
  <!--contact ends-->
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.easing.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/wow.js"></script>
  <script src="js/custom.js"></script>
  <script src="contactform/contactform.js"></script>

</body>
</html>
