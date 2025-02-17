package com.comunus.hungryForJob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.AdminModel;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
//import com.comunus.hungryForJobs.config.Configs;
//import com.comunus.hungryForJobs.config.WebClientConfig;
//import com.comunus.hungryForJobs.config.WebClientResponse;
//import com.comunus.hungryForJobs.constant.ApplicationConstant;
//import com.comunus.hungryForJobs.constant.EmployeerAppplicationConstant;
//import com.comunus.hungryForJobs.employeer.Model.JobPlan;
//import com.comunus.hungryForJobs.model.APIErrorModel;
//import com.comunus.hungryForJobs.model.AdminModel;
//import com.comunus.hungryForJobs.model.CareerDetails;
//import com.comunus.hungryForJobs.model.ResponseModel;
//import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AdminController {
    @Autowired
    private WebClientConfig myWebClient;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/businessUsersDetails")
    public String getBusinessUsersDetails(Model model, HttpSession session, HttpServletRequest request) {
        log.info("===== Entering getBusinessUsersDetails =====");
        WebClientResponse response = null;

        try {
            String username = null;
            if (session.getAttribute("candidateId") != null) {
                username = session.getAttribute("candidateId").toString();
                log.info("Session candidateId: {}", username);
            } else {
                log.warn("Session expired or candidateId is not set.");
            }

            if (username != null && !username.matches("\\d+")) {
                throw new IllegalArgumentException("Invalid candidateId: " + username);
            }

            String url = Configs.urls.get(ApplicationConstant.getBusinessUsersDetails).getUrl();
            log.info("Requesting URL: {}", url);

            response = myWebClient.post(url, username).block();
            log.info("Response status code: {}", response.getStatusCode());

            if (response.getToken() != null) {
                request.getSession().setAttribute("token", "Bearer " + response.getToken());
            }

            if (response.getStatusCode() == 200) {
                ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(
                        response.getBody(),
                        new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});

                if ("0000".equals(responseModel.getErrors().getErrorCode())) {
                    log.info("Fetched business user details successfully");
//                    model.addAttribute("CompanyDetails", responseModel.getData().getFetchBusinessUsersDetails());
                    model.addAttribute("CompanyDetails", responseModel.getData().getFetchBusinessUsersDetails());

                } else {
                    log.warn("Error in response: {}", responseModel.getErrors());
                }
            }
        } catch (Exception e) {
            log.error("An unexpected error occurred: ", e);
        }
        return "businessUsers";
    }
    
    @ResponseBody
    @PostMapping("/updatePlanStatus")
    public ServiceResponseWrapperModel<ResponseModel> updatePlanStatus(
            @RequestParam("gst_no") String gst_no, 
            @RequestParam("currentStatus") int currentStatus, 
            HttpServletRequest request, 
            HttpSession session) {
        
        String status = String.valueOf(currentStatus); // Convert currentStatus to string
        
        AdminModel companyplanDetails = new AdminModel();
        companyplanDetails.setGst_no(gst_no);
        companyplanDetails.setStatus(status); // Set the new status (0 or 1)
        
        log.info("====== updatePlanStatus ======");

        WebClientResponse response = null;

        try {
            String username = null;
            if (session.getAttribute("candidateId") != null) {
                username = session.getAttribute("candidateId").toString();
            } else {
                log.info("Session expired or candidateId is not set.");
            }
            
            // Prepare the URL for the service
            String Url = Configs.urls.get(ApplicationConstant.UpdatePlanStatus).getUrl();
            log.info("======= updatePlanStatus ====== " + Url);
            
            // Send the request
            response = myWebClient.post(Url, companyplanDetails).block();

            // Handle the response token (if any)
            if (response.getToken() != null) {
                log.info("s.getToken(): " + response.getToken());
                request.getSession().setAttribute("token", "Bearer " + response.getToken());
            }

            // Check if the response is successful
            if (response.getStatusCode() == 200) {
                // Parse the response
                ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(
                        response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});

                // Check if there was an error in the response
                if ("0000".equals(responseModel.getErrors().getErrorCode())) {
                    return responseModel; // Success case
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("Exception in updatePlanStatus: " + e.getMessage());
        }

        return null; // Return null in case of an error
    }
    
    @GetMapping("/registerCompanyDetails")
    public String getRegisterCompanyDetails(Model model, HttpSession session, HttpServletRequest request) {
        log.info("===== Entering registerCompanyDetails =====");
        WebClientResponse response = null;

        try {
            String username = null;
            if (session.getAttribute("candidateId") != null) {
                username = session.getAttribute("candidateId").toString();
                log.info("Session candidateId: {}", username);
            } else {
                log.warn("Session expired or candidateId is not set.");
            }

            if (username != null && !username.matches("\\d+")) {
                throw new IllegalArgumentException("Invalid candidateId: " + username);
            }

            String url = Configs.urls.get(ApplicationConstant.getRegisterCompanyDetails).getUrl();
            log.info("Requesting URL: {}", url);

            response = myWebClient.post(url, username).block();
            log.info("Response status code: {}", response.getStatusCode());

            if (response.getToken() != null) {
                request.getSession().setAttribute("token", "Bearer " + response.getToken());
            }

            if (response.getStatusCode() == 200) {
                ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(
                        response.getBody(),
                        new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});

                if ("0000".equals(responseModel.getErrors().getErrorCode())) {
                    log.info("Fetched Register Company Details successfully");
//                    model.addAttribute("CompanyDetails", responseModel.getData().getFetchBusinessUsersDetails());
                    model.addAttribute("registerCompanyDetails", responseModel.getData().getRegisterCompanyDetails());

                } else {
                    log.warn("Error in response: {}", responseModel.getErrors());
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
            log.error("An unexpected error occurred: ", e);
        }
        return "registerCompanyDetails";
    }
    
    @GetMapping("/verificationPendingDetails")
    public String getVerificationPendingDetails(Model model, HttpSession session, HttpServletRequest request) {
        log.info("===== Entering getVerificationPendingDetails =====");
        WebClientResponse response = null;

        try {
            String username = null;
            if (session.getAttribute("candidateId") != null) {
                username = session.getAttribute("candidateId").toString();
                log.info("Session candidateId: {}", username);
            } else {
                log.warn("Session expired or candidateId is not set.");
            }

            if (username != null && !username.matches("\\d+")) {
                throw new IllegalArgumentException("Invalid candidateId: " + username);
            }

            String url = Configs.urls.get(ApplicationConstant.getVerificationPendingDetails).getUrl();
            log.info("Requesting URL: {}", url);

            response = myWebClient.post(url, username).block();
            log.info("Response status code: {}", response.getStatusCode());

            if (response.getToken() != null) {
                request.getSession().setAttribute("token", "Bearer " + response.getToken());
            }

            if (response.getStatusCode() == 200) {
                ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(
                        response.getBody(),
                        new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});

                if ("0000".equals(responseModel.getErrors().getErrorCode())) {
                    log.info("Fetched Verification Pending Details successfully");
//                    model.addAttribute("CompanyDetails", responseModel.getData().getFetchBusinessUsersDetails());
                    model.addAttribute("PendingDetails", responseModel.getData().getVerificationPendingDetails());

                } else {
                    log.warn("Error in response: {}", responseModel.getErrors());
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
            log.error("An unexpected error occurred: ", e);
        }
        return "verificationPendingDetails";
    }
    

	@GetMapping("/adminIndex")
	public String getIndex(Model model) {
		log.info("=====  getAdminIndex    ======");
		WebClientResponse response=null;
		try {
		     String Url=Configs.urls.get(ApplicationConstant.AdminIndex).getUrl();
		     log.info("@@@@ searched job "+Url);
		     response = myWebClient.post(Url,null).block();
//		     if(response.getStatusCode() == 200)
//		     {
//		    	 ServiceResponseWrapperModel<ResponseModel> responsemodel= objectMapper.readValue(
//		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
//		    	 if(responsemodel.getErrors().getErrorCode().equals("0000"))
//		    	 {
//		    			model.addAttribute("jobDetails", responsemodel.getData().getJobPostingDetails());
//		    	 }
//		     }
		}catch (Exception e1) { 
			e1.printStackTrace();
			log.info("Exception in adminIndex"+e1.getMessage());
		}
		    	 
		return "adminIndex";
	}
	
}
