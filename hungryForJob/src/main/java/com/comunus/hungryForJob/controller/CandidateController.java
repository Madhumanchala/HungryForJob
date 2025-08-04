package com.comunus.hungryForJob.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.time.Year;
import java.util.Optional;
import java.util.zip.GZIPOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.APIErrorModel;
import com.comunus.hungryForJob.model.CareerDetails;
import com.comunus.hungryForJob.model.EducationDetails;
import com.comunus.hungryForJob.model.ResponseModel;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJob.model.SignUp;
/*import com.comunus.hungryForJobs.config.Configs;
import com.comunus.hungryForJobs.config.WebClientConfig;
import com.comunus.hungryForJobs.config.WebClientResponse;
import com.comunus.hungryForJobs.constant.ApplicationConstant;
import com.comunus.hungryForJobs.model.APIErrorModel;
import com.comunus.hungryForJobs.model.CareerDetails;
import com.comunus.hungryForJobs.model.EducationDetails;
import com.comunus.hungryForJobs.model.ResponseModel;
import com.comunus.hungryForJobs.model.ServiceResponseWrapperModel;
import com.comunus.hungryForJobs.model.SignUp;*/
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CandidateController {

	@Autowired
	private WebClientConfig myWebClient;

	@Autowired
	private ObjectMapper objectMapper;

	@PostMapping("/candidateDashboard")
	public String candidateDashboard(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		log.info("@@@@ candidateDashboard  @@@@@ :");
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			CareerDetails career = new CareerDetails();
			String jobtittle = Optional.ofNullable(request.getParameter("jobTitle")).orElse("");
			String location = Optional.ofNullable(request.getParameter("location")).orElse("");
			String experience = Optional.ofNullable(request.getParameter("experience")).orElse("");
			String offsetvalue = Optional.ofNullable(request.getParameter("paginationOffSet")).orElse("1");
			career.setCandidateId(username);
			career.setJobTitleSearch(jobtittle);
			career.setLocationSearch(location);
			career.setExperienceSearch(experience);
			career.setPaginationOffSet(offsetvalue);
			String loginSucessMessage = (String) request.getSession().getAttribute("loginSucessMessage");
			log.info("====== candidateDashboard ===========");
			WebClientResponse response1 = null;
			String Url = Configs.urls.get(ApplicationConstant.CandiateDashboard).getUrl();
			log.info("@@@@ candiate dashboard " + Url);
			response1 = myWebClient.post(Url, career).block();
			if (response1.getToken() != null) {
				log.info("s.getToken() :" + response1.getToken());
				request.getSession().setAttribute("token", "Bearer " + response1.getToken());
			}
			modelMap.addAttribute("loginSucessMessage", loginSucessMessage);
			request.getSession().removeAttribute("loginSucessMessage");
			if (response1.getStatusCode() == 200) {
				session.setAttribute("candidateId", request.getSession().getAttribute("candidateId"));
				log.info("candidateId ========" + request.getSession().getAttribute("candidateId"));

				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response1.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					session.setAttribute("candidateName", responsemodel.getData().getUserName());
					session.setAttribute("candidateEmail", responsemodel.getData().getCandidateEmail());
					log.info("jobPostingDetails ========" + responsemodel.getData().getJobPostingDetails());
					modelMap.addAttribute("jobPostingDetails", responsemodel.getData().getJobPostingDetails());
					session.setAttribute("profileImage", responsemodel.getData().getBase64ProfileImage());
					int totalpointsint = 0;
					if (responsemodel.getData().getTotalpoints() != null) {
						double totalpoints = Double.valueOf(responsemodel.getData().getTotalpoints());
						totalpointsint = (int) totalpoints;
						session.setAttribute("totalpoints", String.valueOf(totalpointsint));
					}
					int paginationpages = 0;
					paginationpages = Integer.parseInt(responsemodel.getData().getPaginationTotalPages());
					modelMap.addAttribute("totalpages", paginationpages);
					log.info("Total pages are there ==== " + paginationpages);
					modelMap.addAttribute("currentPage", offsetvalue);
					modelMap.addAttribute("cities", responsemodel.getData().getAllCities());
					modelMap.addAttribute("location", location);
					modelMap.addAttribute("experience", experience);
					modelMap.addAttribute("jobTitle", jobtittle);
					modelMap.addAttribute("candidateId", username);
				}
			} else {
				log.info("Error in response in service");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= candidateDashboard =====" + e.getMessage());
			// TODO: handle exception
		}
		return "candidateDashboard";
	}

	@PostMapping("/candidateViewDetails")
	public String candidateDashboardViewDetails(Model model, @ModelAttribute CareerDetails career,
			HttpServletRequest request, HttpSession session) {
		log.info("@@@@ candidateDashboardViewDetails  @@@@@ :");
		WebClientResponse response1 = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.CandidateDashboardViewDetails).getUrl();
			log.info("@@@@ candiate dashboard " + Url);
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			response1 = myWebClient.post(Url, career).block();
			if (response1.getToken() != null) {
				log.info("s.getToken() :" + response1.getToken());
				request.getSession().setAttribute("token", "Bearer " + response1.getToken());
			}
			if (response1.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response1.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("jobPostingDetails", responsemodel.getData().getSinglejobPostViewDetails());
					model.addAttribute("similiarJobs", responsemodel.getData().getJobPostingDetails());
					log.info(" smiliar jobs ===== " + responsemodel.getData().getJobPostingDetails());
					model.addAttribute("id", responsemodel.getData().getSinglejobPostViewDetails().getId());
					model.addAttribute("appliedOrNot", responsemodel.getData().getFlag());
					model.addAttribute("cities", responsemodel.getData().getAllCities());
					model.addAttribute("viewDetailStatus", career.getViewdetailflag());
				}
			} else {
				log.info("Error in Response");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= candidateDashboard =====" + e.getMessage());
			// TODO: handle exception
		}
		return "candidateViewDetails";
	}

	@ResponseBody
	@PostMapping("/appliedJobs")
	public APIErrorModel appliedJob(@ModelAttribute CareerDetails career, HttpSession session,
			HttpServletRequest request) {
		log.info("====== appliedJob   ======");
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			String Url = Configs.urls.get(ApplicationConstant.AppliedJob).getUrl();
			log.info("@@@@ appliedJob " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				return responsemodel.getErrors();

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Error in ==== appliedJobs ====" + e1);
		}
		return null;
	}

	@PostMapping("/myProfile")
	public String myProfile(Model model, HttpSession session, HttpServletRequest request) {

		log.info("@@@@ myProfile  @@@@@ :");
		WebClientResponse response = null;
		try {
			ResponseModel data = new ResponseModel();
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			data.setCandidateId(username);
			String Url = Configs.urls.get(ApplicationConstant.MyProfile).getUrl();
			log.info(" @@@@ myProfile" + Url);
			response = myWebClient.post(Url, data).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("educationDetails", responsemodel.getData().getEducationDetails());
					model.addAttribute("employmentDetails", responsemodel.getData().getEmployeelastWorkedCompany());
					model.addAttribute("skills", responsemodel.getData().getSkills());
					model.addAttribute("personalDetails", responsemodel.getData().getSignup());
					model.addAttribute("careerDetails", responsemodel.getData().getCareerDetails());
					model.addAttribute("preferedLocation", responsemodel.getData().getViewPreferredLocation());
					model.addAttribute("allcities", responsemodel.getData().getCareerDetails().getAllCities());
					model.addAttribute("cities", responsemodel.getData().getCareerDetails().getAllCities());
					model.addAttribute("masterCompany", responsemodel.getData().getCareerDetails().getMasterCompany());
					model.addAttribute("cvDate", responsemodel.getData().getCareerDetails().getCvUploadedDate());
					session.setAttribute("profileImage",
							responsemodel.getData().getCareerDetails().getBase64ProfileImage());

					String dateOfyear = responsemodel.getData().getSignup().getDateofBirth();

					if (responsemodel != null && responsemodel.getData() != null
							&& responsemodel.getData().getSignup() != null
							&& responsemodel.getData().getSignup().getDateofBirth() != null
							&& !"null".equalsIgnoreCase(responsemodel.getData().getSignup().getDateofBirth())) {

						String[] splitdata = dateOfyear.split("-");
						Year startYear = Year.of(Integer.parseInt(splitdata[0]));
						model.addAttribute("newdob", startYear);
						Year resultYear = startYear.plusYears(13);
						String resultYearString = resultYear.toString();
						boolean isActive = responsemodel.getData().getEmployeelastWorkedCompany().stream()
								.anyMatch(ed -> "Active".equalsIgnoreCase(ed.getWorkingStatus()));
						session.setAttribute("year", resultYearString);
						model.addAttribute("workstatus", isActive);

					} else {
						session.setAttribute("year", "1999");
						model.addAttribute("newdob", 1999);
						model.addAttribute("workstatus", false);
					}

					log.info("employmentDetails" + responsemodel.getData().getEmployeelastWorkedCompany());
				}
			} else {
				log.info("Error in Response");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= candidateDashboard =====" + e.getMessage());
			// TODO: handle exception
		}
		return "myProfile";
	}

	@ResponseBody
	@PostMapping("/getEducationDetails")
	public ResponseEntity<?> getEducationDetails(@ModelAttribute EducationDetails education,
			HttpServletRequest request) {
		log.info("====== getEducationDetails   ======");
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.GetEducationByCandidateId).getUrl();
			log.info("getEducationDetails  " + Url);
			response = myWebClient.post(Url, education).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return ResponseEntity.ok(responsemodel);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in Education " + e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/updateCandidateDetails")
	public APIErrorModel updateEducationDetails(@ModelAttribute CareerDetails career, HttpSession session,
			HttpServletRequest request) {
		log.info("====== updateEducationDetails   ======");

		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			String Url = null;
			if (career.getType().equals("education")) {
				Url = Configs.urls.get(ApplicationConstant.UpdateEducationDetails).getUrl();
			} else if (career.getType().equals("personalDetails")) {
				Url = Configs.urls.get(ApplicationConstant.UpdatePersonalDetails).getUrl();
			} else if (career.getType().equals("jobExperience")) {
				Url = Configs.urls.get(ApplicationConstant.Candiate_Employeement_Details).getUrl();
			} else if (career.getType().equals("addSkills")) {
				Url = Configs.urls.get(ApplicationConstant.AddSkills).getUrl();
			} else if (career.getType().equals("UpdateSkills")) {
				Url = Configs.urls.get(ApplicationConstant.UpdateSkills).getUrl();
			} else if (career.getType().equals("updateEmploymentDetails")) {
				Url = Configs.urls.get(ApplicationConstant.UpdateEmploymentDetails).getUrl();
			} else {
				log.info(" ===== service is not there ================");
			}
			log.info("@@@@ updateEducationDetails " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				return responsemodel.getErrors();

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Error in updateCandidateDetails" + e1.getMessage());
		}
		return null;

	}

	@ResponseBody
	@PostMapping("/getTechnologyDetails")
	public ResponseEntity<?> getTechnologyDetails(HttpServletRequest request) {
		log.info("====== getTechnologyDetails   ======");

		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.REGISTER_EXPERIENCE).getUrl();
			log.info("getTechnologyDetails " + Url);
			response = myWebClient.post(Url, null).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					return ResponseEntity.ok(responsemodel);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exception in getTechnologyDetails " + e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/appliedJob")
	public String getAppliedJob(HttpServletRequest request, Model model, HttpSession session) {
		CareerDetails career = new CareerDetails();
		log.info("@@@@ getAppliedJob  @@@@@ :");

		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			String pagenumber = request.getParameter("pageno");
			career.setPaginationOffSet(Optional.ofNullable(pagenumber).map(Object::toString).orElse("1"));
			String Url = Configs.urls.get(ApplicationConstant.GetAppliedJob).getUrl();
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
					model.addAttribute("jobapplied", responsemodel.getData().getJobApplied());
					model.addAttribute("cities", responsemodel.getData().getCareerDetails().getAllCities()); // changed
					session.removeAttribute("profileImage");
					session.setAttribute("profileImage",
							responsemodel.getData().getCareerDetails().getBase64ProfileImage());

				}
				model.addAttribute("totalpages", responsemodel.getData().getCareerDetails().getPaginationTotalPages());
				model.addAttribute("currentPage", career.getPaginationOffSet());
			} else {
				log.info(" Error in Response");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= appliedJob =====" + e.getMessage());
			// TODO: handle exception
		}

		return "appliedJob";
	}

	@GetMapping("/downloadResume")
	public ResponseEntity<byte[]> downloadResume(HttpServletRequest request, HttpServletResponse response1, Model model,
			HttpSession session) {
		CareerDetails career = new CareerDetails();
		log.info("@@@@ downloadResume  @@@@@ :");
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

	@ResponseBody
	@PostMapping("/uploadResume")
	public ResponseEntity<String> updateCv(HttpSession session, HttpServletRequest request,
			@RequestParam("resume_doc") MultipartFile file, @RequestParam(value = "candidateId", required = false) String id) {
		log.info("====== updateCv   ======");

		SignUp signup = new SignUp();
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				username = id;
			}
			signup.setCandidateId(username);
			signup.setFiletype(file.getContentType());
			signup.setResumeName(file.getOriginalFilename());
			byte[] files = file.getBytes();
			signup.setResumefileCV(Base64.encodeBase64String(files));
			String Url = Configs.urls.get(ApplicationConstant.UPDATECV).getUrl();
			log.info("@@@@ updateCv " + Url);
			response = myWebClient.post(Url, signup).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});

			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.info("Exception in downloadResume ===" + e1.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File upload failed.");
		}
		return null;
	}

