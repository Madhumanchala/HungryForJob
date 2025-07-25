package com.comunus.hungryForJob.employeer.Model;

import java.util.List;

import com.comunus.hungryForJob.model.DropDown;

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
	private String internStartType;
	private String type;

	private String jobloc;
	private String status;
	private String candidateApplied;
	private String candidateInterview;
	private String createdBy;
	private String jobPostkeySkills;
	private String jobPostEducation;

	private String name;

	private String jobId;
	private String candidateStatus;
	private String candidateName;
	private String candidateEmail;
	private String candidateTotalExp;
	private String candidateCurrentCtc;
	private String candidateExpectedCtc;
	private String candidateAppliedDate;
	private String candidateProfileImage;
	private String countOfapplied;
	private String countofscreening;
	private String countofscheduleinterview;
	private String countofstatus;

	private byte[] pdfBytes;
	private String filename;
	private String fileType;

	private String interviewDate;
	private String interviewTime;
	private String interviewmode;
	private String interviewLink;
	private List<String> interViewerEmail;
	private String statusBar;

	private String countApplied;
	private String countScreening;
	private String countScheduledInterview;
	private String countStatus;

	private String hiringStatus;
	private String review;
	private String isVisible;
	private String flag;
	private List<String> perksAndBenefits;
	
	private String operatedBy;
	private String operatedById;
	private  String paginationOffSet;
	private String searchValue;
	private String categoryType;
}
