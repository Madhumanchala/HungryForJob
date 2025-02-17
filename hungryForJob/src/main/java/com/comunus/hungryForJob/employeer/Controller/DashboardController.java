package com.comunus.hungryForJob.employeer.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.ObjectMapperConfig;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.companyProfiledetails;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DashboardController {

	@Autowired
	private WebClientConfig myWebClient;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	
	@PostMapping("/companydashboard")
	public String companydashboard(HttpSession session,Model model,HttpServletRequest request)
	{
		WebClientResponse response = null;
		WebClientResponse response1 = null;
		log.info("In company profile page!!!!!");
		try {
			
			String userId=null;
			if (session.getAttribute("userId") != null) {
				userId = session.getAttribute("userId").toString();
			} else {
				log.info("Session expired or company id is not set");
			}
			companyProfiledetails companyprofiledetails = new  companyProfiledetails();
			companyprofiledetails.setUserId(userId);	
			String url = Configs.urls.get(EmployeerAppplicationConstant.COMPANY_PROFILE).getUrl();
			String Url1 = Configs.urls.get(EmployeerAppplicationConstant.FETCH_MENU).getUrl();
			response = myWebClient.post(url,companyprofiledetails).block();
			log.info("company profile url" + url);
			 if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			 response1 = myWebClient.post(Url1, null).block();
				if(response1.getToken()!=null) {
					  log.info("s.getToken() :"+response1.getToken());
					  request.getSession().setAttribute("token","Bearer "+response1.getToken());
		    	 }
			if(response.getStatusCode()== 200)
			{
				ServiceResponseWrapperModel<companyProfiledetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<companyProfiledetails>>() {
						});
				model.addAttribute("companydetails", responsemodel.getData());
				session.setAttribute("companyId", responsemodel.getData().getCompanyId());
				session.setAttribute("fullName", responsemodel.getData().getName());
				session.setAttribute("employerEmailId", responsemodel.getData().getEmailId());
				session.setAttribute("employerCompanyName", responsemodel.getData().getCompanyName());
				session.setAttribute("credit", responsemodel.getData().getCredits());
				log.info("data === "+responsemodel.getData());
			}else
			{
				log.info("Error in Response or service is not called");
			}
			
			if (response1.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response1.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("menuDetails", responsemodel.getData().getMenudetails());
					model.addAttribute("status", "1");
					log.info("menudetails==============" + responsemodel.getData().getMenudetails());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is ocurred"+e.getMessage());
			// TODO: handle exception
		}
		return "employerviews/companydashboard";
	}
	
	@GetMapping("mySubscriptoin")
	public String Subscription(HttpSession session,HttpServletRequest request)
	{
		return "employerviews/mySubscription";
	}
}
