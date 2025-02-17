package com.comunus.hungryForJob.employeer.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.FolderDetails;
import com.comunus.hungryForJob.employeer.Model.SearchReq;
import com.comunus.hungryForJob.employeer.Model.SearchResp;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class FolderController {

	@Autowired
	WebClientConfig myWebClient;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	
	@PostMapping("/managefolders")
	public String managefolders(HttpSession session,Model model,HttpServletRequest request)
	{
		FolderDetails folderdetails = new FolderDetails();
		log.info("======= managefolder called frontend controller ==");
		try {
			String companyId=session.getAttribute("companyId")!=null?session.getAttribute("companyId").toString():"";
			String userId=session.getAttribute("userId")!=null?session.getAttribute("userId").toString():"";
			String days = (request.getParameter("days") != null) ? request.getParameter("days").toString() : null;

			if(companyId != null)
			{
				folderdetails.setCompanyId(companyId);
			}else
			{
				log.info("companyId is not set in session");
			}
			if(userId != null)
			{
				folderdetails.setUserId(userId);
			}else
			{
				log.info("userId is not set in session");
			}
			if(days!=null)
			{
				folderdetails.setFilterDays(days);
			}else
			{
				log.info("days is not set ");
			}
			WebClientResponse response=null;
			String url=Configs.urls.get(EmployeerAppplicationConstant.folderCandidatesDetails).getUrl();
			log.info("managefolder Details called ==="+url);
			response=myWebClient.post(url, folderdetails).block();
			if(response.getToken()!=null) 
		     {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken()); 
			 }
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),new TypeReference< ServiceResponseWrapperModel<ResponseModel>>(){});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("folderdetails", responsemodel.getData().getFolderDetails());
					model.addAttribute("foldesize", responsemodel.getData().getFolderDetails().size());
					log.info("folder details ==="+responsemodel.getData().getFolderDetails());
				}else
				{
					log.info("Service error is occured status code is ==="+responsemodel.getErrors().getErrorCode());
				}
				
			}else
			{
				log.info("Error Ocuured in Service === ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Error in manageFolder === "+e.getMessage());
			// TODO: handle exception
		}
		
		return "employerviews/managefolders";
	}
	
	@PostMapping("/candidatefolderdetails")
	public String candidateFolderDetails(@ModelAttribute FolderDetails folderdetails,Model model,HttpSession session,HttpServletRequest request)
	{
		try {
			String companyId=session.getAttribute("companyId")!=null?session.getAttribute("companyId").toString():"";
			folderdetails.setCompanyId(companyId);
			WebClientResponse response=null;
			String url=Configs.urls.get(EmployeerAppplicationConstant.GetfolderCandidateDetails).getUrl();
			log.info("candidatefolderdetails data =====");
			response=myWebClient.post(url,folderdetails).block();
			if(response.getToken()!=null) 
		     {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken()); 
			 }
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),new TypeReference< ServiceResponseWrapperModel<ResponseModel>>(){});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("resultData", responsemodel.getData().getFolderCandidateDetais());
					log.info("Folder details ===="+responsemodel.getData().getFolderCandidateDetais());
				}else
				{
					log.info("Service error is occured status code is ==="+responsemodel.getErrors().getErrorCode());
				}
				
			}else
			{
				log.info("Error Ocuured in Service === ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occured candidatefolderdetails"+e.getMessage());
			// TODO: handle exception
		}
		return "employerviews/candidatefolderdetails";
	}
	@PostMapping("/DeleteFolder")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> deletefolder(@RequestBody SearchReq searchreq,HttpServletRequest request) {
		log.info(" DeleteFolder ========== " + searchreq);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.Delete_Folder).getUrl();
			response = myWebClient.post(Url, searchreq).block();
			if(response.getToken()!=null) 
		     {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken()); 
			 }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SearchResp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SearchResp>>() {
						});
				return responsemodel;
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exeception is occurred in createFolder"+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}
}
