package loginDAO;

import org.springframework.jdbc.core.JdbcTemplate;

import loginBean.Register;

public class ValidateRegistration {

	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int ValidateUser(String UserName) {
		int count = 0;
		String query = "SELECT count(*) FROM user_details where user_name =?";
		count = this.template.queryForObject(query, new Object[] { UserName }, Integer.class);
		return count;
	}

	public int saveUser(Register reg) {
		int value = 0;
		try {
			String query = "insert into user_details (user_name,email,first_name,last_name,user_dob,user_sex,user_password) "
					+ "values (?,?,?,?,?,?,?)";
			value = template.update(query, new Object[] { reg.getUserName(), reg.getEmail(), reg.getFirstName(),
					reg.getLastName(), reg.getDateOfBirth(), reg.getSex(), reg.getPassword() });
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;

	}

}