//	public byte[] compressFile(MultipartFile file) throws Exception{
//		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//        try (GZIPOutputStream gzipOutputStream = new GZIPOutputStream(byteArrayOutputStream);
//            InputStream inputStream = file.getInputStream()) {
//            byte[] buffer = new byte[1024];
//            int len;
//            while ((len = inputStream.read(buffer)) != -1) {
//                gzipOutputStream.write(buffer, 0, len);
//            }
//        }
//        return byteArrayOutputStream.toByteArray();
//	}

	@ResponseBody
	@PostMapping("/updateImage")
	public ResponseEntity<String> updateImage(HttpSession session, HttpServletRequest request,
			@RequestParam("image") MultipartFile file) {
		log.info("====== updateImage   ======");

		SignUp signup = new SignUp();
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			signup.setCandidateId(username);
			byte[] files = file.getBytes();
			signup.setResumefileCV(Base64.encodeBase64String(files));
			String Url = Configs.urls.get(ApplicationConstant.IMAGEUPLOAD).getUrl();
			log.info("@@@@ image upload " + Url);
			response = myWebClient.post(Url, signup).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<CareerDetails> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<CareerDetails>>() {
						});
				return ResponseEntity.ok().body("Image uploaded sucessfully");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			log.error("Exception in updateImage: " + e1.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File upload failed.");
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/updateCarrerDetails")
	public APIErrorModel updateCarrerDetails(CareerDetails career, HttpServletRequest request, HttpSession session) {
		log.info("====== updateCarrerDetails   ======");
		WebClientResponse response = null;
		try {
			String username = null;
			if (session.getAttribute("candidateId") != null) {
				username = session.getAttribute("candidateId").toString();
			} else {
				log.info("Session expired or candidateId is not set.");
			}
			career.setCandidateId(username);
			String Url = Configs.urls.get(ApplicationConstant.UpdateCarrerDetails).getUrl();
			log.info("======= updateCarrerDetails ====== " + Url);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
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
			log.info("Exception in Education " + e.getMessage());
			// TODO: handle exception
		}
		return null;
	}

//    shahrukh
	// Not using anywhere Start
	@GetMapping("/addcandidates")
	public String addcandidates(Model model, HttpSession session, HttpServletRequest request) {

		log.info("@@@@ myProfile  @@@@@ :");

		WebClientResponse response = null;
		try {
			String username = "1";
			String Url = Configs.urls.get(ApplicationConstant.EMPLOYER_ADD_CANDIDATES).getUrl();
			log.info("@@@@ candiate dashboard " + Url);
			response = myWebClient.post(Url, username).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("educationDetails", responsemodel.getData().getEducationDetails());
					log.info("educationDetails ===" + responsemodel.getData().getEducationDetails());
					model.addAttribute("employmentDetails", responsemodel.getData().getEmployeelastWorkedCompany());
					log.info("employeement details ===" + responsemodel.getData().getEmployeelastWorkedCompany());
					model.addAttribute("skills", responsemodel.getData().getSkills());
					model.addAttribute("personalDetails", responsemodel.getData().getSignup());
					model.addAttribute("careerDetails", responsemodel.getData().getCareerDetails());
					model.addAttribute("preferedLocation", responsemodel.getData().getViewPreferredLocation());
					model.addAttribute("allcities", responsemodel.getData().getCareerDetails().getAllCities());
					log.info("careerDetails details ===" + responsemodel.getData().getCareerDetails().getAllCities());
				}
			} else {
				log.info(" Error in Response");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= candidateDashboard =====" + e.getMessage());
			// TODO: handle exception
		}
		return "addCandidates";
	}
