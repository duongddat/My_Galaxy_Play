package bean;

public class adminbean {
	private String username;
	private String password;
	private Boolean quyen;
	
	public adminbean() {
		super();
	}

	public adminbean(String username, String password, Boolean quyen) {
		super();
		this.username = username;
		this.password = password;
		this.quyen = quyen;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getQuyen() {
		return quyen;
	}

	public void setQuyen(Boolean quyen) {
		this.quyen = quyen;
	}
}
