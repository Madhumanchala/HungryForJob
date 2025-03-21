package com.comunus.hungryForJob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJob.model.SignUp;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.constant.ApplicationConstant;
import com.comunus.hungryForJobs.model.CareerDetails;
import com.comunus.hungryForJobs.model.ResponseModel;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJobs.model.SignUp;*/
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class IndexController {

	
	@Autowired
	private WebClientConfig myWebClient;
	
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@GetMapping("/")
	public String getIndex(Model model) {
		log.info("=====  getIndex    ======");
		WebClientResponse response=null;
		try {
		     String Url=Configs.urls.get(ApplicationConstant.INDEX).getUrl();
		     log.info("@@@@ searched job "+Url);
		     response = myWebClient.post(Url,null).block();
		     if(response.getStatusCode() == 200)
		     {
		    	 ServiceResponseWrapperModel<ResponseModel> responsemodel= objectMapper.readValue(
		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
		    	 if(responsemodel.getErrors().getErrorCode().equals("0000"))
		    	 {
//		    		 	log.info("message ======="+responsemodel.getData().getJobPostingDetails());
		    			model.addAttribute("jobDetails", responsemodel.getData().getJobPostingDetails());
		    			model.addAttribute("Location", responsemodel.getData().getCareerDetails().getAllCities());
		    	 }
		     }
		}catch (Exception e1) { 
			e1.printStackTrace();
			log.error("Exception in / : " + e1.getMessage());
		}
		return "index";
	}
	
	@PostMapping("/searchedJob")
	public String search(@ModelAttribute SignUp signup,Model model,HttpSession session) {
		log.info("=====  searched job   ======");
		
		WebClientResponse response=null;
		try {
		     String Url=Configs.urls.get(ApplicationConstant.SEARCH).getUrl();
		     log.info("@@@@ searched job "+Url);
		     response = myWebClient.post(Url,signup).block();
		     if(response.getStatusCode() == 200)
		     {
		    	 ServiceResponseWrapperModel<ResponseModel> responsemodel= objectMapper.readValue(
		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
		    	 if(responsemodel.getErrors().getErrorCode().equals("0000"))
		    	 {
		    		 	log.info("jobDetails========"+responsemodel.getData().getJobPostingDetails());
		    			model.addAttribute("jobDetails", responsemodel.getData().getJobPostingDetails());
		    	 }
		     }
		}catch (Exception e1) { 
			e1.printStackTrace();
			log.info("Exception in search"+e1.getMessage());
		}
		return "searchedJob";
	}
}
