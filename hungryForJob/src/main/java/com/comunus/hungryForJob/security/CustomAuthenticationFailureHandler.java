package com.comunus.hungryForJob.security;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Log4j2
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
    	log.info("@@@@ CustomAuthenticationFailureHandler Starts @@@@");
    	log.info("exception :"+exception.getMessage());
        RequestDispatcher dispatcher=request.getRequestDispatcher("loginError");
        request.setAttribute("loginErrorMessage",exception.getMessage());
        log.info("@@@@ CustomAuthenticationFailureHandler Ends @@@@");
        dispatcher.forward(request, response);
    }
}
