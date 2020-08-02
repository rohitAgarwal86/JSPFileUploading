package loginBean;

import java.util.Date;
import java.util.List;

import loginBO.FileUploadingBO;

public class UploadAudit {

	private String userName;
	private String fileName;
	private String status;
	private int auditID;
	private Date uploadDate;

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getAuditID() {
		return auditID;
	}

	public void setAuditID(int auditID) {
		this.auditID = auditID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean saveUserAudit() {
		boolean value = false;
		FileUploadingBO upload = new FileUploadingBO();
		value = upload.saveAuditValue(this);
		return value;
	}

	public List<UploadAudit> getAudit() {
		FileUploadingBO upload = new FileUploadingBO();
		List<UploadAudit> audit = upload.getAuditDetails();
		return audit;
	}

}
