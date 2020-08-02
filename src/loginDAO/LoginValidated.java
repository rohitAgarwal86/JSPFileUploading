package loginDAO;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import loginBean.Login;

public class LoginValidated {

	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<Login> validateLogin(Login login) {
		String uName = login.getUserName();
		String sql = "SELECT user_name,user_password FROM user_details where user_name ='" + uName + "';";

		List<Login> loginSql = template.query(sql, new RowMapperLogin());
		return loginSql;

	}

}
