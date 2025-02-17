package com.comunus.hungryForJob.model;

import org.springframework.web.multipart.MultipartResolver;

import lombok.Data;

@Data
public class SignUp {

	private int id;
	private String candidateId;
	private String candidateName;
	private String fullName;
	private String mobileNumber;
	private String emailInput;
	private String password;
	private String otpInput;
	private String createdDate;
	private String work_status;
	private String resumefileCV;
	private String resumeName;
	private String filetype;
	private String resumeheadline;
	private String gender;
	private String username;
	private String flag;
	private byte[] resumeFiles;
	private String dateofBirth;
	private String skills;
	private String exp;
	private String location;
	private String newCompany;
	private String email;
	private String userId;
}
