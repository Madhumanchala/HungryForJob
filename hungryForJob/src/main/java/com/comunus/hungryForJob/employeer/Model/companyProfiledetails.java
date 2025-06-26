package com.comunus.hungryForJob.employeer.Model;

import java.util.List;

import com.comunus.hungryForJob.model.DropDown;

import lombok.Data;

@Data
public class companyProfiledetails {

	private String name;
	private String emailId;
	private String role;
	private String ReportingManager;
	private String mobileNumber;
	private String industryType;
	private String contactPerson;
	private String websiteUrl;
	private String phonenumber;
	private String panNumber;
	private String address;
	private String state;
	private String city;
	private String pincode;
	private String gstnumber;
	private String userId;
	private String companyName;
	private String companyId;
	private String credits;
	private List<DropDown> industryMaster;

	private String id;
	private String status;
	private String flag;
	private String isVisible;
}
