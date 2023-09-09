package placement.model;

import DbUtils.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Placement {

	private int pId;
	private String companyName;
	private String jobRole;
	private String pack;
	private String eligibility;
	private String date;
	private String description;

	public int getpId() {
		return pId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getJobRole() {
		return jobRole;
	}

	public String getPack() {
		return pack;
	}

	public String getEligibility() {
		return eligibility;
	}

	public String getDate() {
		return date;
	}

	public String getDescription() {
		return description;
	}

	public Placement(int pId, String companyName, String jobRole, String pack, String eligibility, String date,
			String description) {
		super();
		this.pId = pId;
		this.companyName = companyName;
		this.jobRole = jobRole;
		this.pack = pack;
		this.eligibility = eligibility;
		this.date = date;
		this.description = description;
	}

	public boolean addJob(){
		boolean status=false;
		Connection con=null;
		PreparedStatement pst;
		try{
			con = DbConnection.getConnection();
			String qry="insert into placement values(?,?,?,?,?,?,?)";
			pst=con.prepareStatement(qry);
			pst.setInt(1, pId);
			pst.setString(2,companyName);
			pst.setString(3,jobRole);
			pst.setString(4,pack);
			pst.setString(5,eligibility);
			pst.setString(6,date);
			pst.setString(7,description);
			int n=pst.executeUpdate();
			if(n>0){
				status=true;
			}
			pst.close();
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
			status=false;
		}
		return status;
	}

	public boolean updateJob() {
		boolean status=false;
		Connection con=null;
		PreparedStatement pst;	
		try{
			con = DbConnection.getConnection();
			String qry="update placement set company_name=?,job_role=?,package=?,eligibility=?,"
					+ "interview_date=?,description=? where pid="+pId;
			pst=con.prepareStatement(qry);
			pst.setString(1,companyName);
			pst.setString(2,jobRole);
			pst.setString(3,pack);
			pst.setString(4,eligibility);
			pst.setString(5,date);
			pst.setString(6,description);
			int n=pst.executeUpdate();
			if(n>0){
				status=true;
			}
			pst.close();
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
			status=false;
		}
		return status;
	}
	
}
