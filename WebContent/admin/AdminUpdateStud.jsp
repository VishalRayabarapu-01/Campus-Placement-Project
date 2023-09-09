<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin HomePage</title>
<%@include file="headerInc.jsp"%>
</head>
<body>
	<%@ page import="java.io.*,java.sql.*,DbUtils.*"%>
	<%!
	Statement st;
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
					href="HomePage.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fs-3 p-3 text-light" href="#"
					role="button" data-bs-toggle="dropdown">Companies</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="">Add Company</a></li>
						<li><a class="dropdown-item" href="">View Company</a></li>
						<li><a class="dropdown-item" href="">Update Company</a></li>
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
		Connection con=DbConnection.getConnection();
		st = con.createStatement();
		String str = "select * from stud where htno='" + request.getParameter("htno") + "'";
		rs = st.executeQuery(str);
		if (rs.next()) {
	%>
	<div class="container">
		<form
			action="AdminUpdateStudSetVal.jsp" method="post">
			<div class="row">
				<div class="col">
					<div class="form-group mt-2">
						<label>Hallticket No:</label> <input type="text" required
							class="form-control" readonly name="htno" value=<%=rs.getString("htno")%>
							id="">
					</div>
					<div class="form-group mt-2">
						<label>Name:</label> <input type="text" class="form-control"
							required name="sname" value=<%=rs.getString("name")%> id="">
					</div>
					<div class="form-group mt-2">
						<label>Address:</label>
						<textarea name="saddress"  class="form-control" id=""
							cols="10" rows="5" required><%=rs.getString("address")%></textarea>
					</div>
					<div class="form-group mt-2">
						<label>Mobile:</label> <input type="text" class="form-control"
							name="smobno" id="" value=<%=rs.getString("mobno")%> required>
					</div>
				</div>
				<div class="col">
					<div class="form-group mt-2">
						<label>Email:</label> <input type="text" class="form-control"
							name="semail" value=<%=rs.getString("email")%> id="" required>
					</div>
					<div class="form-group mt-2">
						<label>Branch:</label> <input type="text" class="form-control"
							name="sbranch" id="" value=<%=rs.getString("branch")%> required>
					</div>
					<div class="form-group mt-2">
						<label>Sem:</label> <input type="number" class="form-control"
							name="ssem" id="" value=<%=rs.getInt("sem")%> required>
					</div>
					<div class="form-group mt-2">
						<label>Password:</label> <input type="text" class="form-control"
							name="spass" id="" value=<%=rs.getString("spassword")%> required>
					</div>
					<%if(request.getParameter("insert")!=null){%>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Student details Updated.</small>
					</div>
					<%} %>
					<%if(request.getParameter("notupdate")!=null){ %>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Update Student details.</small>
					</div>
					<%} %>
					<%if(request.getParameter("notdelete")!=null){ %>
					<div class="form-group mt-3 text-center">
						<small class="text-danger">*Failed to Delete Student details.</small>
					</div>
					<%} %>
				</div>
			</div>
			<div class="text-center mt-3">
				<input type="submit" class="btn btn-success" value="Update">
			</div>
		</form>
	</div>
	<%
		}
		rs.close();
		st.close();
	%>
	<%if(request.getParameter("delete")!=null){
		Connection con1=DbConnection.getConnection();
		st = con1.createStatement();
		String q="delete from stud where htno='"+request.getParameter("htno") + "'";
		int n=st.executeUpdate(q);
		if(n>0){
			response.sendRedirect("AdminHome.jsp?viewst=view");
		}
		else{
		response.sendRedirect("AdminUpdateStud.jsp?htno="+request.getParameter("htno")+"&notdelete=ok&");
		}
	} %> 
	
</body>
</html>