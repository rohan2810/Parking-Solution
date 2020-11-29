package model;

public class User {

	public String username;
	public String email;
	public String name;
	public String phone_number;
	public String password;

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(String username, String email, String name, String phone_number, String password) {
		super();
		this.username = username;
		this.email = email;
		this.name = name;
		this.phone_number = phone_number;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
