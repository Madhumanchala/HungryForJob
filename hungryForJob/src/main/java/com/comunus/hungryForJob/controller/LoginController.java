package com.comunus.hungryForJob.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.APIErrorModel;
import com.comunus.hungryForJob.model.ForgotPasswordResponse;
import com.comunus.hungryForJob.model.LoginRequest;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJob.model.SignUp;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.model.ForgotPasswordResponse;
import com.comunus.hungryForJobs.model.LoginRequest;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJobs.model.SignUp;*/
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/*import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;*/
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class LoginController {
	
	@Autowired
	private WebClientConfig myWebClient;
	
	@Autowired
	private ObjectMapper myObjectMapper;
	
		
	@GetMapping("/login")
	public String loginGet(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response,HttpSession session) {

		try {
		     
			log.info("login ========= ");
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in login"+e.getMessage());
			// TODO: handle exception
		}
		
		 return "login";
		 
	}
	
	@PostMapping("/loginError")
	public String loginError(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String type=null;
		try {
			log.info("In LoginError Get : ");
			 log.info(request.getAttribute("loginErrorMessage"));
			 String roleType=session.getAttribute("roletype")!=null?session.getAttribute("roletype").toString():null;
			 log.info("roleType ==== "+roleType);
			 type=roleType;
			 modelMap.addAttribute("errorMsg",request.getAttribute("loginErrorMessage"));
			 request.removeAttribute("loginErrorMessage");
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in loginError"+e.getMessage());
			// TODO: handle exception
		}
		 if(type.equals("employer"))
		 {
			 return "employerviews/login";
		 }else
		 {
			 return "login";
		 }
	}
	
	@PostMapping("/logout")
	public String logount(HttpServletRequest request, HttpServletResponse response) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null){    
		        new SecurityContextLogoutHandler().logout(request, response, auth);
		    }
		} catch (Exception e) {
			e.printStackTrace();
		log.info("Exception in  logout"+e.getMessage());
			// TODO: handle exception
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/forgotPasswordVerifyEmail")
	public String getForgotPassword() {
		try {
			 log.info("In forgotPassVerifyEmail Get : ");
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in forgetPasswordVerifyEmail"+e.getMessage());
			// TODO: handle exception
		}
		
		 return "candidateForgotPassword";
	}
 	
	@PostMapping("/forgotPassVerifyEmail")
	@ResponseBody
	public APIErrorModel forgotPassword(ModelMap modelMap,@RequestBody SignUp signUp) throws JsonProcessingException {
		try {
			
			log.info("In forgotPassVerifyEmail Post : "+signUp.getEmailInput());
			 String forgotPassVerifyEmailUrl= Configs.urls.get(ApplicationConstant.FORGETPASSWORDVERIFY).getUrl();
			 log.info("@@@@ ForgotPassVerifyEmail @@@@"+forgotPassVerifyEmailUrl);
			 WebClientResponse response=myWebClient.post(forgotPassVerifyEmailUrl, signUp).block();
			 log.info(response);
			 String body=response.getBody();
			 JSONObject json=new JSONObject(body);
			 json.getJSONObject("data");
			 if(response.getStatusCode() == 200)
			 {
				 ServiceResponseWrapperModel<ForgotPasswordResponse> responsemodel= myObjectMapper.readValue(
		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ForgotPasswordResponse>>() {});
				 return responsemodel.getErrors();
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in forgotPassVerifyEmail"+e.getMessage());
			// TODO: handle exception
		}
		 return null;
	}
	
	
	@PostMapping("/forgetpasswordotp")
	public String otp()
	{
		return "verifyCandidateOtp";
	}
	
	@PostMapping("/forgotPassVerifyOtp")
	@ResponseBody
	public APIErrorModel otpVerification(ModelMap modelMap,@RequestBody SignUp signUp) throws JsonProcessingException {
		try {
			
			log.info("In otpVerification POST : ");
			 String forgotPassVerifyOtpUrl= Configs.urls.get("ForgotPassVerifyOtp").getUrl();
			 log.info("@@@@ ForgotPassVerifyOtp @@@@"+forgotPassVerifyOtpUrl);
			 WebClientResponse response=myWebClient.post(forgotPassVerifyOtpUrl, signUp).block();
			 log.info(response);
			 
			 if(response.getStatusCode() == 200)
			 {
				 ServiceResponseWrapperModel<ForgotPasswordResponse> responsemodel= myObjectMapper.readValue(
		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ForgotPasswordResponse>>() {});
				 return responsemodel.getErrors();
			 }
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
			log.info("==== forgotPassVerifyOtp ==== "+e.getMessage());
			// TODO: handle exception
		}
		return null; 
	}
	
	@PostMapping("/forgetnewpasswordchange")
	public String forgetnewpassword()
	{
		return "candidateNewPassword";
	}
	@PostMapping("/forgotPassChangePassword")
	@ResponseBody
	public APIErrorModel forgotPassChangePassword(ModelMap modelMap,@RequestBody LoginRequest loginRequest) throws JsonProcessingException {
		try {
			 log.info("In forgotPassChangePassword POST : ");
			 String forgotPassChangePassword= Configs.urls.get("ForgotPassChangePassword").getUrl();
			 log.info("@@@@ ForgotPassChangePassword @@@@"+forgotPassChangePassword);
			 WebClientResponse response=myWebClient.post(forgotPassChangePassword, loginRequest).block();
			 log.info(response);
			 if(response.getStatusCode() == 200)
			 {
				 ServiceResponseWrapperModel<ForgotPasswordResponse> responsemodel= myObjectMapper.readValue(
		    			 response.getBody(),new TypeReference<ServiceResponseWrapperModel<ForgotPasswordResponse>>() {});
				 return responsemodel.getErrors();
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in occured "+e.getMessage());
			// TODO: handle exception
		}
		
		return null;
	}

	
//	@GetMapping("/test")
//	public String test(HttpServletRequest httpServletRequest) {
//		WebClientResponse s;
//		try {
//			s = myWebClient.post("http://localhost:8081/test", "Siddhesh").block();
//			if(s.getToken()!=null) {
//			  log.info("s.getToken() :"+s.getToken());
//			  httpServletRequest.getSession().setAttribute("token","Bearer "+s.getToken());
//			}
//			log.info(s);
//			log.info(s.getStatusCode());
//			log.info(s.getBody());
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		 return "candidateDashboard";
//	}

}
