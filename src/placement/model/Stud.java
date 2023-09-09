package placement.model;

public class Stud {
	private String htno;
	private String name;
	private String address;
	private String mobno;
	private String email;
	private String branch;
	private String spassword;
	private int sem;

	public String getHtno() {
		return htno;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getMobno() {
		return mobno;
	}

	public String getEmail() {
		return email;
	}

	public String getBranch() {
		return branch;
	}

	public String getSpassword() {
		return spassword;
	}

	public int getSem() {
		return sem;
	}

	public Stud(String htno, String name, String address, String mobno, 
			String email, String branch, String spassword,
			int sem) {
		this.htno = htno;
		this.name = name;
		this.address = address;
		this.mobno = mobno;
		this.email = email;
		this.branch = branch;
		this.spassword = spassword;
		this.sem = sem;
	}
}
