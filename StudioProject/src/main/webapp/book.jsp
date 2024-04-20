<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.String" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Studio Booking</title>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/studio/index.jsp">
				<span style="display: inline-block; vertical-align: middle;">MaK</span>
			    <div class="divider-custom-icon" style="display: inline-block; vertical-align: middle;">
			        <i class="fas fa-star"></i>
			    </div>
			</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Explore</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#footer">Contact</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a 
						class="nav-link py-3 px-0 px-lg-3 rounded" href="user"><%= session.getAttribute("name") %></a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<section class="page-section portfolio mt-5" id="portfolio">
	    <div class="container">
	        <!-- Heading and Divider -->
	        <div class="row justify-content-center">
	            <div class="col-lg-8 text-center">
	                <h2 class="page-section-heading text-uppercase text-secondary mb-0">
	                    Enter Booking Details
	                </h2>
	                <div class="divider-custom">
	                    <div class="divider-custom-line"></div>
	                    <div class="divider-custom-icon">
	                        <i class="fas fa-star"></i>
	                    </div>
	                    <div class="divider-custom-line"></div>
	                </div>
	            </div>
	        </div>
	
	        <!-- Booking Form -->
	        <div class="row justify-content-center">
	            <div class="col-lg-8">
	                <form action="book" method="post">
	                     <!-- Select Studio -->
			            <div class="mb-3">
			                <label for="selectStudio" class="form-label">Select Studio</label>
			                <select class="form-select" name="selectStudio" id="selectStudio">
			                    <option selected>Choose...</option>
			                    <% 
			                        List<String> studioNames = (List<String>) request.getAttribute("studioNames");
			                        if (studioNames != null) {
			                            for (String name : studioNames) {
			                    %>
			                                <option value="<%= name %>"><%= name %></option>
			                    <%
			                            }
			                        }
			                    %>
			                </select>
			            </div>
	
	                    <!-- Category -->
	                    <div class="mb-3">
	                        <label for="category" class="form-label">Category</label>
	                        <select class="form-select" name="category" id="category">
	                        	<option selected>Choose...</option>
	                        	<option value="1">Work</option>
	                            <option value="2">Event</option>
	                            <option value="3">Fitness</option>
	                            <option value="4">Filming/Shooting</option>
	                        </select>
	                    </div>
	
	                    <!-- No. of People -->
	                    <div class="mb-3">
	                        <label for="numPeople" class="form-label">No. of People</label>
	                        <input type="number" class="form-control" name="numPeople" id="numPeople" placeholder="Enter number of people">
	                    </div>
	
	                    <!-- From Date -->
	                    <div class="mb-3">
	                        <label for="fromDate" class="form-label">From Date</label>
	                        <input type="date" class="form-control" name="fromDate" id="fromDate">
	                    </div>
	
	                    <!-- End Date -->
	                    <div class="mb-3">
	                        <label for="endDate" class="form-label">End Date</label>
	                        <input type="date" class="form-control" name="endDate" id="endDate">
	                    </div>
	
	                    <!-- Description -->
	                    <div class="mb-3">
	                        <label for="description" class="form-label">Description</label>
	                        <textarea class="form-control" name="description" id="description" rows="3"></textarea>
	                    </div>
	
	                    <!-- Submit Button -->
	                    <div class="form-group form-button">
								<input type="submit" name="submit" id="submit"
									class="form-submit" value="Book Now" />
						</div>
	                </form>
	            </div>
	        </div>
	        
	    </div>
	</section>
	
	<!-- Footer-->
	<footer class="footer text-center" id="footer">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						412115 <br /> Symbiosis Institute of Technology<br />Lavale, Pune, MH
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About MaK</h4>
					<p class="lead mb-0">
						MaK, a tour de force in studio management systems since 2024.
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Malvericus's Studio Site</small>
		</div>
	</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Booking Successful!", "View Your Profile For More Details", "success");
		}
		
	</script>

</body>
</html>
