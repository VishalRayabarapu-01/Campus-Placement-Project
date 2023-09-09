package placement.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DbUtils.DbConnection;
import placement.model.Placement;

@WebServlet("/EditJobTable")
public class EditJobTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try{
			int pid=Integer.parseInt(request.getParameter("id"));
			String qry="select * from placement where pid="+pid;
			Connection con=DbConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qry);
			if(rs.next()){
				int id=rs.getInt("pid");
				String name=rs.getString("company_name");
				String jobRole=rs.getString("job_role");
				String package1=rs.getString("package");
				String elig=rs.getString("eligibility");
				String idate=rs.getString("interview_date");
				String desc=rs.getString("description");
				Placement p=new Placement(id,name,jobRole,package1,elig,idate,desc);
				request.getSession().setAttribute("editJobValues",p);
				response.sendRedirect("company/CompanyHome.jsp?editPost=valid");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
