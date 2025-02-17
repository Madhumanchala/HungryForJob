package com.comunus.hungryForJob.employeer.Model;

import java.util.List;

import lombok.Data;

@Data
public class JobPosting {


	private String id;
	private String companyId;
	private String userId;
	private String candidateId;
	private String jobType;
	private String jobTittle;
	private String employmentType;
	private String workMode;
	private List<String> keySkills;
	private String minExp;
	private String maxExp;
	private String salaryType;
	private String salaryFigureMin;
	private String salaryFigureMax;
	private int hideSalaryDetails;
	private List<String> jobLocation;
	private String companyIndustry;
	private List<String> candidateIndustry;
	private String departmentId;
	private String roleName;
	private String reference;
	private String noOfVacancy;	
	private List<String> educationQualification;
	private String jobDescription;
	private int walkInDrive;
	
	private String startDate;
	private String endDate;
	private String time;
	private String contactPerson;
	private String contactNumber;
	private String venue;
	private String googleMapUrl;
	
	private String companyName;
	private String aboutCompany;
	private String companyAddress;
	private String telephoneNumber;
	private String emailId;
	
	private String internjobType;
	private String internJobTittle;
	private String internEmploymentType;
	private String internWorkMode;
	private String internDescription;
	private List<String> internPerksAndBenefits;
	private List<String> internEducationQualification;
	private List<String> internKeySkills;
	private List<String> internLocation;
	private String internDuration;
	private String internStart;
	private String internStartDateApply;
	private String internWillStartWithin;
	private String internLastDateApply;
	private String internStipendConfirm;
	private String internStipendMoney;
	private String internIndustry;
	private String internDepartment;
	private String internRole;
	private String internReferenceCode;
	private String internVacancy;
	private String internCompanyName;
	private String internAboutCompany;
	private String internCompanyAddress;
	private String internTelephone;
	private String internEmailId;
	private String internReadyToReLocate;
	private String type;
	
	
}
