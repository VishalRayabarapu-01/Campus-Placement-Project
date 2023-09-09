package placement.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import placement.model.Placement;

@WebServlet("/AddJobRole")
public class AddJobRole extends HttpServlet {
	static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pId = Integer.parseInt(request.getParameter("pid"));
		String companyName = request.getParameter("cname");
		String jobRole = request.getParameter("jrole");
		String pack = request.getParameter("package");
		String eligibility = request.getParameter("eligibility");
		String date = request.getParameter("date");
		String description = request.getParameter("description");
		
		
		String arr[]=date.split("-");
		String date1=arr[2]+"-"+arr[1]+"-"+arr[0];
		
		/*PrintWriter pw=response.getWriter();
		pw.println("<h1>"+date1);
		pw.close();*/
		boolean status=new Placement(pId,companyName,jobRole,pack,eligibility,date1,description).addJob();
		
		boolean status1=new Placement(pId,companyName,jobRole,pack,eligibility,date1,description).updateJob();
		
		if(request.getParameter("updateJob")!=null && request.getParameter("updateJob").equals("Update")){
			
			if(status1){
				response.sendRedirect("/CampusPlacementProject/company/CompanyHome.jsp?editPost=done&status=true");
			}
			else{
				response.sendRedirect("/CampusPlacementProject/company/CompanyHome.jsp?editPost=done&status1=true");
			}
			
		}
		
		if(request.getParameter("addjob")!=null && request.getParameter("addjob").equals("Add"))
		if(status){
			response.sendRedirect("/CampusPlacementProject/company/CompanyHome.jsp?addjob=done&status=true");
		}
		else{
			response.sendRedirect("/CampusPlacementProject/company/CompanyHome.jsp?addjob=done&status1=true");
		}
				
	}
}
