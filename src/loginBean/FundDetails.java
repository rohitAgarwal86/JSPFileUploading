package loginBean;

import java.util.Date;

public class FundDetails {

	private int auditId;
	private int lineNumber;
	private int templateId;
	private Date cobDate;
	private int runId;
	private String recordType;
	private String deptId;
	private String deptName;
	private String fundId;
	private String fundName;
	private double csExposure;
	private double totalFundAsset;
	private double totalFundEquity;
	private String assetClass;
	private String assetSubClass;
	private String exposureCategory;
	private double exposureAmount;

	public int getAuditId() {
		return auditId;
	}

	public void setAuditId(int auditId) {
		this.auditId = auditId;
	}

	public int getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(int lineNumber) {
		this.lineNumber = lineNumber;
	}

	public int getTemplateId() {
		return templateId;
	}

	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}

	public Date getCobDate() {
		return cobDate;
	}

	public void setCobDate(Date cobDate) {
		this.cobDate = cobDate;
	}

	public int getRunId() {
		return runId;
	}

	public void setRunId(int runId) {
		this.runId = runId;
	}

	public String getRecordType() {
		return recordType;
	}

	public void setRecordType(String recordType) {
		this.recordType = recordType;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getFundId() {
		return fundId;
	}

	public void setFundId(String fundId) {
		this.fundId = fundId;
	}

	public String getFundName() {
		return fundName;
	}

	public void setFundName(String fundName) {
		this.fundName = fundName;
	}

	public double getCsExposure() {
		return csExposure;
	}

	public void setCsExposure(double csExposure) {
		this.csExposure = csExposure;
	}

	public double getTotalFundAsset() {
		return totalFundAsset;
	}

	public void setTotalFundAsset(double totalFundAsset) {
		this.totalFundAsset = totalFundAsset;
	}

	public double getTotalFundEquity() {
		return totalFundEquity;
	}

	public void setTotalFundEquity(double totalFundEquity) {
		this.totalFundEquity = totalFundEquity;
	}

	public String getAssetClass() {
		return assetClass;
	}

	public void setAssetClass(String assetClass) {
		this.assetClass = assetClass;
	}

	public String getAssetSubClass() {
		return assetSubClass;
	}

	public void setAssetSubClass(String assetSubClass) {
		this.assetSubClass = assetSubClass;
	}

	public String getExposureCategory() {
		return exposureCategory;
	}

	public void setExposureCategory(String exposureCategory) {
		this.exposureCategory = exposureCategory;
	}

	public double getExposureAmount() {
		return exposureAmount;
	}

	public void setExposureAmount(double exposureAmount) {
		this.exposureAmount = exposureAmount;
	}

}
