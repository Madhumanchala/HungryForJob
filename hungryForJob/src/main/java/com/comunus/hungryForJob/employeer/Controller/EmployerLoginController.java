package com.comunus.hungryForJob.employeer.Controller;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.ObjectMapperConfig;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.PricingDetails;
import com.comunus.hungryForJob.employeer.Model.Signup;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJob.model.SignIn;
import com.comunus.hungryForJob.model.SignUp;
import com.comunus.hungryForJob.util.EncryptUtil;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.ObjectMapperConfig;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJobs.employeer.Model.PricingDetails;
import com.comunus.hungryForJobs.employeer.Model.Signup;
import com.comunus.hungryForJobs.model.APIErrorModel;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJobs.model.SignIn;
import com.comunus.hungryForJobs.util.EncryptUtil;*/
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/*import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;*/
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class EmployerLoginController {

	@Autowired
	WebClientConfig myWebClient;

	ObjectMapperConfig config;

	@Autowired
	private ObjectMapper objectMapper;

//	@Autowired(required=true)
//	private PasswordEncoder passwordEncoder;

	@Autowired
	private EncryptUtil encryptUtil;

//	@PostMapping("/employer/loginCheck")
//	@ResponseBody
//	public String loginCheck(@RequestBody SignIn signin, HttpSession session, Model model) {
//
//		log.info("Inside existedEmailChecking " + signin);
//		WebClientResponse response = null;
//
//		if ((signin.getEmail() != null || signin.getEmail().isEmpty())
//				&& (signin.getPassword() != null || signin.getPassword().isEmpty())) {
//			String EncryptPassword = encryptUtil.encryptRequest(signin.getPassword().getBytes());
//
//			signin.setPassword(EncryptPassword);
//
//			try {
//				String Url = Configs.urls.get(EmployeerAppplicationConstant.EMPLOYER_LOGIN_CHECK).getUrl();
//				log.info("@@@@ ExistedEmailChecking " + Url);
//
//				response = myWebClient.post(Url, signin).block();
//				if (response.getStatusCode() == 200) {
//					log.info("Response is " + response.getBody());
//
//					ServiceResponseWrapperModel<SignIn> value = objectMapper.readValue(response.getBody().toString(),
//							new TypeReference<ServiceResponseWrapperModel<SignIn>>() {
//							});
//					log.info(value);
//
//					if (value != null && value.getData() != null && !value.getData().toString().isEmpty()) {
//						session.setAttribute("fullName", value.getData().getName());
//						session.setAttribute("mobileNo", value.getData().getMobile_no());
//						session.setAttribute("companyName", value.getData().getCompany_name());
//						session.setAttribute("companyEmailId", value.getData().getEmail());
//						session.setAttribute("companyId", value.getData().getCompanyId());
//						session.setAttribute("userId", value.getData().getUserId());
//						session.setAttribute("credit", value.getData().getCredit());
//
//						if (value.getData().getStatus().equals("1")) {
//							if (value.getData().getPlanStatus().equals("1")) {
//								return "Login Success";
//							}
//
//							return "pricingplan";
//						} else if (value.getData().getStatus().equals("0")) {
//
//							return "pricingplan";
//						}
//					} else {
//						return "Login Failed";
//
//					}
//				}
//			} catch (Exception e1) {
//				e1.printStackTrace();
//				log.info("loginCheck ========" + e1.getMessage());
//			}
//		} else {
//			return "Login Failed";
//		}
//
//		return null;
//	}
	
//	@GetMapping("/pricing-plan")
	@RequestMapping(value = "/pricing-plan", method = {RequestMethod.POST, RequestMethod.GET})
	public String registerCompany(Model model, HttpServletRequest httpServletRequest)
			throws RestClientException, JsonProcessingException, URISyntaxException {
		
		model.addAttribute("pricingList", getAllPrice(httpServletRequest));
		
		return "employerviews/pricing-plan";
	}
	
	public List<PricingDetails> getAllPrice(HttpServletRequest request)
			throws RestClientException, URISyntaxException, JsonProcessingException {

		try {
			WebClientResponse response = myWebClient.post(Configs.urls.get("getAllPriceData").getUrl(), "").block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
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
	
	@PostMapping("/verifyDetails")
	public String verify(HttpSession session,Model model,HttpServletRequest httpServletRequest )
			throws RestClientException, URISyntaxException, JsonProcessingException {
		WebClientResponse response = null;
		try {
			String id1=httpServletRequest.getParameter("planId").toString();
			int id=Integer.parseInt(id1);
			SignUp signup = new SignUp();
			signup.setUserId(session.getAttribute("userId")!=null?session.getAttribute("userId").toString():null);
			signup.setCompanyId(session.getAttribute("companyId")!=null?session.getAttribute("companyId").toString():null);
//			signup.setId(id);
			log.info("Inside industrylist Method :::::::::::::"+id);
			String Url = Configs.urls.get(EmployeerAppplicationConstant.PLAN_DETAILS).getUrl();
			response = myWebClient.post(Url,signup).block();
			if(response.getToken()!=null) 
		     {
				  log.info("s.getToken() :"+response.getToken());
				  httpServletRequest.getSession().setAttribute("token","Bearer "+response.getToken()); 
			 }
			if(response.getStatusCode()==200)
			{
				ServiceResponseWrapperModel<SignIn> value = objectMapper.readValue(response.getBody().toString(),
						new TypeReference<ServiceResponseWrapperModel<SignIn>>() {
						});
				log.info(value);
				
				session.setAttribute("fullName", value.getData().getName());
				session.setAttribute("mobileNo", value.getData().getMobile_no());
				session.setAttribute("companyName", value.getData().getCompany_name());
				session.setAttribute("companyEmailId", value.getData().getEmail());
				session.setAttribute("companyId", value.getData().getCompanyId());
				session.setAttribute("credit", value.getData().getCredit());

				 List<PricingDetails> pricingList = getAllPrice(httpServletRequest);

				    PricingDetails selectedPlan = pricingList.stream()
				            .filter(price -> price.getId() == id)
				            .findFirst()
				            .orElse(null);

			    if (selectedPlan != null) {
			    	  String priceWithoutCommas = selectedPlan.getPrice().replace(",", "");
			            
			            // Convert the price from String to double
			            double price = Double.parseDouble(priceWithoutCommas);

		            // Assuming a 10% discount
//		            double discount = price * 0.1;
//		            double subTotal = price - discount;
		            double gst = price * 0.18; // Assuming 18% GST
		            double total = price + gst;

			        model.addAttribute("selectedPlan", selectedPlan);
//			        model.addAttribute("discount", discount);
//			        model.addAttribute("subTotal", subTotal);
			        model.addAttribute("gst", gst);
			        model.addAttribute("total", total);
			    }

			    model.addAttribute("fullName", session.getAttribute("fullName"));
			    model.addAttribute("mobileNo", session.getAttribute("mobileNo"));
			    model.addAttribute("companyName", session.getAttribute("companyName"));
			    model.addAttribute("companyEmailId", session.getAttribute("companyEmailId"));
			    
				model.addAttribute("pricingList", getAllPrice(httpServletRequest));
				model.addAttribute("idss",id);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in verifyDetails"+e.getMessage());
			// TODO: handle exception
		}
		
		
		return "employerviews/verify-details";
	}
	
	@ResponseBody
	@PostMapping("/expireOtp")
	public ServiceResponseWrapperModel<ResponseModel> ExpireOtp(@RequestBody SignUp signup,HttpServletRequest request)
	{
		log.info("Inside ExpireOtp " + signup);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.EXPIRE_OTP).getUrl();
			log.info("@@@@ ExpireOtp " + Url);

			 response= myWebClient.post(Url,signup).block();
			 if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken()); }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignIn> resp = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignIn>>() {
						});
				resp.getErrors().getErrorCode();
			}

			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
