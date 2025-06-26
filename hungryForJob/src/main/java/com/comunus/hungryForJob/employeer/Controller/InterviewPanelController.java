package com.comunus.hungryForJob.employeer.Controller;

import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.config.ObjectMapperConfig;
import com.comunus.hungryForJob.config.WebClientConfig;
import com.comunus.hungryForJob.config.WebClientResponse;
import com.comunus.hungryForJob.constant.EmployeerAppplicationConstant;
import com.comunus.hungryForJob.employeer.Model.SearchResp;
import com.comunus.hungryForJob.employeer.Model.companyProfiledetails;
import com.comunus.hungryForJob.model.ServiceResponseWrapperModel;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class InterviewPanelController {

	@Autowired
	WebClientConfig myWebClient;

	ObjectMapperConfig config;

	@Autowired
	private ObjectMapper objectMapper;

	@RequestMapping(value = "/interviewPanel", method = { RequestMethod.POST })
	public String registerCompany(Model model, HttpServletRequest request, HttpSession session)
			throws RestClientException, JsonProcessingException, URISyntaxException {

		WebClientResponse response = null;
		try {

			String userId = null;
			String companyId = null;
			if (session.getAttribute("userId") != null) {
				userId = session.getAttribute("userId").toString();
			} else {
				log.info("Session expired or userId  is not set");
			}
			if (session.getAttribute("companyId") != null) {
				companyId = session.getAttribute("companyId").toString();
			} else {
				log.info("Session expired or userId  is not set");
			}
			companyProfiledetails companyprofiledetails = new companyProfiledetails();
			companyprofiledetails.setUserId(userId);
			companyprofiledetails.setCompanyId(companyId);
			String url = Configs.urls.get(EmployeerAppplicationConstant.INTERVIEWERDETAILS).getUrl();
			response = myWebClient.post(url, companyprofiledetails).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				ServiceResponseWrapperModel<List<companyProfiledetails>> responsemodel = objectMapper.readValue(
						response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<List<companyProfiledetails>>>() {
						});
				model.addAttribute("interviewDetails", responsemodel.getData());
			} else {
				log.info("Error in Response or service is not called");
			}
		} catch (Exception e) {
			// TODO: handle exception;
			e.printStackTrace();
		}

		return "employerviews/interviewpanel";
	}

	@PostMapping("/addNewInterviewer")
	@ResponseBody
	public ServiceResponseWrapperModel<SearchResp> addNewInterviewer(
			@RequestBody companyProfiledetails interviewerDetails, HttpServletRequest request, HttpSession session) {
		WebClientResponse response = null;
		ServiceResponseWrapperModel<SearchResp> responsemodel = null;

		if (session.getAttribute("userId") != null) {
			String userId = session.getAttribute("userId").toString();
			interviewerDetails.setUserId(userId);
		} else {
			log.info("Session expired or userId is not set.");
		}
		if (session.getAttribute("companyId") != null) {
			String companyId = session.getAttribute("companyId").toString();
			interviewerDetails.setCompanyId(companyId);
		} else {
			log.info("Session expired or userId  is not set");
		}

		try {
			String Url = Configs.urls.get(EmployeerAppplicationConstant.INTERVIEWER_PANEL).getUrl();
			response = myWebClient.post(Url, interviewerDetails).block();
			if (response.getToken() != null) {
				log.info("s.getToken() :" + response.getToken());
				request.getSession().setAttribute("token", "Bearer " + response.getToken());
			}
			if (response.getStatusCode() == 200) {
				responsemodel = objectMapper.readValue(response.getBody(),
						new TypeReference<ServiceResponseWrapperModel<SearchResp>>() {
						});
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info("Exeception is occurred in createFolder" + e.getMessage());
			// TODO: handle exception
		}
		return responsemodel;
	}

}
