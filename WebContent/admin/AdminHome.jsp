<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin HomePage</title>
<%@include file="headerInc.jsp"%>
</head>
<body>
	<%@ page import="java.io.*,java.sql.*,DbUtils.*"%>
	<%!Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int status = 1;%>
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
					href="AdminHome.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Companies</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item"
							href="AdminHome.jsp?addCompany=add">Add Company</a></li>
						<li><a class="dropdown-item"
							href="AdminHome.jsp?viewCompany=view">View Company</a></li>
						<li><a class="dropdown-item"
							href="AdminHome.jsp?updateCompany=up">Update Company</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Students</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="AdminHome.jsp?addst=add">Add
								Student</a></li>
						<li><a class="dropdown-item" href="AdminHome.jsp?viewst=view">View
								Student</a></li>
						<li><a class="dropdown-item"
							href="AdminHome.jsp?updatest=update">Update Student</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Reports</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="">Selected Students</a></li>
						<li><a class="dropdown-item" href="">Pending Students</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link fs-3 p-3 text-light"
					href="AdminLogin.jsp">Logout</a></li>
			</ul>
		</nav>
	</div>
	<div class="row">
		<div class="h1 p-3 m-2 text-center fw-light">Admin homePage:-</div>
		<hr>
	</div>
	<%
		if (request.getParameter("addst") != null) {
	%>
	<div class="container">
		<form action="AdminAddStud.jsp" method="post">
			<div class="row">
				<div class="col">
					<div class="form-group mt-2">
						<label>Hallticket No:</label> <input type="text" required
							class="form-control" name="htno" id="">
					</div>
					<div class="form-group mt-2">
						<label>Name:</label> <input type="text" class="form-control"
							required name="sname" id="">
					</div>
					<div class="form-group mt-2">
						<label>Address:</label>
						<textarea name="saddress" class="form-control" id="" cols="10"
							rows="5" required></textarea>
					</div>
					<div class="form-group mt-2">
						<label>Mobile:</label> <input type="text" class="form-control"
							name="smobno" id="" required>
					</div>
				</div>
				<div class="col">
					<div class="form-group mt-2">
						<label>Email:</label> <input type="text" class="form-control"
							name="semail" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Branch:</label> <input type="text" class="form-control"
							name="sbranch" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Sem:</label> <input type="number" class="form-control"
							name="ssem" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Password:</label> <input type="text" class="form-control"
							name="spass" id="" required>
					</div>
					<%
						if (request.getParameter("status") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Student Added</small>
					</div>
					<%
						} else if (request.getParameter("status") != null) {
								if (request.getParameter("status").equals("fail")) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Add Student details.</small>
					</div>
					<%
						}
							}
					%>
				</div>
			</div>
			<div class="text-center mt-3">
				<input type="submit" class="btn btn-success" value="Add ">
			</div>
		</form>
	</div>
	<%
		}
	%>
	<%
		if (request.getParameter("viewst") != null) {
			Connection con = DbConnection.getConnection();
			st = con.createStatement();
			String str = "select * from stud";
			rs = st.executeQuery(str);
	%>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead class="table-dark">
				<tr>
					<th>Htno</th>
					<th>Name</th>
					<th>Address</th>
					<th>Mobile No</th>
					<th>Email</th>
					<th>Branch</th>
					<th>Sem</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("htno")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("mobno")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("branch")%></td>
					<td><%=rs.getString("sem")%></td>
					<td><%=rs.getString("spassword")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		rs.close();
			st.close();
			con.close();
		}
	%>

	<!-- Update student details -->
	<%
		if (request.getParameter("updatest") != null) {
			Connection con = DbConnection.getConnection();
			st = con.createStatement();
			String name1 = request.getParameter("uname");
			String pass1 = request.getParameter("pass");
			String str = "select * from stud";
			rs = st.executeQuery(str);
	%>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead class="table-success">
				<tr>
					<th>Htno</th>
					<th>Name</th>
					<th>Address</th>
					<th>Mobile No</th>
					<th>Email</th>
					<th>Branch</th>
					<th>Sem</th>
					<th>Password</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
							String href = "AdminUpdateStud.jsp?htno=" + rs.getString("htno");
							String href1 = "AdminUpdateStud.jsp?htno=" + rs.getString("htno") + "&delete=ok";
				%>
				<tr>
					<td><%=rs.getString("htno")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("mobno")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("branch")%></td>
					<td><%=rs.getString("sem")%></td>
					<td><%=rs.getString("spassword")%></td>
					<td><a class="btn btn-danger btn-sm" href=<%=href%>>Edit</a></td>
					<td><a class="btn btn-danger btn-sm" href=<%=href1%>>Delete</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		rs.close();
			st.close();
			con.close();
		}
	%>
	<!-- Add Company. -->
	<%
		if (request.getParameter("addCompany") != null) {
	%>
	<div class="container">
		<form action="AdminAddCompany.jsp" method="get">
			<div class="row">
				<div class="col">
					<div class="form-group mt-2">
						<label>Company id:</label> <input type="text" required
							class="form-control" name="cid" id="">
					</div>
					<div class="form-group mt-2">
						<label>Name:</label> <input type="text" class="form-control"
							required name="cname" id="">
					</div>
					<div class="form-group mt-2">
						<label>Location:</label>
						<textarea name="clocation" class="form-control" id="" cols="10"
							rows="5" required></textarea>
					</div>
					<div class="form-group mt-2">
						<label>Mobile:</label> <input type="text" class="form-control"
							name="cmobile" id="" required>
					</div>
				</div>
				<div class="col">
					<div class="form-group mt-2">
						<label>Email:</label> <input type="text" class="form-control"
							name="cemail" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Level:</label> <input type="text" class="form-control"
							name="clevel" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Website:</label> <input type="text" class="form-control"
							name="cwebsite" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Username:</label> <input type="text" class="form-control"
							name="cuser" id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Password:</label> <input type="text" class="form-control"
							name="cpass" id="" required>
					</div>
					<%
						if (request.getParameter("status1") != null) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Company Added</small>
					</div>
					<%
						} else if (request.getParameter("status1") != null) {
								if (request.getParameter("status1").equals("fail")) {
					%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Add Company details.</small>
					</div>
					<%
						}
							}
					%>
				</div>
			</div>
			<div class="text-center mt-3">
				<input type="submit" class="btn btn-success" value="Add Company">
			</div>
		</form>
	</div>
	<%
		}
	%>

	<%
		if (request.getParameter("viewCompany") != null) {
			Connection con = DbConnection.getConnection();
			st = con.createStatement();
			String str = "select * from company";
			rs = st.executeQuery(str);
	%>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead class="table-dark">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Location</th>
					<th>Level</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Website</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("cid")%></td>
					<td><%=rs.getString("cname")%></td>
					<td><%=rs.getString("location")%></td>
					<td><%=rs.getString("clevel")%></td>
					<td><%=rs.getString("mobile")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("website")%></td>
					<td><%=rs.getString("uname")%></td>
					<td><%=rs.getString("pass")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		rs.close();
			st.close();
			con.close();
		}
	%>


	<%
		if (request.getParameter("updateCompany") != null) {
			Connection con = DbConnection.getConnection();
			st = con.createStatement();
			String name1 = request.getParameter("uname");
			String pass1 = request.getParameter("pass");
			String str = "select * from company";
			rs = st.executeQuery(str);
	%>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead class="table-success">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Location</th>
					<th>Level</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Website</th>
					<th>Username</th>
					<th>Password</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs.next()) {
							String href = "AdminUpdateCompany.jsp?cid=" + rs.getString("cid");
							String href1 = "AdminUpdateCompany.jsp?cid=" + rs.getString("cid") + "&delete=ok";
				%>
				<tr>
					<td><%=rs.getString("cid")%></td>
					<td><%=rs.getString("cname")%></td>
					<td><%=rs.getString("location")%></td>
					<td><%=rs.getString("clevel")%></td>
					<td><%=rs.getString("mobile")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("website")%></td>
					<td><%=rs.getString("uname")%></td>
					<td><%=rs.getString("pass")%></td>
					<td><a class="btn btn-danger btn-sm" href=<%=href%>>Edit</a></td>
					<td><a class="btn btn-danger btn-sm" href=<%=href1%>>Delete</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		rs.close();
			st.close();
			con.close();
		}
	%>
</body>
</html>