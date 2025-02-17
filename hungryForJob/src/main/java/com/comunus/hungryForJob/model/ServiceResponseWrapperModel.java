package com.comunus.hungryForJob.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ServiceResponseWrapperModel<T> {

	@JsonProperty("data")
	private T data;

	@JsonProperty("errors")
	private APIErrorModel errors;

	public ServiceResponseWrapperModel(T data) {
		this.data = data;
	}

	public ServiceResponseWrapperModel(APIErrorModel error) {
		this.errors = error;
	}

	public ServiceResponseWrapperModel(T data, APIErrorModel errors) {
		super();
		this.data = data;
		this.errors = errors;
	}

	
	
}
