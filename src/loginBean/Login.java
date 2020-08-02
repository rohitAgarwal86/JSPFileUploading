package loginBean;

import java.io.Serializable;

import loginBO.LoginValidate;

public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	private String UserName;
	private String Password;
	private boolean status;

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean validateLogin() {
		LoginValidate loginValidate = new LoginValidate();
		this.status = loginValidate.validateLogin(this);
		return status;
	}

}
