package com.comunus.hungryForJob.employeer.Model;

import java.util.List;

import com.comunus.hungryForJob.model.ResponseModel;

import lombok.Data;

@Data
public class SearchResp {
	
	private List<SearchReq> resultSearch;
	private ResponseModel responseModel;
	private List<SearchReq> folderDetails;

}
