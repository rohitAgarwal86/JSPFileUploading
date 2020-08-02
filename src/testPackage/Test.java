package testPackage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import loginBean.Register;

public class Test {

	public static void main(String[] args) throws ParseException {

		Register reg = new Register();
		reg.setUserName("rohit");
		boolean value = reg.validatedUsername();
		System.out.println(value);
		reg.setEmail("rohit@yahoo.com");
		reg.setFirstName("rohit");
		reg.setLastName("agarwal");
		reg.setSex("Male");
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-mm-dd");
		Date Dob = fmt.parse("1986-12-18");
		reg.setDateOfBirth(Dob);
		reg.setPassword("rohit");
		boolean status = reg.saveUser();
		System.out.println(status);

	}

}
