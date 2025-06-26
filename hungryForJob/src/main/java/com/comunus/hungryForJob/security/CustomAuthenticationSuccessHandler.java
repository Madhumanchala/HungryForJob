package com.comunus.hungryForJob.security;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        //after successful login put username into session
    	final String username = authentication.getName();
    	HttpSession session= request.getSession();
    	session.setAttribute("username", username);
    	//set login message
    	session.setAttribute("loginSucessMessage", "Successfully logged in !!");
    	String roleType=session.getAttribute("roletype")!=null?session.getAttribute("roletype").toString():null;
    	String rolestatus=session.getAttribute("rolestatus")!=null?session.getAttribute("rolestatus").toString():null;
    	String planstatus=session.getAttribute("planstatus")!=null?session.getAttribute("planstatus").toString():null;
    	String newemployer = session.getAttribute("newemployer")!=null?session.getAttribute("newemployer").toString():null;
//    	response.sendRedirect("candidateDashboard");
    	
    	
    	if(roleType.equals("employer"))
    	{
    		if(rolestatus.equals("admin"))
    		{
    			if(planstatus.equals("1"))
    			{
//    				System.out.println("role ========= "+roleType);
            		RequestDispatcher rd=request.getRequestDispatcher("companydashboard");
                	rd.forward(request, response);
    			}else
    			{
//    				System.out.println("role ========= "+roleType);
            		RequestDispatcher rd=request.getRequestDispatcher("pricing-plan");
                	rd.forward(request, response);
    			}
    			
    		}else if(rolestatus.equals("employeradmin"))
    		{
    			if(planstatus.equals("1"))
    			{
            		RequestDispatcher rd=request.getRequestDispatcher("companydashboard");
                	rd.forward(request, response);
    			}else
    			{
            		RequestDispatcher rd=request.getRequestDispatcher("pricing-plan");
                	rd.forward(request, response);
    			}
    		}
    		else if(rolestatus.equals("user"))
    		{
    			if(planstatus.equals("1"))
    			{
//    				System.out.println("role ========= "+roleType);
    				if(newemployer.equals("1"))
    				{
    					RequestDispatcher rd=request.getRequestDispatcher("resetpassword");
                    	rd.forward(request, response);
                    	
    				}else
    				{
    					RequestDispatcher rd=request.getRequestDispatcher("searchCandidates");
                    	rd.forward(request, response);
    				}
            		
    			}else
    			{
//    				System.out.println("role ========= "+roleType);
            		RequestDispatcher rd=request.getRequestDispatcher("employerlogin");
                	rd.forward(request, response);
    			}
    		}
    		else
    		{
//    			System.out.println("role ========= "+roleType);
				
				  RequestDispatcher rd=request.getRequestDispatcher("employerlogin");
				  rd.forward(request, response);
				 
    		}
    		
    	}
    	if(roleType.equals("candidate"))
    	{
    		RequestDispatcher rd=request.getRequestDispatcher("candidateDashboard");
        	rd.forward(request, response);
    	}
    	if(roleType.equals("operations"))
		{
			 RequestDispatcher rd=request.getRequestDispatcher("admindashboard");
			  rd.forward(request, response);
		}
    	
    }


}
