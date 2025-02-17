package com.comunus.hungryForJob.security;

import java.util.Set;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {
	
	private long id;
	
	private String username;

	private String email;

	private String password;

    private Set<Role> roles;

}
