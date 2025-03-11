package com.comunus.hungryForJob.employeer.Model;


import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class SearchReq {
	
	private String companyId;
	private String userId;
	private String skill;
	private String	minExp;
	private String maxExp;
	private String location;
	private String 	minSal;
	private String maxSal;
	private String company;
	private String noticePeriod;
	private String highestQualification;
	private String course;
	private String specialization;
	private String courseType;
	private String institute;
	private String gender;
	private String readyToLocate;
	private String activein;
	private String lastActive;
	
	private String searchId;
	private String searchName;
	private String searchCurrentLocation;
	private String searchMinExp;
	private String searchMaxExp;
	private String searchMinSal;
	private String searchMaxSal;
	private String searchPreferedLocation;
	private String searchCourse;
	private String searchUniversity;
	private String searchEndYearOfCourse;
	private String searchpreferLocation;
	private String searchKeySkills;
	private String searchMobileNumber;
	private String searchImage;
	private String searchSimilarProfiles;
	private String tickMark;
	private String viewCount;
	private String downloadCount;
	
	
	private String id;
	private String folderId;
	private String candidateId;
	private String folderName;
	
	private String comments;
	private List<Map<String, String>> detailsComment;
	private String requiredSkills;
}
