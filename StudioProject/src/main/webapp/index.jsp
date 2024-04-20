<% 
	if(session.getAttribute("name") == null) {
		response.sendRedirect("login.jsp");
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Studio Booking</title>
<!-- Favicon-->
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
	<!-- Navigation-->
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
	<!-- Mast head-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Mast head Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To MaK,</h1>
			<h1 class="masthead-heading text-uppercase mb-0">Our Studio Booking System</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Mast head Sub heading-->
			<p class="masthead-subheading font-weight-light mb-0">D I S C O V E R</p>
			<p class="masthead-subheading font-weight-light mb-0">B O O K</p>
			<p class="masthead-subheading font-weight-light mb-0">C R E A T E</p>
			<p class="masthead-subheading font-weight-light mb-0"> Your Studio, Your Space.</p>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
		</div>
	</header>
	<!-- Explore Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Explore Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Explore</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Explore Grid Items-->
			<div class="row justify-content-center">
			<!-- Explore Item 1-->
			<div class="col-md-6 col-lg-4 mb-5">
			    <h4 class="text-center text-uppercase mb-3">Browse</h4>
			    <div class="divider-custom">
			        <div class="divider-custom-line"></div>
			    </div>
			    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
			        <div class="portfolio-item-caption d-flex flex-column align-items-center justify-content-center h-100 w-100">
			            <div class="portfolio-item-caption-content text-center text-white">
			                <i class="fas fa-plus fa-3x"></i>
			            </div>
			        </div>
			        <img class="img-fluid" src="assets/img/portfolio/browse.png" alt="..." />
			    </div>
			</div>
			<!-- Modal 1-->
			<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
			    <div class="modal-dialog modal-xl">
			        <div class="modal-content">
			            <div class="modal-header border-0">
			                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body text-center pb-5">
			                <div class="container">
			                    <div class="row justify-content-center">
			                        <div class="col-lg-8">
			                            <!-- Portfolio Modal - Title-->
			                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Browse Studios</h2>
			                            <!-- Icon Divider-->
			                            <div class="divider-custom">
			                                <div class="divider-custom-line"></div>
			                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
			                                <div class="divider-custom-line"></div>
			                            </div>
			                            <!-- Portfolio Modal - Text-->
			                            <p class="mb-4">Explore our diverse range of studios, meticulously 
			                            designed to cater to every creative endeavor, from photography to fitness, 
			                            offering the perfect backdrop for your next project or passion project.</p>
			                            <a href="browse" class="btn btn-primary">More Info</a>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			
			    <!-- Explore Item 2-->
			    <div class="col-md-6 col-lg-4 mb-5">
				    <h4 class="text-center text-uppercase mb-3">Book</h4>
				    <div class="divider-custom">
				        <div class="divider-custom-line"></div>
				    </div>
				    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
				        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
				            <div class="portfolio-item-caption-content text-center text-white">
				                <i class="fas fa-plus fa-3x"></i>
				            </div>
				        </div>
				        <img class="img-fluid" src="assets/img/portfolio/book.png" alt="..." />
				    </div>
				</div>
			    <!-- Modal 2-->
				<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
				    <div class="modal-dialog modal-xl">
				        <div class="modal-content">
				            <div class="modal-header border-0">
				                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body text-center pb-5">
				                <div class="container">
				                    <div class="row justify-content-center">
				                        <div class="col-lg-8">
				                            <!-- Portfolio Modal - Title-->
				                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Book A Studio</h2>
				                            <!-- Icon Divider-->
				                            <div class="divider-custom">
				                                <div class="divider-custom-line"></div>
				                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
				                                <div class="divider-custom-line"></div>
				                            </div>
				                            <!-- Portfolio Modal - Text-->
				                            <p class="mb-4">Unlock the door to your creativity and reserve 
				                            your dream studio space effortlessly with our intuitive booking system, 
				                            designed to make your vision a reality, one booking at a time.</p>
				                            <a href="book" class="btn btn-primary">Book Now</a>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				
			    <!-- Explore Item 3-->
			    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
				    <h4 class="text-center text-uppercase mb-3">Manage</h4>
				    <div class="divider-custom">
				        <div class="divider-custom-line"></div>
				    </div>
				    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
				        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
				            <div class="portfolio-item-caption-content text-center text-white">
				                <i class="fas fa-plus fa-3x"></i>
				            </div>
				        </div>
				        <img class="img-fluid" src="assets/img/portfolio/manage.png" alt="..." />
				    </div>
				</div>
			    <!-- Modal 3-->
				<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
				    <div class="modal-dialog modal-xl">
				        <div class="modal-content">
				            <div class="modal-header border-0">
				                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body text-center pb-5">
				                <div class="container">
				                    <div class="row justify-content-center">
				                        <div class="col-lg-8">
				                            <!-- Portfolio Modal - Title-->
				                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Manage Booking</h2>
				                            <!-- Icon Divider-->
				                            <div class="divider-custom">
				                                <div class="divider-custom-line"></div>
				                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
				                                <div class="divider-custom-line"></div>
				                            </div>
				                            <!-- Portfolio Modal - Text-->
				                            <p class="mb-4">Take control of your studio experience with our 
				                            easy-to-use booking management tools, empowering you to edit, 
				                            cancel, and optimize your bookings with just a few clicks.</p>
				                            <a href="manage" class="btn btn-primary">Manage</a>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
						    
			</div>
		</div>
	</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0 about" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">The creative industries are booming, 
					and the need for dedicated studio space is soaring.
					From photography to fitness, studios provide professionals and hobbyists 
					with the perfect environment to bring their ideas to life.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">This is where we, MaK developed a 
					Studio Booking System using Java and SQL.
					We step in to streamline the process, 
					enhance user experience, and optimize resource utilization.</p>
				</div>
			</div>
			<!-- About Section Button-->
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light"
					href="https://github.com/Malvericus"> <i
					class="fas fa-download me-2"></i> View on GitHub
				</a>
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
