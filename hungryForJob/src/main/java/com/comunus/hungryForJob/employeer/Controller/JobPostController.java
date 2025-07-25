package com.comunus.hungryForJob.employeer.Controller;

import java.util.Optional;

import javax.servlet.http.HttpServlet;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.JobPlan;
import com.comunus.hungryForJob.employeer.Model.JobPosting;
import com.comunus.hungryForJob.model.CareerDetails;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJobs.employeer.Model.JobPlan;
import com.comunus.hungryForJobs.employeer.Model.JobPosting;
import com.comunus.hungryForJobs.employeer.Model.Signup;
import com.comunus.hungryForJobs.model.ResponseModel;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;*/
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class JobPostController {

	@Autowired
	WebClientConfig myWebClient;

	@Autowired
	private ObjectMapper objectMapper;

	@PostMapping("/jobPost")
	public String jobPost(Model model, HttpServletRequest request, HttpSession session) {
		log.info("Inside jobPost ");
		JobPosting jobPosting = new JobPosting();
		WebClientResponse response = null;
		try {
			
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				String userId = session.getAttribute("userId").toString();
				jobPosting.setCompanyId(companyId);
				jobPosting.setUserId(userId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			
			String Url = Configs.urls.get(EmployeerAppplicationConstant.JOB_POSTING).getUrl();
			log.info("@@@@ jobPost " + Url);
			response = myWebClient.post(Url, jobPosting).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					log.info(" keyskills" + responsemodel.getData().getJobPostingSkills());
					model.addAttribute("keySkills", responsemodel.getData().getJobPostingSkills());
					model.addAttribute("jobCategories", responsemodel.getData().getJobPostingIndustry());
					model.addAttribute("department", responsemodel.getData().getJobPostingDepartment());
					model.addAttribute("location", responsemodel.getData().getJobPostingLocation());
					model.addAttribute("role", responsemodel.getData().getJobPostingRole());
					model.addAttribute("education", responsemodel.getData().getJobPostingEducationQualification());
					model.addAttribute("masterstattus", responsemodel.getData().getJobPostStatus());
					model.addAttribute("operatedByUser", responsemodel.getData().getOperatedByUser());
					model.addAttribute("clients", responsemodel.getData().getClients());
					model.addAttribute("userRole", session.getAttribute("rolestatus").toString());
					model.addAttribute("isVisibleFlag", session.getAttribute("isVisible").toString());
				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in jobPost " + e1.getMessage());
		}
		return "employerviews/jobPost";

	}

	@PostMapping("/saveJobPost")
	@ResponseBody
	public String saveJobPost(@RequestBody JobPosting jobpost, HttpServletRequest request, HttpSession session) {
		log.info("Inside saveJobPost " + jobpost);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.SAVE_JOB_POSTING).getUrl();
			log.info("@@@@ saveJobPost " + Url);

			if (jobpost.getOperatedBy() == null || jobpost.getOperatedBy().equals("")) {
				jobpost.setOperatedBy(jobpost.getUserId());
			}
			
			if (session.getAttribute("isVisible") != null) {
				jobpost.setIsVisible(session.getAttribute("isVisible").toString());
			} else {
				log.info("session is not set in it ");
			}

			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return "success";
				} else {
					return "Failure";
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exeption in saveJobPost" + e1.getMessage());
		}
		return null;
	}

	@PostMapping("/fetchSkillsFramework")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> fetchSkillsFramework(@RequestBody JobPosting jobpost,
			HttpServletRequest request) {
		log.info("Inside fetchSkillsFramework " + jobpost);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.FETCH_SKILL_FRAMEWORK).getUrl();
			log.info("@@@@ fetchSkillsFramework " + Url);
			response = myWebClient.post(Url, jobpost).block();

			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
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
			log.info("===== Exceptions in fetchSkillsFramework =========" + e1.getMessage());
		}
		return null;
	}

	@PostMapping("/jobInternship")
	public String jobInternShip(Model model, HttpServletRequest request, HttpSession session) {

		log.info("Inside jobPost ");
		JobPosting jobPosting = new JobPosting();
		WebClientResponse response = null;
		try {
			
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				String userId = session.getAttribute("userId").toString();
				jobPosting.setCompanyId(companyId);
				jobPosting.setUserId(userId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			
			String Url = Configs.urls.get(EmployeerAppplicationConstant.JOB_POSTING).getUrl();
			log.info("@@@@ jobPost Internship " + Url);
			response = myWebClient.post(Url, jobPosting).block();

			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("keySkills", responsemodel.getData().getJobPostingSkills());
					model.addAttribute("jobCategories", responsemodel.getData().getJobPostingIndustry());
					model.addAttribute("department", responsemodel.getData().getJobPostingDepartment());
					model.addAttribute("location", responsemodel.getData().getJobPostingLocation());
					model.addAttribute("role", responsemodel.getData().getJobPostingRole());
					model.addAttribute("education", responsemodel.getData().getJobPostingEducationQualification());
					model.addAttribute("perksAndBenfists", responsemodel.getData().getInternPerksAndBenefits());
					model.addAttribute("masterstattus", responsemodel.getData().getJobPostStatus());
					model.addAttribute("operatedByUser", responsemodel.getData().getOperatedByUser());
					model.addAttribute("client", responsemodel.getData().getClients());
					model.addAttribute("userRole", session.getAttribute("rolestatus").toString());
				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in jobInternship" + e1.getMessage());
		}
		return "employerviews/jobInternship";
	}

	@PostMapping("/saveJobPostInternship")
	@ResponseBody
	public String saveJobPostInternship(@RequestBody JobPosting jobpost, HttpServletRequest request,
			HttpSession session) {
		log.info("Inside saveJobPost " + jobpost);
		WebClientResponse response = null;
		try {

			if (jobpost.getOperatedBy() == null || jobpost.getOperatedBy().equals("")) {
				jobpost.setOperatedBy(jobpost.getUserId());
			}
			
			if (session.getAttribute("isVisible") != null) {
				jobpost.setIsVisible(session.getAttribute("isVisible").toString());
			} else {
				log.info("session is not set in it ");
			}

			String Url = Configs.urls.get(EmployeerAppplicationConstant.SAVE_JOB_POSTING_INTERNSHIP).getUrl();
			log.info("@@@@ saveJobPostInternship " + Url);
			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return "success";

				} else {
					return "Failure";
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exeception is occured saveJobPostInternship" + e1.getMessage());
		}
		return null;
	}

	@PostMapping("/saveJobPlan")
	@ResponseBody
	public String saveJobPlan(@RequestBody JobPlan jobPlan, HttpServletRequest request) {
		log.info("save job plan =====" + jobPlan);
		WebClientResponse response = null;
		try {

			String url = Configs.urls.get(EmployeerAppplicationConstant.SAVE_JOB_PLAN).getUrl();
			log.info("save job posting plan ======" + url);

			response = myWebClient.post(url, jobPlan).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return "sucess";
				} else {
					return "failure";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception occured saveJobPlan" + e);
			// TODO: handle exception
		}
		return null;
	}

	@GetMapping("downloadResumeCandidate")
	public ResponseEntity<byte[]> downloadResume(HttpServletRequest request, HttpServletResponse response1, Model model,
			HttpSession session) {
		JobPosting career = new JobPosting();
		log.info("@@@@ downloadResume  @@@@@ :");
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("userId") != null) {
				username = session.getAttribute("userId").toString();
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				career.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			if (session.getAttribute("isVisible") != null) {
				career.setIsVisible(session.getAttribute("isVisible").toString());
			} else {
				log.info("Session expired or isVisible is not set.");
			}
			String candidateId = request.getParameter("candidateId").toString();
			career.setCandidateId(candidateId);
			career.setUserId(username);
			String Url = Configs.urls.get(EmployeerAppplicationConstant.EmployerDownloadResume).getUrl();
			log.info("@@@@ employer download resume " + Url);
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
					if (pdfBytes.length > 0 && !name.isEmpty() && !applicationType.isEmpty() && pdfBytes != null) {
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
				log.info("Error in Response === ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= downloadResume =====" + e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/managejobpost")
	public String managejobpost(Model model, HttpSession session, HttpServletRequest request) {
		WebClientResponse response = null;
		JobPosting jobpost = new JobPosting();
		log.info("managejobpost details ==== ");
		try {
			if (session.getAttribute("userId") != null) {
				String username = session.getAttribute("userId").toString();
				jobpost.setUserId(username);
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				jobpost.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			jobpost.setPaginationOffSet(Optional.ofNullable(request.getParameter("paginationOffSet")).orElse("1"));
			jobpost.setSearchValue(Optional.ofNullable(request.getParameter("searchValue")).orElse(""));
			jobpost.setCategoryType(Optional.ofNullable(request.getParameter("categoryType")).orElse(""));
			jobpost.setType(Optional.ofNullable(request.getParameter("type")).orElse(""));
			
			String Url = Configs.urls.get(EmployeerAppplicationConstant.MANAGE_JOB_POST).getUrl();
			response = myWebClient.post(Url, jobpost).block();

			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("listofjobpostdetails", responsemodel.getData().getListJobPostDetails());
					model.addAttribute("status", responsemodel.getData().getMasterStatus());
					model.addAttribute("cities", responsemodel.getData().getCities());
					model.addAttribute("sessionUserId", session.getAttribute("userId").toString());
					model.addAttribute("sessionRole", session.getAttribute("rolestatus").toString());
					model.addAttribute("totalpages", responsemodel.getData().getPaginationTotalPages());
					model.addAttribute("currentPage", jobpost.getPaginationOffSet());
					model.addAttribute("searchvalue", jobpost.getSearchValue());
					model.addAttribute("jobtype", jobpost.getJobType());
					model.addAttribute("searchvalue", jobpost.getSearchValue());
					model.addAttribute("categoryType", jobpost.getCategoryType());
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "employerviews/managejobpost";
	}

	@PostMapping("/editjobpost")
	public String editJobPost(Model model, HttpServletRequest request, HttpSession session) {
		log.info("Inside editJobPost ");
		WebClientResponse response = null;
		JobPosting jobpost = new JobPosting();
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.EDIT_JOB_POST).getUrl();
			log.info("@@@@ jobPost " + Url);
			if (session.getAttribute("userId") != null) {
				String username = session.getAttribute("userId").toString();
				jobpost.setUserId(username);
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				jobpost.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			String id = request.getParameter("id").toString();
			jobpost.setId(id);
			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					log.info(" keyskills" + responsemodel.getData().getJobPostingSkills());
					model.addAttribute("keySkills", responsemodel.getData().getJobPostingSkills());
					model.addAttribute("jobCategories", responsemodel.getData().getJobPostingIndustry());
					model.addAttribute("department", responsemodel.getData().getJobPostingDepartment());
					model.addAttribute("location", responsemodel.getData().getJobPostingLocation());
					model.addAttribute("role", responsemodel.getData().getJobPostingRole());
					model.addAttribute("education", responsemodel.getData().getJobPostingEducationQualification());
					model.addAttribute("editjobpostdetails", responsemodel.getData().getEditJobpostingDetails());
					model.addAttribute("masterstatus", responsemodel.getData().getJobPostStatus());
					model.addAttribute("client", responsemodel.getData().getClients());
					model.addAttribute("operatedByUser", responsemodel.getData().getOperatedByUser());
					model.addAttribute("userRole", session.getAttribute("rolestatus").toString());
					log.info("data jobpost ==" + responsemodel.getData().getEditJobpostingDetails());
				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in jobPost " + e1.getMessage());
		}
		return "employerviews/editjobpost";
	}

	@ResponseBody
	@PostMapping("/updatejobpost")
	public String updateJobPost(@RequestBody JobPosting jobpost, HttpServletRequest request) {
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.UPDATE_JOB_POST).getUrl();
			log.info("@@@@ fetchSkillsFramework " + Url);
			response = myWebClient.post(Url, jobpost).block();

			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return "success";
				} else {
					return "Failure";
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@PostMapping("/managejobview")
	public String manageJobView(HttpServletRequest request, Model model, HttpSession session) {
		WebClientResponse response = null;
		log.info("Inside manageJobView ");
		JobPosting jobpost = new JobPosting();
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.JOB_POST_VIEW).getUrl();
			log.info("@@@@ jobPost " + Url);
			if (session.getAttribute("userId") != null) {
				String username = session.getAttribute("userId").toString();
				jobpost.setUserId(username);
				String jobId = request.getParameter("jobId").toString();
				jobpost.setId(jobId);
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				jobpost.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {

					model.addAttribute("listofjobpost", responsemodel.getData().getJobTittleList());
					model.addAttribute("cardnames", responsemodel.getData().getMasterCard());
					model.addAttribute("candidatesDetails", responsemodel.getData().getCandidateDetails());
					log.info("candidatedetails === " + responsemodel.getData().getCandidateDetails());
					model.addAttribute("jobpostdetails", responsemodel.getData().getJobPostDetailsView());
					model.addAttribute("jobpostId", jobpost.getId());
					model.addAttribute("interviewmode", responsemodel.getData().getInterviewMode());
					model.addAttribute("interviewPanel", responsemodel.getData().getInterviewerPanel());
				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "employerviews/managejobview";
	}

	@ResponseBody
	@PostMapping("/changeCandidateStatusjob")
	public ServiceResponseWrapperModel<ResponseModel> changecandidatestatus(@RequestBody JobPosting jobpost,
			HttpServletRequest request, HttpSession session) {
		WebClientResponse response = null;
		try {
			if (session.getAttribute("userId") != null) {
				String userid = session.getAttribute("userId").toString();
				jobpost.setUserId(userid);
			} else {
				log.info("session is not set in it ");
			}
			String Url = Configs.urls.get(EmployeerAppplicationConstant.CHANGE_CANDIDATE_STATUS).getUrl();
			log.info("@@@@ changecandidatestatus " + Url);
			response = myWebClient.post(Url, jobpost).block();

			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				return responsemodel;

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is occured === "+e.getMessage());
		}
		return null;
	}

	@PostMapping("/managejobinfo")
	public String managejobinfo(HttpServletRequest request, Model model, HttpSession session) {
		WebClientResponse response = null;
		log.info("Inside manageJobView ");
		JobPosting jobpost = new JobPosting();
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.JOB_POST_INFO).getUrl();
			log.info("@@@@ managejobinfo " + Url);
			if (session.getAttribute("userId") != null) {
				String username = session.getAttribute("userId").toString();
				jobpost.setUserId(username);
				String jobId = request.getParameter("jobId").toString();
				jobpost.setId(jobId);
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				jobpost.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {

					model.addAttribute("jobpostdetails", responsemodel.getData().getJobPostDetailsView());
					model.addAttribute("listofjobpost", responsemodel.getData().getJobTittleList());
					model.addAttribute("jobpostId", jobpost.getId());
					model.addAttribute("tech", responsemodel.getData().getTechName());
					model.addAttribute("education", responsemodel.getData().getEducName());
				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			log.info("Exceptions is occured == "+e.getMessage());
			e.printStackTrace();
		}
		return "employerviews/managejobpostdesc";
	}

	@PostMapping("/editInternshippost")
	public String editInternshipPost(Model model, HttpServletRequest request, HttpSession session) {
		log.info("***************** Inside editinternshippost ****************");
		WebClientResponse response = null;
		JobPosting jobpost = new JobPosting();
		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.EDIT_JOB_POST).getUrl();
			log.info("@@@@ jobPost " + Url);
			if (session.getAttribute("userId") != null) {
				String username = session.getAttribute("userId").toString();
				jobpost.setUserId(username);
			} else {
				log.info("Session expired or userId is not set.");
			}
			if (session.getAttribute("companyId") != null) {
				String companyId = session.getAttribute("companyId").toString();
				jobpost.setCompanyId(companyId);
			} else {
				log.info("Session expired or companyId is not set.");
			}
			String id = request.getParameter("id").toString();
			jobpost.setId(id);
			response = myWebClient.post(Url, jobpost).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					log.info(" keyskills" + responsemodel.getData().getJobPostingSkills());
					model.addAttribute("keySkills", responsemodel.getData().getJobPostingSkills());
					model.addAttribute("jobCategories", responsemodel.getData().getJobPostingIndustry());
					model.addAttribute("department", responsemodel.getData().getJobPostingDepartment());
					model.addAttribute("location", responsemodel.getData().getJobPostingLocation());
					model.addAttribute("role", responsemodel.getData().getJobPostingRole());
					model.addAttribute("education", responsemodel.getData().getJobPostingEducationQualification());
					model.addAttribute("editjobpostdetails", responsemodel.getData().getEditJobpostingDetails());
					model.addAttribute("masterstatus", responsemodel.getData().getJobPostStatus());
					model.addAttribute("perksAndBenfists", responsemodel.getData().getInternPerksAndBenefits());
					model.addAttribute("userRole", session.getAttribute("rolestatus").toString());
					model.addAttribute("client", responsemodel.getData().getClients());
					model.addAttribute("operatedByUser", responsemodel.getData().getOperatedByUser());

					model.addAttribute("savedperksList",
							responsemodel.getData().getEditJobpostingDetails().getPerksAndBenefits());
					log.info("data jobpost ==" + responsemodel.getData().getEditJobpostingDetails());

				} else {
					log.info(" Error Ocuured in Service");
				}

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in editinternshippost " + e1.getMessage());
		}
		return "employerviews/editInternshippost";
	}

}
