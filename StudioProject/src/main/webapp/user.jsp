<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>    

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
	          User Profile
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
	
	    <!-- User Information -->
	    <%
	    	String userName = (String) request.getAttribute("userName");
		    String userEmail = (String) request.getAttribute("userEmail");
		    String userPhone = (String) request.getAttribute("userPhone");
	    %> 
		    <div class="row justify-content-center">
			  <div class="col-lg-6">
			    <div class="user-info">
			      <div class="info-item mb-3">
			        <i class="fas fa-user fa-2x me-4"></i>
			        <span class="lead fw-bold fs-4"><%= userName %></span>
			      </div>
			      <hr class="info-divider">
			      <div class="info-item mb-3">
			        <i class="fas fa-envelope fa-2x me-4"></i>
			        <span class="lead fw-bold fs-4"><%= userEmail %></span>
			      </div>
			      <hr class="info-divider">
			      <div class="info-item mb-3">
			        <i class="fas fa-phone fa-2x me-4"></i>
			        <span class="lead fw-bold fs-4"><%= userPhone %></span>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- Heading and Divider -->
			<div class="row justify-content-center">
			  <div class="col-lg-8 text-center">
			    <h2 class="page-section-heading text-uppercase text-secondary mb-0 mt-5">
			      Booking History
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

			<!-- Booking History Items -->
			<div class="row justify-content-center">
			  <div class="col-lg-8">
			    <%
			      Map<Integer, Boolean> paymentStatus = (Map<Integer, Boolean>) session.getAttribute("paymentStatus");
			      if (paymentStatus == null) {
			        paymentStatus = new HashMap<>();
			      }
			
			      List<Integer> rentIDs = (List<Integer>) request.getAttribute("rentIDs");
			      List<String> studioNames = (List<String>) request.getAttribute("studioNames");
			      for (int i = 0; i < rentIDs.size(); i++) {
			        int rentID = rentIDs.get(i);
			        String studioName = studioNames.get(i);
			        Boolean paid = paymentStatus.get(rentID);
			        if (paid == null) {
			          paid = false;
			        }
			    %>
			    <div class="card booking-card mb-3">
			      <div class="card-body d-flex justify-content-between align-items-center">
			        <span class="rent-id">RentID: <%= rentID %></span>
			        <h5 class="studio-name m-0"><%= studioName %></h5>
			        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#portfolioModal<%= i %>">View Details</button>
			      </div>
			    </div>
			
			    <!-- Booking Details Modal -->
			    <%
			      List<Integer> rentDetails = (List<Integer>) request.getAttribute("rentDetails");
			      List<String> studioDetails = (List<String>) request.getAttribute("studioDetails");
			      List<Integer> peopleDetails = (List<Integer>) request.getAttribute("peopleDetails");
			      List<String> startDetails = (List<String>) request.getAttribute("startDetails");
			      List<String> endDetails = (List<String>) request.getAttribute("endDetails");
			      List<Double> priceDetails = (List<Double>) request.getAttribute("priceDetails");
			
			      int r = rentDetails.get(i);
			      String s = studioDetails.get(i);
			      int ppl = peopleDetails.get(i);
			      String sd = startDetails.get(i);
			      String ed = endDetails.get(i);
			      double price = priceDetails.get(i);
			    %>
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
			                  <!-- Booking Details Title -->
			                  <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Booking Details</h2>
			                  <!-- Icon Divider -->
			                  <div class="divider-custom">
			                    <div class="divider-custom-line"></div>
			                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
			                    <div class="divider-custom-line"></div>
			                  </div>
			                  <!-- Booking Details Columns -->
			                  <div class="row mt-4">
			                    <div class="col-md-4">
			                      <h6>RentID</h6>
			                      <hr>
			                      <p id="modal-rent-id" class="lead"><%= r %></p>
			                    </div>
			                    <div class="col-md-4">
			                      <h6>Studio Name</h6>
			                      <hr>
			                      <p id="modal-studio-name" class="lead"><%= s %></p>
			                    </div>
			                    <div class="col-md-4">
			                      <h6>No. of People</h6>
			                      <hr>
			                      <p id="modal-people-no" class="lead"><%= ppl %></p>
			                    </div>
			                  </div>
			                  <div class="row mt-4">
			                    <div class="col-md-4">
			                      <h6>Start Date</h6>
			                      <hr>
			                      <p id="modal-start-date" class="lead"><%= sd %></p>
			                    </div>
			                    <div class="col-md-4">
			                      <h6>End Date</h6>
			                      <hr>
			                      <p id="modal-end-date" class="lead"><%= ed %></p>
			                    </div>
			                    <div class="col-md-4">
			                      <h6>Price</h6>
			                      <hr>
			                      <p id="modal-price" class="lead"><%= price %></p>
			                    </div>
			                  </div>
			                  <% if (!paid) { %>
			                    <div class="row mt-4" id="payment-row-<%= i %>">
			                      <div class="col-12 text-center">
			                        <a href="payment?rentID=<%= rentID %>" target="_blank" class="btn btn-primary" onclick="proceedToPayment(<%= i %>, <%= paid %>)">Proceed to Pay</a>
			                      </div>
			                    </div>
			                  <% } %>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			    <% } %>
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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
	<script>
	  function proceedToPayment(modalIndex, paid) {
	    var paymentRow = document.getElementById('payment-row-' + modalIndex);
	    paymentRow.style.display = 'none';
	
	    if (paid) {
	      var modal = paymentRow.closest('.portfolio-modal');
	      modal.style.display = 'none';
	    }
	  }
	
	  window.addEventListener('unload', function(event) {
	    var modals = document.querySelectorAll('.portfolio-modal');
	    modals.forEach(function(modal) {
	      modal.style.display = 'none';
	    });
	  });
	</script>

</body>
</html>