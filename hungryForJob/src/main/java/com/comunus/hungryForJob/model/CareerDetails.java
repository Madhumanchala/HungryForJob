package com.comunus.hungryForJob.model;

import java.util.List;
import java.util.Map;


import lombok.Data;

@Data
public class CareerDetails {

	public String candidateId;
	public String currentCtc;
	public String expectedCtc;
	public String currentLocation;
	public String workFromHome;
	public String readyToRelocate;
	public List<String> preferredLocation;
	public List<String> candidateSkills;
	public String qualification;
	public String serviceNoticePeriod;
	public String noticePeriod;
	public String lastWorkingDate;
	public String offerInHand;
	public String offeredCtc;
	public String joiningDate;
	public String totalExperience;
	public Map<String, Map<String, String>> keySkills;
	public List<DropDown> skills;
	public List<DropDown> location;
	public String userName; 
	public Map<String,Map<String,String>> jobExperience;
	public List<DropDown> highestQualification;
	public List<DropDown> course;
	public List<DropDown> specialization;
	public List<DropDown> courseType;
	public List<DropDown> institute;
	public int id;
	public int flag;
	public List<DropDown> gradingSystem;
	public Map<String,String> educationDetails;
	public List<Skills> candiateSkills;
	public String designation;
	public List<Dashboard> jobPostingDetails;
	public Dashboard singlejobPostViewDetails;
	public List<DropDown> fetchCities;
	public String state;
	public List<DropDown> allCities;
	public String city;
	public String resumeheadline;
	public String type;
	public String pincode;
	public String candidateEmail;
	public String base64ProfileImage;
	public String dob;
	
	
	public String jobTitleSearch;
	public String experienceSearch;
	public String locationSearch;
	
	public String totalpoints;
	public List<DropDown> masterCompany;
	public String viewdetailflag;
	public String cvDetails;
	public String candidateViews;
	public String candidateDownload;
	public String lastActive;
	public String paginationOffSet;
	public String paginationTotalPages;
	public String cvUploadedDate;
	
	public String fullName;
	public String contactNumber;
	public String passingYear;
	public String gender;
	public String companyId;
	private String currentOrganization;
}
