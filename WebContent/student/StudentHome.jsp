<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../contents/bootstrap.css">
<script src="../contents/bootstrap.bundle.min.js"></script>
<style>
a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<%@page import="placement.model.Stud"%>
	<div class="container-fluid">
		<div class="row bg-info">
			<div class="col-2 p-0">
				<img class="img-fluid" src="../images/logo.jpeg" alt=""
					style="height: 90px; width: 190px;">
			</div>
			<div class="col fw-bolder mt-4 fs-1 text-center">Placements and
				Recruitment</div>
		</div>
	</div>
	<div class="container-fluid p-0">
		<nav class="navbar bg-success navbar-expand-lg ">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
				href="StudentHome.jsp">Home</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
				role="button" data-bs-toggle="dropdown">Profile</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item"
						href="/CampusPlacementProject/ViewStud">View</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
				role="button" data-bs-toggle="dropdown">Placements</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="">View Placements</a></li>
					<li><a class="dropdown-item" href="">Applied Placements</a></li>
				</ul></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
				role="button" data-bs-toggle="dropdown">Queries</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="">Post Query</a></li>
					<li><a class="dropdown-item" href="">View Query</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
				href="StudentLogin.jsp">Logout</a></li>
		</ul>
		</nav>
	</div>
	<div class="row">
		<div class="h1 p-3 m-2 text-center fw-light">Student's
			ViewPage:-</div>
		<hr>
	</div>
	<%
		if (request.getParameter("viewProfile") != null) {
			Stud student = (Stud) session.getAttribute("sdetails");
	%>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Name</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getName()%></div>
				</div>
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Hall
						Ticket</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getHtno()%></div>
				</div>
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Address</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getAddress()%></div>
				</div>
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Email</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getEmail()%></div>
				</div>
			</div>
			<div class="col-5">
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Mobile</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getMobno()%></div>
				</div>

				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Branch</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getBranch()%></div>
				</div>
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Sem</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getSem()%></div>
				</div>
				<div class="row">
					<div class="col-4 mt-3 mb-3 pt-3 fs-2 pb-3 ms-3 pe-0 ps-3">Password</div>
					<div class="col-1 mt-3 mb-3 pt-3 fs-2 pb-3">:</div>
					<div class="col mt-3 mb-3 pt-3 fs-2 pb-3"><%=student.getSpassword()%></div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>