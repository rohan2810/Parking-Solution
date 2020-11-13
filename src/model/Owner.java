package model;

public class Owner extends User {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String onwer_code;

	public Owner(String username, String email, String name, String phone_number, String password, String onwer_code) {
		super(username, email, name, phone_number, password);
		this.onwer_code = onwer_code;
	}

	public String getOnwer_code() {
		return onwer_code;
	}

	public void setOnwer_code(String onwer_code) {
		this.onwer_code = onwer_code;
	}

}
