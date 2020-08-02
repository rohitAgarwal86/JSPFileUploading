package loginBean;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import loginBO.FileUploadingBO;

public class FileUploadingBean {

	List<GetDate> Cob_date = null;

	public List<GetDate> getDates() {
		FileUploadingBO uploadBO = new FileUploadingBO();
		List<GetDate> cobDate = uploadBO.getDates();
		this.Cob_date = cobDate;
		return cobDate;
	}

	public void saveFund(String cob_date, String runID, String fileName, String fileLocation) throws ParseException {
		System.out.println("Uploading the file");
		String filePath = fileLocation + fileName;
		System.out.println(filePath);
		File newFile = new File(filePath);
		List<FundDetails> funds = new ArrayList<FundDetails>();
		int lineNumber = 1;
		int auditId = 0;
		int templateID = 0;

		try {

			Scanner newScanner = new Scanner(newFile);
			List<Integer> ids = new FileUploadingBO().getMaxIds();
			Iterator<Integer> id = ids.iterator();
			while (id.hasNext()) {
				auditId = id.next();
				templateID = id.next() + 1;
			}
			while (newScanner.hasNext()) {
				FundDetails fund = new FundDetails();
				String value[] = newScanner.nextLine().split("\t");
				if (value.length == 12) {
					fund.setAuditId(auditId);
					fund.setTemplateId(templateID);
					DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
					fund.setCobDate(df.parse(cob_date));

					fund.setRunId(Integer.parseInt(runID));
					fund.setLineNumber(lineNumber);

					fund.setRecordType(value[0]);
					fund.setFundId(value[1]);
					fund.setFundName(value[2]);
					fund.setDeptId(value[3]);
					fund.setDeptName(value[4]);
					if (value[5].isEmpty())
						fund.setCsExposure(0);
					else
						fund.setCsExposure(Double.parseDouble(value[5]));
					if (value[6].isEmpty())
						fund.setTotalFundAsset(0);
					else
						fund.setTotalFundAsset(Double.parseDouble(value[6]));
					if (value[7].isEmpty())
						fund.setTotalFundEquity(0);
					else
						fund.setTotalFundEquity(Double.parseDouble(value[7]));
					fund.setAssetClass(value[8]);
					fund.setAssetSubClass(value[9]);
					fund.setExposureCategory(value[10]);
					if (value[11].isEmpty())
						fund.setExposureAmount(0);
					else
						fund.setExposureAmount(Double.parseDouble(value[11]));

					lineNumber++;
				}
				funds.add(fund);
			}

			newScanner.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		FileUploadingBO uploadBO = new FileUploadingBO();
		uploadBO.saveFunds(funds);
	}

}
