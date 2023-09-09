<%@ page import="java.io.*,java.sql.*" %>
	<%!Connection con;Statement st; %>
	<%  Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/campusplacement","root","");
		st=con.createStatement();
		String name=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String str="select * from companylogin where uname='"+name+"' and pass='"+pass+"'";
		ResultSet rs=st.executeQuery(str);
		if(rs.next()){
			rs.close();
			st.close();
			con.close();
			response.sendRedirect("CompanyHome.jsp");
		}
		else{
			rs.close();
			st.close();
			con.close();
			response.sendRedirect("CompanyLogin.jsp?msg=invalid");
		}
		%>