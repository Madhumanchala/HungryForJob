package com.comunus.hungryForJob.model;

import java.util.List;

import com.comunus.hungryForJob.employeer.Model.FolderDetails;
import com.comunus.hungryForJob.employeer.Model.JobPosting;
import com.comunus.hungryForJob.employeer.Model.Menu;
import com.comunus.hungryForJob.employeer.Model.PricingDetails;

import lombok.Data;

@Data
public class ResponseModel {

	private List<EmploymentDetailsModel> employeelastWorkedCompany;
	private EducationDetails educationDetails;
	private List<Skills> skills;
	private CareerDetails careerDetails;
	private SignUp signup;
	private List<DropDown> viewPreferredLocation;
	private List<DropDown> highestQualification;
	private List<DropDown> Course;
	private List<DropDown> specialization;
	private List<DropDown> courseType;
	private List<DropDown> institute;
	private List<DropDown> gradingSystem;
	private List<OnlineJobApplied> jobApplied;
	private String qualificationId;
	private String courseId;
	private String specializationId;
	private String courseTypeId;
	private String instituteId;
	private String gradingSystemId;
	private  List<Dashboard> jobPostingDetails;
	private List<DropDown> 	jobPostingSkills;
	private List<DropDown> 	jobPostingLocation;
	private List<DropDown> 	jobPostingIndustry;
	private List<DropDown> 	jobPostingDepartment;
	private List<DropDown> 	jobPostingRole;
	private List<DropDown> 	jobPostingEducationQualification;
	private List<DropDown>  jobPostingSkillsFramework;
	private List<DropDown>  internPerksAndBenefits;
	
	private List<DropDown> masterCourse;
	private List<DropDown> degreeCourse;
	private List<DropDown> phdCourse;
	private List<DropDown> fetchCompany;
	
	private List<Menu> menudetails;
	
	private List<AdminModel> registerCompanyDetails;
	private AdminModel countOfCompanyDetails;
	
	private List<FolderDetails> folderDetails;
	private List<FolderDetails> folderCandidateDetais;
	private Dashboard userdetails;
	private List<Dashboard> manageUserDetails;
	private List<Dashboard> plandetails;
	private List<PricingDetails> pricingDetails;
	private List<Dashboard> jobdetails;
	private Dashboard countJobDetails;
	private List<JobPosting> listJobPostDetails;
	private JobPosting editJobpostingDetails;
	
	private JobPosting jobPostDetailsView;
	private List<JobPosting> jobTittleList;
	private List<JobPosting> masterCard;
	private List<JobPosting> candidateDetails;
	private List<JobPosting> interviewMode;
	private List<Dashboard> cardDetails;
	
	
	private List<JobPosting> cities;
	private List<JobPosting> masterStatus;
	private List<DropDown> jobPostStatus;
	
	private List<JobPosting> techName;
	private List<JobPosting> educName;
	
}
