package com.comunus.hungryForJob.model;

import java.util.HashMap;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class LoginResponse {
	private HashMap<String, Object> data;
	private String errors;
}
