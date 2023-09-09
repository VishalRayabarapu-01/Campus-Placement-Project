package placement.controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbUtils.DbConnection;
import placement.model.Stud;

@WebServlet("/ViewStud")
public class ViewStudTable extends HttpServlet {
	 static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession s = request.getSession();
		String sid = (String) s.getAttribute("sid");

		try {
			Connection con=DbConnection.getConnection();
			Statement st = con.createStatement();
			String qry="select * from stud where htno ='"+sid+"'";
			ResultSet rs=st.executeQuery(qry);
			if(rs.next()){
				 String htno=rs.getString("htno");
				 String name=rs.getString("name");
				 String address=rs.getString("address");
				 String mobno=rs.getString("mobno");
				 String email=rs.getString("email");
				 String branch=rs.getString("branch");
				 String spassword=rs.getString("spassword");
				 int sem=rs.getInt("sem");
				 Stud student=new Stud(htno, name, address, mobno, email, branch, spassword, sem);
				 s.setAttribute("sdetails",student);
				 response.sendRedirect("student/StudentHome.jsp?viewProfile=set");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
