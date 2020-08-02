package loginBO;

import java.util.Iterator;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import loginBean.FundDetails;
import loginBean.GetDate;
import loginBean.UploadAudit;
import loginDAO.FileUploadingDAO;

public class FileUploadingBO {

	public FileUploadingDAO getUploadBean() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FileUploadingDAO upload = (FileUploadingDAO) context.getBean("upload");
		return upload;

	}

	public List<GetDate> getDates() {
		FileUploadingDAO upload = this.getUploadBean();
		List<GetDate> Cob_dates = upload.getCobDate();
		return Cob_dates;
	}

	public boolean saveAuditValue(UploadAudit audit) {
		FileUploadingDAO upload = this.getUploadBean();
		upload.saveAuditValues(audit);
		return true;
	}

	public List<UploadAudit> getAuditDetails() {
		FileUploadingDAO upload = this.getUploadBean();
		List<UploadAudit> audit = upload.getAuditDetails();
		return audit;
	}

	public List<Integer> getMaxIds() {
		FileUploadingDAO upload = this.getUploadBean();
		List<Integer> ids = upload.getIds();
		return ids;
	}

	public boolean saveFunds(List<FundDetails> funds) {

		FileUploadingDAO upload = this.getUploadBean();
		int rowCount = upload.saveFunds(funds);
		Iterator<FundDetails> fund = funds.iterator();
		int auditID = fund.next().getAuditId();
		if (rowCount == 0) {
			upload.updateAudit("F", auditID);
			return false;
		} else {
			upload.updateAudit("C", auditID);
			return true;
		}

	}

}
