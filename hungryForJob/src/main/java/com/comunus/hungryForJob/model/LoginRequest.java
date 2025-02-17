package com.comunus.hungryForJob.model;


import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;


@Data
public class LoginRequest {

//	@NotBlank
	private String username;
//	@NotBlank
	private String password;
	
	private String confirmPassword;
	
	private String roleType;
	
}
