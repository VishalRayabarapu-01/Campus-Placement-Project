<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../contents/bootstrap.css">
<script src="../contents/bootstrap.bundle.min.js"></script>
<style>
a:hover {
	text-decoration: underline;
}
</style>
<title>Company HomePage</title>
</head>
<body>
	<%@page import="java.util.List,placement.model.*"%>
	<div class="container-fluid">
		<div class="row bg-info">
			<div class="col-2 p-0">
				<img class="img-fluid" src="../images/logo.jpeg" alt=""
					style="height: 90px; width: 190px;">
			</div>
			<div class="col fw-bolder mt-4 fs-1 text-center">Placements and
				recuirement</div>
		</div>
	</div>
	<div class="container-fluid p-0">
		<nav class="navbar bg-success navbar-expand-lg ">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
					href="CompanyHome.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
					href="">Profile</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Placements</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item"
							href="CompanyHome.jsp?addjob=done">Post</a></li>
						<li><a class="dropdown-item"
							href="/CampusPlacementProject/viewTable">View</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Selected</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="addStudC">Select
								Student</a></li>
						<li><a class="dropdown-item" href="viewStudC">View
								Student</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
					href="../HomePage.jsp">Logout</a></li>
			</ul>
		</nav>
	</div>
	<div class="row">
		<div class="h1 p-3 m-2 text-center fw-light">Company's
			ViewPage:-</div>
		<hr>
	</div>

	<%
		if (request.getParameter("addjob") != null) {
	%>
	<div class="container">
		<form action="/CampusPlacementProject/AddJobRole" method="post">
			<div class="row">
				<div class="col">
					<div class="form-group mt-2">
						<label>Placement Id:</label> <input type="text" required
							class="form-control mt-1" name="pid" id="">
					</div>
					<div class="form-group mt-2">
						<label>Company Name:</label> <input type="text"
							class="form-control mt-1" required name="cname" id="">
					</div>
					<div class="form-group mt-2">
						<label>Job role:</label> <input type="text"
							class="form-control mt-1" name="jrole" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Package :</label> <input type="text"
							class="form-control mt-1" name="package" id="" required>
					</div>
				</div>
				<div class="col">
					<div class="form-group mt-2">
						<label>Eligibility :</label> <input type="text"
							class="form-control mt-1" name="eligibility" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Interview Date:</label> <input type="date"
							class="form-control mt-1" name="date" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Description :</label>
						<textarea name="description" class="form-control mt-1" id=""
							cols="10" rows="5" required></textarea>
					</div>
					<%
						if (request.getParameter("status") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Job Added </small>
					</div>
					<%
						}
							if (request.getParameter("status1") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Add Job details.</small>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="text-center mt-3">
				<input type="submit" name="addjob" class="btn btn-success"
					value="Add">
			</div>
		</form>
	</div>
	<%
		}
	%>
	<%
		if (request.getParameter("viewdata") != null && request.getParameter("viewdata").equals("status")) {
	%>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead class="table-success">
				<tr>
					<th>Placement Id</th>
					<th>Company Name</th>
					<th>Role</th>
					<th>Package</th>
					<th>Eligibility</th>
					<th>Date</th>
					<th>Description</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody class="table-light">
				<%
					List<Placement> list = (List<Placement>) session.getAttribute("viewList");
						session.removeAttribute("viewList");
						for (Placement p : list) {
							String edit = "/CampusPlacementProject/EditJobTable?id=" + p.getpId();
							String delete = "/CampusPlacementProject/DelJobTable?id=" + p.getpId();
				%>
				<tr>
					<td><%=p.getpId()%></td>
					<td><%=p.getCompanyName()%></td>
					<td><%=p.getJobRole()%></td>
					<td><%=p.getPack()%></td>
					<td><%=p.getEligibility()%></td>
					<td><%=p.getDate()%></td>
					<td><%=p.getDescription()%></td>
					<td><a class="btn btn-sm btn-danger" href=<%=edit%>>Edit</a></td>
					<td><a class="btn btn-sm btn-danger" href=<%=delete%>>Delete</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		}
		String msg = request.getParameter("viewdata");
		if (msg != null) {
			if (msg.equals("invalid")) {
	%>
	<div class="container text-center">
		<img alt="Image not Loaded" src="../images/noDataFound.jpeg">
	</div>
	<%
		}
		}
	%>

	<%
		if (request.getParameter("editPost") != null) {
			Placement p = (Placement) session.getAttribute("editJobValues");
	%>
	<div class="container">
		<form action="/CampusPlacementProject/AddJobRole" method="post">
			<div class="row">
				<div class="col">
					<div class="form-group mt-2">
						<label>Placement Id:</label> <input type="text" required
							class="form-control mt-1" value=<%=p.getpId()%> name="pid" id="">
					</div>
					<div class="form-group mt-2">
						<label>Company Name:</label> <input type="text"
							class="form-control mt-1" value=<%=p.getCompanyName()%> required
							name="cname" id="">
					</div>
					<div class="form-group mt-2">
						<label>Job role:</label> <input type="text"
							class="form-control mt-1" value=<%=p.getJobRole()%> name="jrole"
							id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Package :</label> <input type="text"
							class="form-control mt-1" value=<%=p.getPack()%> name="package"
							id="" required>
					</div>
				</div>
				<div class="col">
					<div class="form-group mt-2">
						<label>Eligibility :</label> <input type="text"
							class="form-control mt-1" value=<%=p.getEligibility()%>
							name="eligibility" id="" required>
					</div>
					<%
						String date[] = p.getDate().split("-");
						String newDate=date[2]+"-"+date[1]+"-"+date[0];
					%>
					<div class="form-group mt-2">
						<label>Interview Date:</label> <input type="date"
							class="form-control mt-1" value=<%=newDate%> name="date" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Description :</label>
						<textarea name="description" class="form-control mt-1" id=""
							cols="10" rows="5" required><%=p.getDescription()%></textarea>
					</div>
					<%
						if (request.getParameter("status") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Job Updated </small>
						
					</div>
					<%
						}
							if (request.getParameter("status1") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Update Job details.</small>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="text-center mt-3">
				<input type="submit" name="updateJob" class="btn btn-success"
					value="Update">
			</div>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>