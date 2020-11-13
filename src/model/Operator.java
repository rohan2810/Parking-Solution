package model;

public class Operator extends User {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String operator_code;

	public Operator(String username, String email, String name, String phone_number, String password,
			String operatorCode) {
		super(username, email, name, phone_number, password);
		this.operator_code = operatorCode;
	}

	public String getOperatorCode() {
		return operator_code;
	}

	public void setOperatorCode(String operator_code) {
		this.operator_code = operator_code;
	}

}
