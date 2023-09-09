<%@ page import="java.io.*,java.sql.*,DbUtils.*"%>
<%
	Connection con = DbConnection.getConnection();
	PreparedStatement pst;
	String qry1 = "insert into stud values(?,?,?,?,?,?,?,?)";
	pst = con.prepareStatement(qry1);
	pst.setString(1, request.getParameter("htno"));
	pst.setString(2, request.getParameter("sname"));
	pst.setString(3, request.getParameter("saddress"));
	pst.setString(4, request.getParameter("smobno"));
	pst.setString(5, request.getParameter("semail"));
	pst.setString(6, request.getParameter("sbranch"));
	pst.setString(7, request.getParameter("ssem"));
	pst.setString(8, request.getParameter("spass"));
	int n = pst.executeUpdate();
	pst.close();
	con.close();
	if (n > 0) {
		response.sendRedirect("AdminHome.jsp?addst=add&status=ok");
	} else {
		response.sendRedirect("AdminHome.jsp?addst=add&status=fail");
	}
%>