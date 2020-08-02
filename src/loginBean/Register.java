package loginBean;

import java.io.Serializable;
import java.util.Date;
import loginBO.RegisterValidated;

public class Register implements Serializable {

	private static final long serialVersionUID = 1L;

	private String userName;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private Date dateOfBirth;
	private String sex;
	private String role;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean validatedUsername() {
		boolean count = new RegisterValidated().ValidateUserName(this.userName);
		return count;
	}

	public boolean saveUser() {
		boolean status = new RegisterValidated().saveUser(this);
		return status;
	}

}
