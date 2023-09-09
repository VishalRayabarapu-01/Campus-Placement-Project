package DbUtils;
import java.sql.*;
public class DbConnection {
	private static Connection con=null;
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/campusplacement", "root", "");
		} catch (Exception e) {
			con=null;
		}
		return con;
	}
}
