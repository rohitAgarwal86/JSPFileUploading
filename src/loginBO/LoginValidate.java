package loginBO;

import java.util.Iterator;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import loginBean.Login;
import loginDAO.LoginValidated;

public class LoginValidate {

	public LoginValidated getloginBean() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		LoginValidated login = (LoginValidated) context.getBean("login");
		return login;

	}

	public boolean validateLogin(Login login) {
		LoginValidated logVal = this.getloginBean();
		List<Login> loginList = logVal.validateLogin(login);
		if (loginList.isEmpty())
			return false;
		Iterator<Login> it = loginList.iterator();
		Login sqlLogin = it.next();
		if (sqlLogin != null && sqlLogin.getUserName().equals(login.getUserName())) {
			if (sqlLogin.getPassword().equals(login.getPassword()))
				return true;
		}
		return false;
	}

}
