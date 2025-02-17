package com.comunus.hungryForJob.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MasterUrl implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private long id;

	private String name;

	private String url;

	private String timeOut;
}
