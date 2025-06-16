package com.comunus.hungryForJob.employeer.Model;

import lombok.Data;

@Data
public class Menu {

	private String id;
	private String menuName;
	private String menuUrl;
	private String parentId;
	private int companyStatus;
	private int priority;
}
