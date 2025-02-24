package com.comunus.hungryForJob.employeer.Controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.companyProfiledetails;
import com.comunus.hungryForJob.model.Dashboard;
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
				log.info("Session expired or userId  is not set");
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
				model.addAttribute("industryDetails", responsemodel.getData().getIndustryMaster());
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
	
	@PostMapping("mysubscription")
	public String Subscription(HttpSession session,HttpServletRequest request,Dashboard dashboard,Model model)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				dashboard.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in userid");
			}
			if(session.getAttribute("companyId")!=null)
			{
				dashboard.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("session is not set in companyId");
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.MY_SUBSCRIPTION).getUrl();
			response=myWebClient.post(url,dashboard).block();
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("plandetails", responsemodel.getData().getPlandetails());
					model.addAttribute("statustype", dashboard.getType());
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is occured ==== "+e.getMessage());
		}
		return "employerviews/mySubscription";
	}
	
	@PostMapping("editCompanyDashboard")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> updateCompanyDashboard(HttpSession session,HttpServletRequest request,@RequestBody Dashboard dashboard)
	{
		WebClientResponse response=null;
		try {
			
			String userId=null;
			if(session.getAttribute("userId")!=null)
			{
				userId = session.getAttribute("userId").toString();
				dashboard.setUserId(userId);
			}else
			{
				log.info("userId is not set");
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.UPDATE_COMPANY_DETAILS).getUrl();
			response=myWebClient.post(url, dashboard).block();
			if(response.getToken()!=null)
			{
				 log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>(){});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					return responsemodel;
					
				}else
				{
					log.info("Exception is occured in service");
					return responsemodel;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occured ===== "+e.getMessage());
			// TODO: handle exception
		}
		
		return null;
	}
	
	@PostMapping("manageuser")
	public String manageusers(HttpSession session,HttpServletRequest request,Model model)
	{
		WebClientResponse response=null;
		Dashboard dash = new Dashboard();
		try {
			if(session.getAttribute("userId")!=null)
			{
				dash.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("userid is not found from session");
			}
			if(session.getAttribute("companyId")!=null)
			{
				dash.setCompanyId(session.getAttribute("companyId").toString());
			}
			String url= Configs.urls.get(EmployeerAppplicationConstant.MANAGE_USERS).getUrl();
			response=myWebClient.post(url, dash).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel =objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("userdetails", responsemodel.getData().getManageUserDetails());
					model.addAttribute("admindetails",responsemodel.getData().getUserdetails());
					model.addAttribute("size", responsemodel.getData().getManageUserDetails().size());
					log.info("sizof it == "+responsemodel.getData().getManageUserDetails().size()+"user access === "+responsemodel.getData().getUserdetails().getUserAccess());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exceotion is occured == "+e.getMessage());
			// TODO: handle exception
		}
		return "employerviews/manageusers";
	}
	
	@PostMapping("createuser")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> createusers(@RequestBody Dashboard dashboard,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			String userid=null;
			String companyid=null;
			if(session.getAttribute("userId")!=null)
			{
				userid = session.getAttribute("userId").toString();
				dashboard.setUserId(userid);
			}
			String companyId=null;
			if(session.getAttribute("companyId")!=null)
			{
				companyid=session.getAttribute("companyId").toString();
				dashboard.setCompanyId(companyid);
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.CREATE_USERS).getUrl();
			response=myWebClient.post(url, dashboard).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>(){});
				
				return responsemodel;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is ocuured ==== "+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}
	
	@PostMapping("/resetpassword")
	public String newpassword()
	{
		return "employerviews/newuserpassword";
	}
	
	@PostMapping("/newpassword")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> newpassworadded(@RequestBody Dashboard dashboard,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				dashboard.setUserId(session.getAttribute("userId").toString());
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
	
	@PostMapping("/updategstnumber")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> updategstnumber(@RequestBody Dashboard dashboard,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				dashboard.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in userid");

			}
			if(session.getAttribute("companyId")!=null)
			{
				dashboard.setCompanyId(session.getAttribute("companyId").toString());
				
			}else
			{
				log.info("session is not set in companyid");
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.UPDATE_GSTNUMBER).getUrl();
			response=myWebClient.post(url, dashboard).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				
				return responsemodel;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is ocuured ===== "+e.getMessage());
		}
		return null;
	}
	
	@PostMapping("/renewalplan")
	public String renewalplan(HttpSession session,Model model,HttpServletRequest request)
	{
		WebClientResponse response=null;
		Dashboard dashboard = new Dashboard();
		String planid=request.getParameter("planId").toString();
		try {
			if(session.getAttribute("userId")!=null)
			{
				dashboard.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("user is not set in session");
			}
			if(session.getAttribute("companyId")!=null)
			{
				dashboard.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("companyId is not set in session");
			}
			dashboard.setId(planid);
			String url=Configs.urls.get(EmployeerAppplicationConstant.Renewal_PLANDETAILS).getUrl();
			response=myWebClient.post(url, dashboard).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("renewalplandetails", responsemodel.getData().getUserdetails());
					double gstRate = 18.0;
					double amount = Double.parseDouble(responsemodel.getData().getUserdetails().getPlanPrice().replace(",", ""));
					double gstAmount = (amount * gstRate) / 100;
				    double totalAmount = amount + gstAmount;
				    model.addAttribute("totalamount", totalAmount);
				    model.addAttribute("gstamount", gstAmount);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is occurred === "+e.getMessage());
		}
		return "employerviews/renewalplan";
	}
	
	@PostMapping("/updateplandetails")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> updateplandetails(@RequestBody Dashboard dashboard,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				dashboard.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("user is not set in session");
			}
			if(session.getAttribute("companyId")!=null)
			{
				dashboard.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("companyId is not set in session");
			}
			String url=Configs.urls.get(EmployeerAppplicationConstant.UPDATE_PLANDETAILS).getUrl();
			response=myWebClient.post(url, dashboard).block();
			if(response.getToken() != null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken());
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {});
				return responsemodel;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is occured ==== "+e.getMessage());
		}
		return null;
	}
}