//  shahrukh
	// Not using anywhere End

	@PostMapping("employerCandidateprofile")
	public String getCandidateDetails(@RequestParam("candidateId") String candidateId, Model model, HttpSession session,
			HttpServletRequest request) {

		log.info("@@@@ myProfile  @@@@@ :" + candidateId);

		CareerDetails careerDetails = new CareerDetails();
		careerDetails.setCandidateId(candidateId);
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.GET_CANDIDATE_BY_ID).getUrl();
			log.info("@@@@ candiate dashboard " + Url);
			response = myWebClient.post(Url, careerDetails).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				if (responsemodel.getErrors().getErrorCode().equals("0000")) {
					model.addAttribute("educationDetails", responsemodel.getData().getEducationDetails());
					log.info("educationDetails ===" + responsemodel.getData().getEducationDetails());
					model.addAttribute("employmentDetails", responsemodel.getData().getEmployeelastWorkedCompany());
					log.info("employeement details ===" + responsemodel.getData().getEmployeelastWorkedCompany());
					model.addAttribute("skills", responsemodel.getData().getSkills());
					model.addAttribute("personalDetails", responsemodel.getData().getSignup());
					model.addAttribute("careerDetails", responsemodel.getData().getCareerDetails());
					model.addAttribute("preferedLocation", responsemodel.getData().getViewPreferredLocation());
					model.addAttribute("allcities", responsemodel.getData().getCareerDetails().getAllCities());
					log.info("careerDetails details ===" + responsemodel.getData().getCareerDetails());
					return "employerviews/CandidateProfile";
				}
			} else {
				log.info(" Error in Response");

			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("======= candidateDashboard =====" + e.getMessage());
			// TODO: handle exception
			return "error";
		}

		return "error";

	}

	@ResponseBody
	@PostMapping("/deleteSkill")
	public APIErrorModel deleteSkill(@RequestBody CareerDetails careerDetails, HttpServletRequest request) {
		log.info("====== deleteSkill method has been called   ======");

		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.UpdateSkills).getUrl();
			log.info("getEducationDetails  " + Url);
			response = myWebClient.post(Url, careerDetails).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

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
		}
		return null;
	}

	@ResponseBody
	@PostMapping("/deleteEmployement")
	public APIErrorModel deleteEmployement(@RequestBody CareerDetails careerDetails, HttpServletRequest request) {
		log.info("====== deleteEmployement method has been called   ======");

		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.UpdateSkills).getUrl();
			log.info("getEducationDetails  " + Url);
			response = myWebClient.post(Url, careerDetails).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}

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
		}
		return null;
	}
	
	@ResponseBody
	@PostMapping("/fetchFieldDetails")
	public ServiceResponseWrapperModel<ResponseModel> fetchFieldDetails(HttpServletRequest request, HttpSession session) {
		WebClientResponse response = null;
		try {
			ResponseModel responseModel = new ResponseModel();
			String companyId = null;
			if (session.getAttribute("companyId") != null) {
				companyId = session.getAttribute("companyId").toString();
			} else {
				log.info("Session expired or userId  is not set");
			}
			responseModel.setCompanyId(companyId);
			String Url = Configs.urls.get(ApplicationConstant.FETCHFIELDDETAILS).getUrl();
			log.info(" @@@@ myProfile" + Url);
			response = myWebClient.post(Url, responseModel).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				return responsemodel;
				
			} else {
				log.info("Error in Response");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@PostMapping("/recruiterUpdatesCandidate")
	public ServiceResponseWrapperModel<ResponseModel> recruiterUpdatesCandidate(@RequestBody CareerDetails career, HttpServletRequest request, HttpSession session) {
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.RECUITERUPDATESCANDIDATE).getUrl();
			log.info(" @@@@ myProfile" + Url);
			log.info(" @@@@ career" + career);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				return responsemodel;
				
			} else {
				log.info("Error in Response");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@PostMapping("/recruiterAddsCandidate")
	public ServiceResponseWrapperModel<ResponseModel> recruiterAddsCandidate(@RequestBody CareerDetails career, HttpServletRequest request) {
		WebClientResponse response = null;
		try {
			String Url = Configs.urls.get(ApplicationConstant.RECUITERADDSCANDIDATE).getUrl();
			log.info(" @@@@ career" + career);
			response = myWebClient.post(Url, career).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<ResponseModel> responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<ResponseModel>>() {
						});
				return responsemodel;
				
			} else {
				log.info("Error in Response");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
