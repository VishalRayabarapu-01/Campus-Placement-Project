<%@ page import="java.io.*,java.sql.*,DbUtils.*"%>
<%
	PreparedStatement pst;
	Connection con = DbConnection.getConnection();
	String query = "update stud set name=?,address=?,mobno=?,email=?,branch=?,sem=?,spassword=?"
			+ " where htno='" + request.getParameter("htno") + "'";
	pst = con.prepareStatement(query);
	pst.setString(1, request.getParameter("sname"));
	pst.setString(2, request.getParameter("saddress"));
	pst.setString(3, request.getParameter("smobno"));
	pst.setString(4, request.getParameter("semail"));
	pst.setString(5, request.getParameter("sbranch"));
	pst.setString(6, request.getParameter("ssem"));
	pst.setString(7, request.getParameter("spass"));
	int n = pst.executeUpdate();
	pst.close();
	con.close();
	if (n > 0) {
		response.sendRedirect("AdminHome.jsp?viewst=view");
	} else {
		response.sendRedirect("AdminUpdateStud.jsp?htno=" + request.getParameter("htno") + "&notupdate=ok&");
	}
%>