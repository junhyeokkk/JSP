package sub1;

public class Account {
	private String bank;
	private String accid;
	private String name;
	private int balance;
	
	public Account(String bank, String accid, String name, int balance) {
		this.bank = bank;
		this.accid = accid;
		this.name = name;
		this.balance = balance;
	}
	
	@Override
	public String toString() {
		return "Account [bank=" + bank + ", accid=" + accid + ", name=" + name + ", balance=" + balance + "]";
	}
	
}
