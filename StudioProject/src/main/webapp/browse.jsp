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
	                    Browse Our Studios
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
	
			<!-- Studios -->
			<div class="row justify-content-center">
			    <% 
			        List<String> studioNames = (List<String>) request.getAttribute("studioNames");
			        List<String> locations = (List<String>) request.getAttribute("locations");
			        List<String> areas = (List<String>) request.getAttribute("areas");
			        List<String> capacities = (List<String>) request.getAttribute("capacities");
			        List<String> availabilities = (List<String>) request.getAttribute("availabilities");
			        List<Double> rates = (List<Double>) request.getAttribute("rates");
			        
			        // Check if all lists have the same size
			        if (studioNames != null && locations != null && areas != null && capacities != null && availabilities != null
			            && studioNames.size() == locations.size() && studioNames.size() == areas.size() && studioNames.size() == capacities.size()
			            && studioNames.size() == availabilities.size()) {
			            for (int i = 0; i < studioNames.size(); i++) {
			                String name = studioNames.get(i);
			                String location = locations.get(i);
			                String area = areas.get(i);
			                String capacity = capacities.get(i);
			                String availability = availabilities.get(i);
			                Double rate = rates.get(i);
			    %>
			                <!-- Studio <%= i %> -->
			                <div class="col-md-4 col-lg-4 mb-5">
			                    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal<%= i %>">
			                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
			                            <div class="portfolio-item-caption-content text-center text-white">
			                                <i class="fas fa-plus fa-3x"></i>
			                            </div>
			                        </div>
			                        <img class="img-fluid" src="assets/img/studios/<%=i %>.jpeg" alt="..." />
			                    </div>
			                </div>
			                <!-- Modal <%= i %> -->
			                <div class="portfolio-modal modal fade" id="portfolioModal<%= i %>" tabindex="-1" aria-labelledby="portfolioModal<%= i %>" aria-hidden="true">
			                    <div class="modal-dialog modal-xl">
			                        <div class="modal-content">
			                            <div class="modal-header border-0">
			                                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			                            </div>
			                            <div class="modal-body text-center pb-5">
			                                <div class="container">
			                                    <div class="row justify-content-center">
			                                        <div class="col-lg-8">
			                                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"><%= name %></h2>
			                                            <!-- Icon Divider-->
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <!-- Location Section -->
			                                            <h4 class="text-uppercase mb-3">Location</h4>
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <p class="mb-4 lead"><%= location %></p>
			                                        
			                                            <!-- Area Section -->
			                                            <h4 class="text-uppercase mb-3">Area</h4>
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <p class="mb-4 lead"><%= area %></p>
			                                        
			                                            <!-- Capacity Section -->
			                                            <h4 class="text-uppercase mb-3">Capacity</h4>
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <p class="mb-4 lead"><%= capacity %></p>
			                                        
			                                            <!-- Availability Section -->
			                                            <h4 class="text-uppercase mb-3">Availability</h4>
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <p class="mb-4 lead"><%= availability %></p>
			                                            
			                                            <!-- Rate Section -->
			                                            <h4 class="text-uppercase mb-3">Rate/Day</h4>
			                                            <div class="divider-custom">
			                                                <div class="divider-custom-line"></div>
			                                            </div>
			                                            <p class="mb-4 lead"><%= rate %></p>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			    <% 
			            }
			        }
			    %>
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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>
