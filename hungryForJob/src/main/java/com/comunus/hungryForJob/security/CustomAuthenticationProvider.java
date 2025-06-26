package com.comunus.hungryForJob.security;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.comunus.hungryForJob.config.Configs;
import com.comunus.hungryForJob.constant.ApplicationConstant;
import com.comunus.hungryForJob.model.LoginRequest;
import com.comunus.hungryForJob.model.LoginResponse;

//import com.comunus.hungryForJobs.config.Configs;
//import com.comunus.hungryForJobs.constant.ApplicationConstant;
//import com.comunus.hungryForJobs.model.LoginRequest;
//import com.comunus.hungryForJobs.model.LoginResponse;

//import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	
	@Autowired
	private JwtTokenUtil jwtTokenUtil;
	
	private final HttpServletRequest request;
	
	@Autowired
	HttpSession sessionglobal;
	
	
	 public CustomAuthenticationProvider(HttpServletRequest request) {
         this.request = request;
     }

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		log.info("@@CustomAuthenticationProvider starts@@");
		final String username = authentication.getName();
        final String password = authentication.getCredentials().toString();
        log.info("@@@@username :"+username);
        log.info("@@@@password :"+password);
        if(username==null || password==null) {
        	throw new BadCredentialsException("Invalid username or password");
        }
        LoginRequest loginRequest=new LoginRequest();
        loginRequest.setUsername(username);
        loginRequest.setPassword(password);
        String type=request.getParameter("roletype").toString();
        sessionglobal.setAttribute("roletype",type);
        log.info(" httprequest ===="+type);
        loginRequest.setRoleType(type);
        UsernamePasswordAuthenticationToken authenticatedToken=null;
        try {
		        WebClient webClient = WebClient.create();
		        String loginUrl=Configs.urls.get(ApplicationConstant.LOGIN).getUrl();
		        log.info("@@@@ loginUrl "+loginUrl);
		        ResponseEntity<LoginResponse> responseEntity  = webClient.post().uri(loginUrl).bodyValue(loginRequest).retrieve().toEntity(LoginResponse.class).block();
		        LoginResponse response=responseEntity.getBody();
		        log.info("@@ response @@"+response);
		        log.info(responseEntity.getStatusCode());
		        log.info(response.getData());
		        if(response.getData()!=null && response.getData().get("token")!=null) {
		        	String token=(String)response.getData().get("token");
		        	UserDetailsImpl userPrincipal = jwtTokenUtil.getUserDetailsImplFromJWT(token);
		        	//authenticatedToken=new UsernamePasswordAuthenticationToken(userPrincipal, password);
		        	authenticatedToken=new UsernamePasswordAuthenticationToken(username, password);
		        	SecurityContextHolder.getContext().setAuthentication(authenticatedToken);
		        	ServletRequestAttributes request = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
					HttpSession session = request.getRequest().getSession(true);
					// Store the access and refresh token in the session
					session.setAttribute("token", "Bearer "+token);
					session.setAttribute("roletype", type);
					if(type.equals("candidate"))
					{
						session.setAttribute("candidateName",userPrincipal.getEmail());
						session.setAttribute("candidateId", userPrincipal.getId().toString());
					}
					else if(type.equals("employer"))
					{
						session.setAttribute("companyEmailId",userPrincipal.getEmail());
						session.setAttribute("userId", userPrincipal.getId().toString());
						session.setAttribute("planstatus", (String)response.getData().get("planStatus"));
						session.setAttribute("rolestatus", (String)response.getData().get("rolestatus"));
						session.setAttribute("newemployer", (String)response.getData().get("newemployer"));
						session.setAttribute("companyId", (String)response.getData().get("companyId"));
						
					}else if(type.equals("operations"))
					{
						session.setAttribute("operationemailId",username);
						session.setAttribute("operationId", userPrincipal.getId().toString());
					}
					else
					{
						log.info("session is not set in it ");
					}
					//UserDetailsImpl u = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					log.info("Finally :"+userName);
		        }else {
		        	new Exception("Token not found exception");
		        }
		    	
				
				
        }catch(WebClientResponseException  e) {
        	log.info(e.getStatusCode());
			log.info(e.getMessage());
			log.info(e.getResponseBodyAsString());
			throw new BadCredentialsException("Invalid Credentials");
        }catch(Exception e) {
        	log.info(e.getMessage());
        	throw new BadCredentialsException("Contact system admin");
        }
        log.info("@@CustomAuthenticationProvider ends@@");
		return authenticatedToken;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		 return authentication.equals(UsernamePasswordAuthenticationToken.class);
	} 

}
