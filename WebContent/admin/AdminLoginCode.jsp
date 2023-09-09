<%@ page import="java.io.*,java.sql.*,DbUtils.*" %>
	<%!Connection con;Statement st; %>
	<%  Connection con=DbConnection.getConnection();
		st=con.createStatement();
		String name=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String str="select * from adminlogin where uname='"+name+"' and pass='"+pass+"'";
		ResultSet rs=st.executeQuery(str);
		if(rs.next()){
			rs.close();
			st.close();
			con.close();
			response.sendRedirect("AdminHome.jsp");
		}
		else{
			rs.close();
			st.close();
			con.close();
			response.sendRedirect("AdminLogin.jsp?msg=invalid");
		}%>