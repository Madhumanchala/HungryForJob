package com.comunus.hungryForJob.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
import com.comunus.hungryForJob.constant.AdminApplicationConstant;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.model.AdminModel;
import com.comunus.hungryForJob.model.Dashboard;
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

	@PostMapping("/updateplanpriority")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> getBusinessUsersDetails(Model model, HttpSession session,
			HttpServletRequest request, @RequestBody Dashboard dash) {
		log.info("===== Entering getBusinessUsersDetails =====");
		WebClientResponse response = null;
		try {

			String url = Configs.urls.get(AdminApplicationConstant.UpdatePlanPriority).getUrl();
			log.info("Requesting URL: {}", url);

			response = myWebClient.post(url, dash).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			log.info("Response status code: {}", response.getStatusCode());
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});

				return responseModel;
			}
		} catch (Exception e) {
			log.error("An unexpected error occurred: ", e);
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/updatePlanStatus")
	public ServiceResponseWrapperModel<ResponseModel> updatePlanStatus(@RequestBody AdminModel adminmodel,HttpServletRequest request) {
		log.info("====== updatePlanStatus ======");
		WebClientResponse response = null;
		try {

			String Url = Configs.urls.get(AdminApplicationConstant.UpdatePlanStatus).getUrl();
			log.info("======= updatePlanStatus ====== " + Url);

			response = myWebClient.post(Url, adminmodel).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }

			if (response.getStatusCode() == 200) {
				// Parse the response
				ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});

				return responseModel;
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception in updatePlanStatus: " + e.getMessage());
		}

		return null; // Return null in case of an error
	}

	@PostMapping("/registerplandetails")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> addregisterplandetails(Model model, HttpSession session,
			HttpServletRequest request, @RequestBody Dashboard dash) {
		log.info("===== Entering registerCompanyDetails =====");
		WebClientResponse response = null;

		try {

			String url = Configs.urls.get(AdminApplicationConstant.RegisterPlanDetails).getUrl();

			response = myWebClient.post(url, dash).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			log.info("Response status code: {}", response.getStatusCode());

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});

				return responseModel;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("An unexpected error occurred: ", e);
		}
		return null;
	}

	@PostMapping("/adminpricingplandetails")
	public String adminpricingplandetails(Model model, HttpSession session, HttpServletRequest request,
			AdminModel adminmodel) {
		log.info("===== Entering getVerificationPendingDetails =====");
		WebClientResponse response = null;

		try {

			String url = Configs.urls.get(AdminApplicationConstant.adminpricingplandetails).getUrl();
			log.info("Requesting URL: {}", url);

			response = myWebClient.post(url, adminmodel).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			log.info("Response status code: {}", response.getStatusCode());

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});

				if ("0000".equals(responseModel.getErrors().getErrorCode())) {
					log.info("Fetched Verification Pending Details successfully");
					model.addAttribute("plandetails", responseModel.getData().getPlandetails());
					model.addAttribute("plansize", responseModel.getData().getPlandetails().size());
					List<Integer> priorities = responseModel.getData().getPlandetails().stream()
							.map(plandetail -> Integer.parseInt(plandetail.getPlanPriority()))
							.filter(priority -> priority != null) // Exclude 0 and null
							.collect(Collectors.toList());
					model.addAttribute("planpriority", priorities);
					log.info(" prority === " + priorities);

				} else {
					log.warn("Error in response: {}", responseModel.getErrors());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("An unexpected error occurred: ", e);
		}
		return "adminpricingplandetails";
	}

	@PostMapping("/admindashboard")
	public String getIndex(Model model, HttpServletRequest request) {
		log.info("=====  getAdminIndex    ======");
		WebClientResponse response = null;
		AdminModel admin = new AdminModel();
		try {
			String Url = Configs.urls.get(AdminApplicationConstant.admindashboard).getUrl();
			String statusvalue = Optional.ofNullable(request.getParameter("statusvalue")).orElse("");
			log.info("@@@@ searched job " + Url);
			admin.setAdminstatus(statusvalue);
			response = myWebClient.post(Url, admin).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {

					model.addAttribute("companydetails", responsemodel.getData().getRegisterCompanyDetails());
					model.addAttribute("countOfCompanyDetails", responsemodel.getData().getCountOfCompanyDetails());
					model.addAttribute("statusvalue", statusvalue);
					model.addAttribute("plandetails", responsemodel.getData().getPlandetails());
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in adminIndex" + e1.getMessage());
		}

		return "admindashboard";
	}
	
	@PostMapping("/updateadminplandetails")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> updateadminplandetails(Model model, HttpSession session,
			HttpServletRequest request, @RequestBody Dashboard dash) {
		log.info("===== Entering updateadminplandetails =====");
		WebClientResponse response = null;
		try {

			String url = Configs.urls.get(AdminApplicationConstant.UpdatePlanDetails).getUrl();

			response = myWebClient.post(url, dash).block();
			log.info("Response status code: {}", response.getStatusCode());
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responseModel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				return responseModel;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("An unexpected error occurred: ", e);
		}
		return null;
	}
	
	@GetMapping("/adminlogin")
	public String adminlogin()
	{
		return "adminlogin";
	}
	
	@PostMapping("/adminchangepassword")
	public String adminChangePassword()
	{
		return "adminchangepassword";
	}
	
	@PostMapping("/adminnewpassword")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> newpassworadded(@RequestBody Dashboard dashboard,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("operationId")!=null)
			{
				dashboard.setUserId(session.getAttribute("operationId").toString());
			}else
			{
				log.info("session is not set in userId");
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.NEW_PASSWORD).getUrl();
			response=myWebClient.post(url,dashboard).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = new ObjectMapper().readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				return responsemodel;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occured === "+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

}
