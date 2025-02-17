package com.comunus.hungryForJob.employeer.Controller;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.ObjectMapperConfig;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.IndustryResponse;
import com.comunus.hungryForJob.employeer.Model.PricingDetails;
import com.comunus.hungryForJob.employeer.Model.Signup;
import com.comunus.hungryForJob.model.APIErrorModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
//import com.comunus.hungryForJobs.config.Configs;
//import com.comunus.hungryForJobs.config.ObjectMapperConfig;
//import com.comunus.hungryForJobs.config.WebClientConfig;
//import com.comunus.hungryForJobs.config.WebClientResponse;
//import com.comunus.hungryForJobs.constant.EmployeerAppplicationConstant;
//import com.comunus.hungryForJobs.employeer.Model.IndustryResponse;
//import com.comunus.hungryForJobs.employeer.Model.PricingDetails;
//import com.comunus.hungryForJobs.employeer.Model.Signup;
//import com.comunus.hungryForJobs.model.APIErrorModel;
//import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SignUpControllers {

	@Autowired
	private WebClientConfig myWebClient;
	
	@Autowired
	private ObjectMapperConfig config;

	@Autowired
	private ObjectMapper objectMapper;

	@GetMapping("/employerlogin")
	public String EmployerSingin(Model model, HttpServletRequest httpServletRequest,HttpSession session)
			throws RestClientException, JsonProcessingException, URISyntaxException {
		try {
			
			session.invalidate();
			log.info("In Singin Get : =======================");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			log.info("Exception is occurred"+e.getMessage());
		}
		
		return "employerviews/login";
	}
	
	@GetMapping("/employerSignUp")
	public String Singup(Model model, HttpServletRequest httpServletRequest)
			throws RestClientException, JsonProcessingException, URISyntaxException {
		try {
			
			log.info("In Singup Get : ");
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occurred"+e.getMessage());
			// TODO: handle exception
		}
		
		return "employerviews/sign-up-basic";
	}

	@PostMapping("/saveEmployer")
	@ResponseBody
	public APIErrorModel existedEmailChecking(@RequestBody Signup signup,HttpSession session,  Model model) {

		log.info("Inside existedEmailChecking " + signup);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.VERIFY_EMPLOYER_EMAIL).getUrl();
			log.info("@@@@ ExistedEmailChecking " + Url);
			response = myWebClient.post(Url, signup).block();
			if (response.getStatusCode() == 200) {
				
				log.info(":::KKLLKL"+signup.getFullName());
				  session.setAttribute("fullName", signup.getFullName());
		            session.setAttribute("mobileNo", signup.getMobileNo());
		            session.setAttribute("companyName", signup.getCompanyName());
		            session.setAttribute("companyEmailId", signup.getCompanyEmailId());
		            
				ServiceResponseWrapperModel<Signup> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<Signup>>() {
						});
				return responsemodel.getErrors();

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Existed Email ========" + e1.getMessage());
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/EmployerValidateOtp")
	public APIErrorModel ValidateOtp(@ModelAttribute Signup sign, Model model, HttpSession session) {
		log.info("====== ValidateOtp ===========" + sign);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.VERIFY_OTP).getUrl();
			log.info(" EmployerValidateOtp " + Url);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				session.setAttribute("username", sign.getCompanyEmailId());
				ServiceResponseWrapperModel<Signup> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<Signup>>() {
						});
				session.setAttribute("companyId", responsemodel.getData().getCompanyid());
				return responsemodel.getErrors();
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info(" EmployerValidateOtp  ========" + e1.getMessage());
		}
		return null;
	}

	@GetMapping("/companyDetails")
	public String registerCompany(Model model, HttpServletRequest httpServletRequest)
			throws RestClientException, JsonProcessingException, URISyntaxException {
		try {
			
			log.info("Inside registerCompany Method");
			model.addAttribute("industryList", getAllIndustry(httpServletRequest));
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occured"+e.getMessage());
			// TODO: handle exception
		}
		
		return "employerviews/sign-up-company";
	}

	@RequestMapping(value = "/SaveCompanydetails", method = {RequestMethod.POST, RequestMethod.GET})
	public String SaveCompanydetails(@ModelAttribute Signup sign, Model model, HttpSession session,HttpServletRequest httpServletRequest) {

		WebClientResponse response = null;
		try {

			Object companyIdObj = session.getAttribute("companyId");
			if (companyIdObj != null) {
				String companyId = companyIdObj.toString();
				log.info("Retrieved companyId from session: " + companyId);
				sign.setCompanyid(companyId);
			} else {
				log.info("companyId is not found in the session");
			}
			
			String Url = Configs.urls.get(EmployeerAppplicationConstant.COMPANY_DETAILS).getUrl();
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				session.setAttribute("username", sign.getCompanyEmailId());
				ServiceResponseWrapperModel<Signup> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<Signup>>() {
						});

			}
			model.addAttribute("pricingList", getAllPrice(httpServletRequest));

		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception is occurred"+e1.getMessage());
		}
		return "redirect:/employerlogin";
	}

	public List<IndustryResponse> getAllIndustry(HttpServletRequest httpServletRequest)
			throws RestClientException, URISyntaxException, JsonProcessingException {

		try {
			WebClientResponse response = myWebClient.post(Configs.urls.get("getAllIndustries").getUrl(), "").block();
			log.info(response.getStatusCode());
			log.info(response.getBody());
			ServiceResponseWrapperModel<List<IndustryResponse>> getAllIndustryDetailsModel = objectMapper.readValue(
					response.getBody().toString(),
					new TypeReference<ServiceResponseWrapperModel<List<IndustryResponse>>>() {
					});
			return getAllIndustryDetailsModel.getData();

		} catch (WebClientResponseException e) {
			log.info(e.getStatusCode());
			log.info(e.getMessage());
			log.info(e.getResponseBodyAsString());
		}
		return null;
	}

	public List<PricingDetails> getAllPrice(HttpServletRequest httpServletRequest)
			throws RestClientException, URISyntaxException, JsonProcessingException {

		try {
			WebClientResponse response = myWebClient.post(Configs.urls.get("getAllPriceData").getUrl(), "").block();
			log.info(response.getStatusCode());
			log.info(response.getBody());
			ServiceResponseWrapperModel<List<PricingDetails>> getAllPricedetailsModel = objectMapper.readValue(
					response.getBody().toString(),
					new TypeReference<ServiceResponseWrapperModel<List<PricingDetails>>>() {
					});

			return getAllPricedetailsModel.getData();
		} catch (WebClientResponseException e) {
			log.info(e.getStatusCode());
			log.info(e.getMessage());
			log.info(e.getResponseBodyAsString());
		}
		return null;
	}

	@GetMapping("/industrylist")
	public String industrylist(Model model, HttpServletRequest httpServletRequest)
			throws RestClientException, URISyntaxException, JsonProcessingException {
		try {
			log.info("Inside industrylist Method :::::::::::::");
			model.addAttribute("industryList", getAllIndustry(httpServletRequest));
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occurred "+e.getMessage());
			// TODO: handle exception
		}
		

		return "employerviews/industry-list";
	}

	@ResponseBody
	@PostMapping("/save-industry")
	public IndustryResponse saveProject(@RequestBody IndustryResponse industryResponse, Model model,
			HttpServletRequest httpServletRequest)
			throws RestClientException, URISyntaxException, JsonProcessingException {

		log.info("Inside Save project Method :::::::::::::");
		try {

			WebClientResponse response = myWebClient
					.post(Configs.urls.get(EmployeerAppplicationConstant.SAVE_INDUSTRY).getUrl(), industryResponse)
					.block();

			log.info(response.getStatusCode());
			log.info(response.getBody());
			ServiceResponseWrapperModel<IndustryResponse> managerDetailsModel = objectMapper.readValue(
					response.getBody().toString(), new TypeReference<ServiceResponseWrapperModel<IndustryResponse>>() {
					});
			return managerDetailsModel.getData();

		} catch (WebClientResponseException e) {
			log.info(e.getStatusCode());
			log.info(e.getMessage());
			log.info(e.getResponseBodyAsString());
		}
		return null;

	}


	
	

	
	
}