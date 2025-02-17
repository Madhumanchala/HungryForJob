package com.comunus.hungryForJob.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ForgotPasswordResponse {
	
	private String email;
	//
	private Boolean emailExist;
	private Boolean otpSent;
	private Boolean otpVerified;
	private Boolean otpExpired;
	//to match both password
	private Boolean passwordMatch;
	private Boolean passwordUpdated;
}
