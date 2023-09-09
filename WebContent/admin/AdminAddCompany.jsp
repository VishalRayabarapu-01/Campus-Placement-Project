<%@ page import="java.io.*,java.sql.*,DbUtils.*"%>
<%
	//Changes...
	PreparedStatement pst;
	Connection con=DbConnection.getConnection();
	String qry1 = "insert into company values(?,?,?,?,?,?,?,?,?)";
	pst = con.prepareStatement(qry1);
	pst.setString(1, request.getParameter("cid"));
	pst.setString(2, request.getParameter("cname"));
	pst.setString(3, request.getParameter("clocation"));
	pst.setString(5, request.getParameter("cmobile"));
	pst.setString(6, request.getParameter("cemail"));
	pst.setString(4, request.getParameter("clevel"));
	pst.setString(7, request.getParameter("cwebsite"));
	pst.setString(8, request.getParameter("cuser"));
	pst.setString(9, request.getParameter("cpass"));
	int n = pst.executeUpdate();
	pst.close();
	con.close();
	if(n>0){
		response.sendRedirect("AdminHome.jsp?addCompany=add&status1=ok");
	}else{
		response.sendRedirect("AdminHome.jsp?addCompany=add&status1=fail");
	}
%>