package loginDAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import loginBean.UploadAudit;

public class RowMapperAudit implements RowMapper<UploadAudit> {

	@Override
	public UploadAudit mapRow(ResultSet rs, int rowCount) throws SQLException {
		UploadAudit audit = new UploadAudit();
		audit.setAuditID(rs.getInt(1));
		audit.setUserName(rs.getString(2));
		audit.setFileName(rs.getString(3));
		audit.setStatus(rs.getString(4));
		audit.setUploadDate(rs.getDate(5));
		return audit;
	}

}
