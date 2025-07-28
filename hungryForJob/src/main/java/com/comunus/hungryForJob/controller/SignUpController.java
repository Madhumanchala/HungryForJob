package com.comunus.hungryForJob.controller;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.connector.Response;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.APIErrorModel;
import com.comunus.hungryForJob.model.CareerDetails;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJob.model.SignUp;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SignUpController {

	@Autowired
	private WebClientConfig myWebClient;

	@Autowired
	private ObjectMapper objectMapper;

	@GetMapping("/verifyEmail")
	public String verfyEmail() {
		
		log.info("verfiyEmail page called ++++++++++++++++");
		return "verifyEmail";
	}

	@ResponseBody
	@PostMapping("/ExistedEmail")
	public APIErrorModel existedEmailChecking(@ModelAttribute SignUp sign, Model model) {
		log.info("====== existedEmailChecking   ======" + sign);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.VERIFY_EMAIL).getUrl();
			log.info("@@@@ ExistedEmailChecking " + Url);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
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
	@PostMapping("/ValidateOtp")
	public APIErrorModel ValidateOtp(@ModelAttribute SignUp sign, Model model, HttpSession session) {
		log.info("====== ValidateOtp ===========" + sign);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.VERIFY_OTP).getUrl();
			log.info("@@@@ ValidateOtp " + Url);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				log.info("session is setted in username:="+sign.getEmailInput());
				session.setAttribute("username", sign.getEmailInput());
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
						});
				return responsemodel.getErrors();
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Validate Otp ========" + e1.getMessage());
		}
		return null;
	}

	@PostMapping("/empportalRegister")
	public String registerEmpCandidates(@RequestParam("email") String email, HttpSession session) {
		try {
			
			log.info("====== empportalRegister ===========");

			if (email.isEmpty()) {
				return "error";
			} else {
				session.setAttribute("username", email);
				session.setAttribute("role", "recuriter");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Exception is empportalRegister"+e.getMessage());
		}
		

		log.info("EMPloyer PortalRegister Page is Open");
		return "employerviews/EmpPortalRegister";
	}

	@PostMapping("/portalRegister")
	public String registerEmployee(HttpSession session,Model model) {
		try {
			
			log.info("====== portalRegister ==========="+session.getAttribute("username"));
			session.setAttribute("username", session.getAttribute("username"));
			model.addAttribute("emailId", session.getAttribute("username"));
			log.info("portal register page "+session.getAttribute("username"));
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception is portalRegister"+e.getMessage());
			// TODO: handle exception
		}
		
		return "portalRegister";
	}

	@PostMapping("/candiateRegister")
	public String candiateRegister(@ModelAttribute SignUp sign, @RequestParam("resume_doc") MultipartFile cv,
			Model model, HttpSession session, HttpServletResponse resp) {
		log.info("====== Candiate Register  ======" + sign);
		log.info("====== signup ===========" + sign.toString());
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.REGISTER_CANDIATE).getUrl();
			log.info("@@@@ candiateRegister " + Url);
			byte[] files = cv.getBytes();
			String base64 = Base64.encodeBase64String(files);
			sign.setResumefileCV(base64);
			sign.setResumeName(cv.getOriginalFilename());
			sign.setFiletype(cv.getContentType());
			String[] dateOfBirth=sign.getDateofBirth().split("-");
			String birthdate= dateOfBirth[2]+"-"+dateOfBirth[1]+"-"+dateOfBirth[0];
			sign.setDateofBirth(birthdate);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					session.setAttribute("candidateId", responsemodel.getData().getCandidateId());
					session.setAttribute("candidateName", responsemodel.getData().getCandidateName());
					log.info("candidateId" + responsemodel.getData().getCandidateId());
					if (sign.getWork_status().equals("fresher")) {
						session.setAttribute("workStatus", sign.getWork_status());
						model.addAttribute("workstatus", "fresher");
					} else {
						session.setAttribute("workStatus", sign.getWork_status());
						model.addAttribute("workstatus", "experience");
//			    		 return "redirect:/registerExperience";
					}
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in candiateRegister"+e1.getMessage());
		}
		return "portalRegister";
	}

	@PostMapping("/registerExperience")
	public String registerExperience(Model model) {
		log.info("registerExperience page called ++++++++++++++++");
		WebClientResponse response = null;
		try {

			String Url = Configs.urls.get(ApplicationConstant.REGISTER_EXPERIENCE).getUrl();
			log.info("@@@@ registerExperience " + Url);
			response = myWebClient.post(Url, null).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("technicalSkills", responsemodel.getData().getSkills());
					model.addAttribute("cities", responsemodel.getData().getLocation());
					model.addAttribute("allCities", responsemodel.getData().getAllCities());
				} else {
					log.info("======== failed to fetch " + responsemodel.getErrors().getErrorMessage());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("register Experience ======", e.getMessage());
			// TODO: handle exception
		}
		return "registerExperience";
	}

	@ResponseBody
	@PostMapping("/getCity")
	public ResponseEntity<?> getCities(@ModelAttribute CareerDetails career, Model model, HttpSession session) {
		log.info("====== getCities ===========");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.GetCities).getUrl();
			log.info("@@@@ getCities " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return ResponseEntity.ok(responsemodel);
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in getCity === "+e1.getMessage());
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/candiateExperienceRegistered")
	public APIErrorModel candiateExperience(@ModelAttribute CareerDetails career) {
		log.info("candiateExperienceRegistered page called ++++++++++++++++");
		WebClientResponse response = null;
		try {

			String Url = Configs.urls.get(ApplicationConstant.Candiate_Experience_Registered).getUrl();
			log.info("@@@@ ValidateOtp " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return responsemodel.getErrors();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in candiateExperienceRegistered === "+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/employmentDetails")
	public String employmentDetails(HttpSession session, Model model) {

		log.info("Employeement Details page called ++++++++++++++++");
		WebClientResponse response = null;
		String username = null;
		try {
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			String Url = Configs.urls.get(ApplicationConstant.GetEmploymentDetails).getUrl();
			log.info("@@@@ EmploymentDetails " + Url);
			response = myWebClient.post(Url, username).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					if (responsemodel.getData().getDateofBirth() == null
							|| responsemodel.getData().getDateofBirth().isEmpty()) {
						model.addAttribute("dateOfBirth", "1970-01-01");
					} else {
						model.addAttribute("dateOfBirth", responsemodel.getData().getDateofBirth());
					}
				} else {
					log.info("======== failed to fetch " + responsemodel.getErrors().getErrorMessage());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info(" Educatione  details  =====" + e.getMessage());
			// TODO: handle exception
		}
		return "employmentDetails";

	}

	@PostMapping("/companyFetchDetails")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> fetchCompanyDetails() {
		log.info(" companyFetchDetails called");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.FETCH_COMPANYDETAILS).getUrl();
			log.info("@@@@ fetchCompanyDetails " + Url);
			response = myWebClient.post(Url, null).block();
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

	@PostMapping("/saveEmployeementDetails")
	@ResponseBody
	public APIErrorModel saveEmployeementDetails(@ModelAttribute CareerDetails career) {
		log.info("saveEmployeementDetails page called ++++++++++++++++");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.Candiate_Employeement_Details).getUrl();
			log.info("@@@@ ValidateOtp " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return responsemodel.getErrors();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in saveEmployeementDetails==="+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/education")
	public String EducationDetails(Model model, HttpSession session) {
		log.info("EducationDetails page called ++++++++++++++++");
		WebClientResponse response = null;
		String username = null;
		try {
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set." + username);
			}
			String Url = Configs.urls.get(ApplicationConstant.Education_Details).getUrl();
			log.info("@@@@ Education " + Url);
			response = myWebClient.post(Url, username).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("highestQualification", responsemodel.getData().getHighestQualification());
					model.addAttribute("courseType", responsemodel.getData().getCourseType());
					model.addAttribute("institute", responsemodel.getData().getInstitute());
					model.addAttribute("grading", responsemodel.getData().getGradingSystem());
					int currentYear = LocalDate.now().getYear();
					model.addAttribute("currentYear", currentYear);
					model.addAttribute("dateOfBirth", responsemodel.getData().getDob());

				} else {
					log.info("======== failed to fetch " + responsemodel.getErrors().getErrorMessage());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info(" Educatione  details  =====" + e.getMessage());
			// TODO: handle exception
		}
		return "education";
	}

	@PostMapping("/getCourseDetails")
	@ResponseBody
	public ResponseEntity<?> getCourseDetails(@ModelAttribute CareerDetails career) {
		log.info("====== registerExperience ===========");
		log.info("registerExperience page called ++++++++++++++++");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.Courses_Details).getUrl();
			log.info("@@@@ getCourseDetails " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return ResponseEntity.ok(responsemodel);
				} else {
					return ResponseEntity.ok(responsemodel.getErrors().getErrorCode());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in getCourseDetails === "+e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/saveEducationDetails")
	public APIErrorModel saveEducationDetails(@ModelAttribute CareerDetails career) {
		log.info("====== saveEducationDetails   ======");
		log.info("====== saveEducationDetails ===========");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.Save_Education_Details).getUrl();
			log.info("@@@@ saveEducationDetails " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				return responsemodel.getErrors();

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Execption in saveEducationDetails"+e1.getMessage());
		}
		return null;
	}

	@PostMapping("/lastStep")
	public String lastStep(Model model, HttpSession session) {
		log.info("====== lastStep Details  ===========");
		log.info("lastStep Details page called ++++++++++++++++");
		WebClientResponse response = null;
		try {

			String Url = Configs.urls.get(ApplicationConstant.LastStep).getUrl();
			log.info("@@@@ LastStep " + Url);
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			CareerDetails career = new CareerDetails();
			career.setCandidateId(username);
			response = myWebClient.post(Url, career).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					if (responsemodel.getData().getCandiateSkills() != null) {
						model.addAttribute("techname",
								responsemodel.getData().getCandiateSkills().get(0).getTechName());
						model.addAttribute("months", responsemodel.getData().getCandiateSkills().get(0).getMonths());
						model.addAttribute("years", responsemodel.getData().getCandiateSkills().get(0).getYears());
					}
					model.addAttribute("flag", responsemodel.getData().getFlag());
					model.addAttribute("designation", responsemodel.getData().getDesignation());
					log.info("flag ==========" + responsemodel.getData().getFlag());
				} else {
					log.info("======== failed to fetch " + responsemodel.getErrors().getErrorMessage());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in lastStep ===="+e.getMessage());
			// TODO: handle exception
		}
		return "lastStep";
	}

	@PostMapping("/saveLastStep")
	@ResponseBody
	public APIErrorModel saveLastStep(@RequestParam(value="resume_doc",required = false) MultipartFile cv, @ModelAttribute SignUp sign,
			HttpSession session) {
		log.info("====== saveLastStep   ======");
		log.info("====== saveLastStep ===========");
		WebClientResponse response = null;
		try {

			String Url = Configs.urls.get(ApplicationConstant.SaveLastStep).getUrl();
			log.info("@@@@ saveLastStep " + Url);
			if (cv != null) {
				byte[] files = cv.getBytes();
				String base64 = Base64.encodeBase64String(files);
				sign.setResumefileCV(base64);
				sign.setResumeName(cv.getOriginalFilename());
				sign.setFiletype(cv.getContentType());
			}
			
			String CandidateId = null;
			if (session.getAttribute("candidateId") != null) {
				CandidateId = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			sign.setCandidateId(CandidateId);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
						});
				return responsemodel.getErrors();
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in laststep"+e);
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/getPoastalCode")
	@ResponseBody
	public List<Map<String, Object>> getpostalCode(HttpServletRequest request) {
		List<Map<String, Object>> response= new ArrayList<>();
		try {
			
//			RestTemplate restTemplate = new RestTemplate();
//			String pincode = request.getParameter("pincode");
//			String url = "https://api.postalpincode.in/pincode/" + pincode;
//			 response = restTemplate.getForObject(url, List.class);
			
			String pincode = request.getParameter("pincode");
	        String url = "https://api.postalpincode.in/pincode/" + pincode;

	        // Add User-Agent header to avoid being blocked
	        HttpHeaders headers = new HttpHeaders();
	        headers.set("User-Agent", "Spring-RestTemplate/1.0");

	        HttpEntity<String> entity = new HttpEntity<>(headers);

	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<List> res = restTemplate.exchange(
	            url,
	            HttpMethod.GET,
	            entity,
	            List.class
	        );

	        response = res.getBody();
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("Expection getPoastalCode"+e.getMessage());
			// TODO: handle exception
		}
		
		return response;
	}

	@PostMapping("/addNewCompany")
	@ResponseBody
	public ServiceResponseWrapperModel<ResponseModel> addNewCompany(@RequestBody SignUp signup, HttpSession session) {
		log.info("add New Company called");
		WebClientResponse response = null;
		try {
			String candidateId=session.getAttribute("candidateId").toString();
//			String candidateId = "1";
			signup.setCandidateId(candidateId);
			String Url = Configs.urls.get(ApplicationConstant.ADD_NEW_COMPANY).getUrl();
			log.info("@@@@ add New Company " + Url);
			response = myWebClient.post(Url, signup).block();
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
	
	@PostMapping("/candidatenewpassword")
	  public String candidatenewpassword()
	  {
		  return "candidatechangepassword";
	  }
	
	@PostMapping("/resendotpcandidate")
	@ResponseBody
	public APIErrorModel resendotpcandidate(@RequestBody SignUp sign, Model model) {
		log.info("====== existedEmailChecking   ======" + sign);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.RESENDOTPCANDIADTE).getUrl();
			log.info("@@@@ resendotpcandidate " + Url);
			response = myWebClient.post(Url, sign).block();
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<SignUp> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SignUp>>() {
						});
				return responsemodel.getErrors();

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Existed Email ========" + e1.getMessage());
		}
		return null;
	}
}
