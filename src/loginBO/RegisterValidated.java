package loginBO;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import loginBean.Register;
import loginDAO.ValidateRegistration;

public class RegisterValidated {

	public ValidateRegistration getloginBean() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ValidateRegistration valid = (ValidateRegistration) context.getBean("registration");
		return valid;

	}

	public boolean ValidateUserName(String userName) {
		ValidateRegistration valid = this.getloginBean();
		int count = valid.ValidateUser(userName);
		if (count > 0)
			return true;
		else
			return false;
	}

	public boolean saveUser(Register register) {
		ValidateRegistration save = this.getloginBean();
		;
		int count = save.saveUser(register);
		if (count == 0)
			return false;
		else
			return true;
	}

}
