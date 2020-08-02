package loginDAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import loginBean.FundDetails;
import loginBean.GetDate;
import loginBean.UploadAudit;

public class FileUploadingDAO {

	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<GetDate> getCobDate() {
		String sql = "select distinct cob_date,run_id from date_card where load_status ='C';";
		List<GetDate> cob_date = template.query(sql, new RowMapperDates());
		return cob_date;
	}

	public int saveAuditValues(UploadAudit upload) {
		String sql = "insert into user_audit (user_name,fileName,file_status) values (?,?,?)";
		int value = template.update(sql,
				new Object[] { upload.getUserName(), upload.getFileName(), upload.getStatus() });
		return value;
	}

	public List<UploadAudit> getAuditDetails() {
		String sql = "select * from user_audit order by audit_Id desc;";

		List<UploadAudit> upload = template.query(sql, new RowMapperAudit());
		return upload;
	}

	public List<Integer> getIds() {
		String sql1 = "select max(audit_Id) from user_audit;";
		int auditId = template.queryForObject(sql1, Integer.class);

		String sql2 = "select ifnull(max(template_id),0) from fund_details;";
		int temp = template.queryForObject(sql2, Integer.class);

		List<Integer> Ids = new ArrayList<>();
		Ids.add(auditId);
		Ids.add(temp);

		return Ids;

	}

	public int saveFunds(List<FundDetails> funds) {
		int rowCount = 0;
		String sql = "insert into fund_details (audit_Id,line_number,template_id,cob_date,run_id,record_type,dept_id,dept_name,fund_id,"
				+ "fund_name,csExposure,total_fund_asset,total_fund_equity,asset_class,assest_sub_class,exposure_category,exposure_amount)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		Iterator<FundDetails> it = funds.iterator();
		while (it.hasNext()) {
			FundDetails fund = it.next();
			int temp = template.update(sql,
					new Object[] { fund.getAuditId(), fund.getLineNumber(), fund.getTemplateId(), fund.getCobDate(),
							fund.getRunId(), fund.getRecordType(), fund.getDeptId(), fund.getDeptName(),
							fund.getFundId(), fund.getFundName(), fund.getCsExposure(), fund.getTotalFundAsset(),
							fund.getTotalFundEquity(), fund.getAssetClass(), fund.getAssetSubClass(),
							fund.getExposureCategory(), fund.getExposureAmount() });
			rowCount += temp;

		}
		System.out.println(rowCount);
		return rowCount;
	}

	public void updateAudit(String status, int auditId) {
		String sql = "update user_audit set file_status =? where audit_Id=?;";
		template.update(sql, new Object[] { status, auditId });
	}

}
