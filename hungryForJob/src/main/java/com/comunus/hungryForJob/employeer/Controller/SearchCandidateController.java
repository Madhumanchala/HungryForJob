package com.comunus.hungryForJob.employeer.Controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.DeductionPoints;
import com.comunus.hungryForJob.employeer.Model.JobPosting;
import com.comunus.hungryForJob.employeer.Model.SearchReq;
import com.comunus.hungryForJob.employeer.Model.SearchRequest;
import com.comunus.hungryForJob.employeer.Model.SearchResp;
import com.comunus.hungryForJob.employeer.Model.managesearchmodel;
import com.comunus.hungryForJob.model.CareerDetails;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.constant.ApplicationConstant;
import com.comunus.hungryForJobs.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJobs.employeer.Model.DeductionPoints;
import com.comunus.hungryForJobs.employeer.Model.JobPosting;
import com.comunus.hungryForJobs.employeer.Model.SearchResp;
import com.comunus.hungryForJobs.employeer.Model.SearchReq;
import com.comunus.hungryForJobs.employeer.Model.SearchRequest;
import com.comunus.hungryForJobs.model.CareerDetails;
import com.comunus.hungryForJobs.model.ResponseModel;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;*/
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/*import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;*/
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class SearchCandidateController {

	@Autowired
	WebClientConfig myWebClient;

	@Autowired
	private ObjectMapper objectMapper;

	@PostMapping("/searchCandidates")
	public String searchCandidates(Model model, HttpSession session,HttpServletRequest request) {

		log.info("Inside searchCandidates ");
		WebClientResponse response = null;
		WebClientResponse response1 = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.SEARCH_CANDIDATES).getUrl();
			String Url1 = Configs.urls.get(EmployeerAppplicationConstant.FETCH_MENU).getUrl();
			log.info("@@@@ searchCandidates " + Url);
			String userid=null;
			if(session.getAttribute("userId")!=null)
			{
				userid=session.getAttribute("userId").toString();
			}else
			{
				log.info("session is not set in it ");
			}
			response = myWebClient.post(Url, userid).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			response1= myWebClient.post(Url1, null).block();
			if(response1.getToken()!=null) {
				  log.info("s.getToken() :"+response1.getToken());
				  request.getSession().setAttribute("token","Bearer "+response1.getToken());
	    	 }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("insitiute", responsemodel.getData().getInstitute());
					model.addAttribute("skills", responsemodel.getData().getJobPostingSkills());
					model.addAttribute("location", responsemodel.getData().getJobPostingLocation());
					model.addAttribute("masterCourse", responsemodel.getData().getMasterCourse());
					model.addAttribute("degreeCourse", responsemodel.getData().getDegreeCourse());
					model.addAttribute("PHDCOURSE", responsemodel.getData().getPhdCourse());
					log.info("=============");
					log.info("phd courses" + responsemodel.getData().getFetchCompany());
					model.addAttribute("company", responsemodel.getData().getFetchCompany());
					session.setAttribute("companyId", responsemodel.getData().getUserdetails().getCompanyId());
					session.setAttribute("fullName", responsemodel.getData().getUserdetails().getUserName());
					session.setAttribute("employerEmailId", responsemodel.getData().getUserdetails().getEmailId());
					session.setAttribute("employerCompanyName", responsemodel.getData().getUserdetails().getCompanyName());
					session.setAttribute("clicks", responsemodel.getData().getUserdetails().getCredits());
					session.setAttribute("search", responsemodel.getData().getUserdetails().getSearch());
					session.setAttribute("posting", responsemodel.getData().getUserdetails().getPost());
				} else {
					log.info(" Error Ocuured in Service");
				}
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
			

		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception is occurred searchCandidates"+e1.getMessage());
		}

		return "employerviews/searchCandidates";
	}

	@PostMapping("/getRole")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> getRole(@RequestBody JobPosting jobpost,HttpServletRequest request) {
		log.info("Inside fetchSkillsFramework " + jobpost);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.FETCH_SKILL_FRAMEWORK).getUrl();
			log.info("@@@@ fetchSkillsFramework " + Url);
			response = myWebClient.post(Url, jobpost).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return responsemodel;
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("===== Exceptions in getRole =========" + e1.getMessage());
		}
		return null;
	}

	@PostMapping("/resultSearchCandidates")
	public String searchCandiates(@ModelAttribute SearchReq req, Model model,HttpSession session,HttpServletRequest request) {
		log.info("Inside Search candidates " + req);
		WebClientResponse response = null;
		try {
			
			String companyId=session.getAttribute("companyId")!=null?session.getAttribute("companyId").toString():null;
			String userId=null;
			if(session.getAttribute("userId")!=null)
			{
				userId=session.getAttribute("userId").toString();
			}else
			{
				log.info("session is not set in it ");
			}
			req.setUserId(userId);
			req.setCompanyId(companyId);
			req.setMinSal(Optional.ofNullable(req.getMinSal()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setMaxSal(Optional.ofNullable(req.getMaxSal()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setCompany(Optional.ofNullable(req.getCompany()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setNoticePeriod(Optional.ofNullable(req.getNoticePeriod()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setCourse(Optional.ofNullable(req.getCourse()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setSpecialization(Optional.ofNullable(req.getSpecialization()).filter(s -> !s.isEmpty()).orElse(""));
		    
		    req.setCourseType(Optional.ofNullable(req.getCourseType()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setInstitute(Optional.ofNullable(req.getInstitute()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setGender(Optional.ofNullable(req.getGender()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setHighestQualification(Optional.ofNullable(req.getHighestQualification()).filter(s -> !s.isEmpty()).orElse(null));
		    req.setReadyToLocate(Optional.ofNullable(req.getReadyToLocate()).filter(s -> !s.equals("false")).orElse(null));

			
			String Url = Configs.urls.get(EmployeerAppplicationConstant.RESULT_SEARCH_CANDIDATES).getUrl();
			response = myWebClient.post(Url, req).block();
			if(response.getToken()!=null) {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken());
	    	 }
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SearchResp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SearchResp>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("resultData", responsemodel.getData().getResultSearch());
					log.info("====== resultData =====" + responsemodel.getData().getResultSearch());
					model.addAttribute("TotalCandidates", responsemodel.getData().getResultSearch().size());
					model.addAttribute("keySkills", responsemodel.getData().getResponseModel().getJobPostingSkills());
					model.addAttribute("Location", responsemodel.getData().getResponseModel().getJobPostingLocation());
					model.addAttribute("companylist", responsemodel.getData().getResponseModel().getFetchCompany());
					model.addAttribute("insitiute", responsemodel.getData().getResponseModel().getInstitute());
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("===== Exceptions in resultSearchCandidates =========" + e1.getMessage());
		}
		return "employerviews/resultSearchCandidates";
	}

	@PostMapping("/saveSearch")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> saveSearch(@RequestBody SearchReq searchreq,HttpServletRequest request) {
		log.info(" saveSearch ========== " + searchreq);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.SAVE_SEARCH).getUrl();
			response = myWebClient.post(Url, searchreq).block();
			if(response.getToken()!=null) {
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
			log.info("Exception is occurred saveSearch"+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/createFolder")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> createFolder(@RequestBody SearchReq searchreq,HttpServletRequest request) {
		log.info(" createFolder ========== " + searchreq);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.CREATE_FOLDER).getUrl();
			response = myWebClient.post(Url, searchreq).block();
			if(response.getToken()!=null) {
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

	@PostMapping("/fetchFolderDetails")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> fetchFolderDetails(@RequestBody SearchReq searchreq,HttpServletRequest request) {
		log.info(" createFolder ========== " + searchreq);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.FECTH_FOLDER_DETAILS).getUrl();
			response = myWebClient.post(Url, searchreq).block();
			if(response.getToken()!=null) {
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
			log.info("Exception is occured fetchFolderDetails"+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/addExistingFolder")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> addExistingFolder(@RequestBody SearchReq searchreq,HttpServletRequest request) {
		log.info(" addExistingFolder ========== " + searchreq);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.EXISTING_FOLDER_ADDING_CANDIDATEID).getUrl();
			response = myWebClient.post(Url, searchreq).block();
			if(response.getToken()!=null) {
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
			log.info("Exeception is occurred addExistingFolder"+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/clickDeduct")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> clickDeduct(@RequestBody DeductionPoints deduct,HttpServletRequest request) {
		log.info(" clickDeduct   ========== " + deduct);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.DEDUCT_POINTS).getUrl();
			response = myWebClient.post(Url, deduct).block();
			if(response.getToken()!=null) {
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
			log.info("Exception is occured clickDeduct"+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@GetMapping("/employerDownloadResume")
	public ResponseEntity<byte[]> downloadResume(HttpServletRequest request, HttpServletResponse response1, Model model,
			HttpSession session) {
		CareerDetails career = new CareerDetails();
		log.info("@@@@ downloadResume  @@@@@ :");
		log.info("====== downloadResume ===========");
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			String Url = Configs.urls.get(ApplicationConstant.DownloadResume).getUrl();
			log.info("@@@@ candiate dashboard " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {

					byte[] pdfBytes = responsemodel.getData().getSignup().getResumeFiles();
					String name = responsemodel.getData().getSignup().getResumeName();
					String applicationType = responsemodel.getData().getSignup().getFiletype();
					if (pdfBytes.length > 0 && !name.isEmpty() && !applicationType.isEmpty()) {
						HttpHeaders headers = new HttpHeaders();
						headers.set("Content-Disposition", "attachment; filename=" + name);
						headers.set("Content-Type", applicationType);
						headers.setContentLength(pdfBytes.length);
						return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
					} else {
						log.info(
								"anyThing name or application type or file is null or empty that why file is not getting download");
					}

				}
			} else {
				log.info(" Error in Response");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= downloadResume =====" + e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	// sharhrukh
	@PostMapping("/searchbyemail")
	@ResponseBody
	public String searchByEmail(@RequestBody SearchRequest data,HttpServletRequest request) {
		log.info(" addExistingFolder ========== " + data);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.SEARCH_EMAIL).getUrl();
			response = myWebClient.post(Url, data).block();
			if(response.getToken()!=null) 
		     {
				  log.info("s.getToken() :"+response.getToken());
				  request.getSession().setAttribute("token","Bearer "+response.getToken()); 
			 }
			log.info("response form the search Email APi ========== " + response);
			if (response.getStatusCode() == 200) {
				 response.getBody();
				if (response.getBody().equals("true")) {
					return "User Found";
				} else if (response.getBody().equals("false")) {
					return "No User Found";
				}
				else
				{
					return "No User Found";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is occurred searchbyemail "+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}
	// sharhrukh
	
	@PostMapping("managesearch")
	public String managesearch(HttpSession session,HttpServletRequest request,Model model)
	{
		WebClientResponse response= null;
		try {
			managesearchmodel managesearch = new managesearchmodel();
			
			if(session.getAttribute("userId")!=null)
			{
				managesearch.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in it ");
			}
			if(session.getAttribute("companyId")!=null)
			{
				managesearch.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("session is not set in companyId");
			}
			
			String Url=Configs.urls.get(EmployeerAppplicationConstant.MANAGE_SAVESEARCHDETAIL).getUrl();
			response=myWebClient.post(Url,managesearch).block();
			if(response.getToken()!=null)
			{
				log.info("s.getToken() :"+response.getToken());
				request.getSession().setAttribute("token","Bearer "+response.getToken()); 
			}
			if(response.getStatusCode() == 200)
			{
				ServiceResponseWrapperModel<SearchResp> responsemodel = objectMapper.readValue(response.getBody(), new TypeReference<ServiceResponseWrapperModel<SearchResp>>() {});
				if(responsemodel.getErrors().getErrorCode().equals("0000"))
				{
					model.addAttribute("savesearchdetails", responsemodel.getData().getManageSearchDetails());
					System.out.println("data is ==="+responsemodel.getData().getManageSearchDetails());
				}
			}
			
		} catch (Exception e ) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("exception is occured === "+e.getMessage());
		}
		return "employerviews/managesearch";
	}
	
	@PostMapping("modifydeletesearch")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> editsearch(@RequestBody  managesearchmodel savesearch,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				savesearch.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in it ");
			}
			if(session.getAttribute("companyId")!=null)
			{
				savesearch.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("session is not set in companyId");
			}
			
			String Url=Configs.urls.get(EmployeerAppplicationConstant.UPDATE_SEARCHDETAILS).getUrl();
			response=myWebClient.post(Url,savesearch).block();
			if(response.getToken()!=null)
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
			log.info("Exception is occcured ==== "+e.getMessage());
		}
		return null;
	}
	
	@PostMapping("/addcomments")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> addcomments(@RequestBody SearchReq searchreq,HttpSession session,HttpServletRequest request)
	{
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				searchreq.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in it ");
			}
			if(session.getAttribute("companyId")!=null)
			{
				searchreq.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("session is not set in companyId");
			}
			
			String Url=Configs.urls.get(EmployeerAppplicationConstant.ADD_COMMENTS).getUrl();
			response=myWebClient.post(Url,searchreq).block();
			if(response.getToken()!=null)
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
			log.info("Exception is occured === "+e.getMessage());
		}
		return null;
	}
	
	@ResponseBody
	@PostMapping("/checkingpoints")
	public ServiceResponseWrapperModel<ResponseModel> checkingpoints(HttpSession session,HttpServletRequest request) 
	{
		SearchReq searchreq = new SearchReq();
		WebClientResponse response=null;
		try {
			
			if(session.getAttribute("userId")!=null)
			{
				searchreq.setUserId(session.getAttribute("userId").toString());
			}else
			{
				log.info("session is not set in it ");
			}
			if(session.getAttribute("companyId")!=null)
			{
				searchreq.setCompanyId(session.getAttribute("companyId").toString());
			}else
			{
				log.info("session is not set in companyId");
			}
			
			String Url=Configs.urls.get(EmployeerAppplicationConstant.CHECK_POINTS).getUrl();
			response=myWebClient.post(Url,searchreq).block();
			if(response.getToken()!=null)
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
			log.info("Exception is occured === "+e.getMessage());
		}
		return null;
	}
}
