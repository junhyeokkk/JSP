package ch07;

public class FiletestVO {
	private int no;
	private String uid;
	private String name;
	private String oname;
	private String sname;
	private String rdate;
	
	
	public FiletestVO() {

	}
	public FiletestVO(int no, String uid, String name, String oname, String sname, String rdate) {
		this.no = no;
		this.uid = uid;
		this.name = name;
		this.oname = oname;
		this.sname = sname;
		this.rdate = rdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "FiletestVO [no=" + no + ", uid=" + uid + ", name=" + name + ", oname=" + oname + ", sname=" + sname
				+ ", rdate=" + rdate + "]";
	}
	
	
}
