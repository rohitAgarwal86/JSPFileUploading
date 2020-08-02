package loginDAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import loginBean.GetDate;

public class RowMapperDates implements RowMapper<GetDate> {

	@Override
	public GetDate mapRow(ResultSet rs, int noOfRows) throws SQLException {
		GetDate date = new GetDate();
		date.setCob_date(rs.getDate(1));
		date.setRunId(rs.getInt(2));
		return date;
	}

}
