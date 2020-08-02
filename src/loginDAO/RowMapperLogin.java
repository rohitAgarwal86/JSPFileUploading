package loginDAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import loginBean.Login;

public class RowMapperLogin implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int noOfRows) throws SQLException {
		Login login = new Login();
		login.setUserName(rs.getString(1));
		login.setPassword(rs.getString(2));
		return login;
	}

}
