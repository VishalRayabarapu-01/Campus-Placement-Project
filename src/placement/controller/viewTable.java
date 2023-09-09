package placement.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbUtils.DbConnection;
import placement.model.Placement;

@WebServlet("/viewTable")
public class viewTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean details=false;
		List<Placement> list=new ArrayList<Placement>();
		Connection con=DbConnection.getConnection();
		try{
			Statement st=con.createStatement();
			String qry="select * from placement";
			ResultSet rs=st.executeQuery(qry);
			while(rs.next()){
				details=true;
				int id=rs.getInt("pid");
				String name=rs.getString("company_name");
				String jobRole=rs.getString("job_role");
				String package1=rs.getString("package");
				String elig=rs.getString("eligibility");
				String idate=rs.getString("interview_date");
				String desc=rs.getString("description");
				list.add(new Placement(id,name,jobRole,package1,elig,idate,desc));
			}
			if(details){
				HttpSession session=request.getSession();
				session.setAttribute("viewList", list);
				response.sendRedirect("company/CompanyHome.jsp?viewdata=status");
			}
			else{
				response.sendRedirect("company/CompanyHome.jsp?viewdata=invalid");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
