package com.comunus.hungryForJob.model;

import lombok.Data;

@Data
public class EmploymentDetailsModel {
	
	public String id;
	public String companyName;
	public String jobTittle;
	public String startYear;
	public String startMonth;
	public String endYear;
	public String endMonth;
	public String workingStatus;

}
