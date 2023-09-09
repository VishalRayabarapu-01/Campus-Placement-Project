package placement.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DbUtils.DbConnection;
import placement.model.Placement;

@WebServlet("/DelJobTable")
public class DelJobTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			int pid=Integer.parseInt(request.getParameter("id"));
			String qry="delete from placement where pid="+pid;
			Connection con=DbConnection.getConnection();
			Statement st=con.createStatement();
			int n=st.executeUpdate(qry);
			if(n>0){
				response.sendRedirect("viewTable");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
