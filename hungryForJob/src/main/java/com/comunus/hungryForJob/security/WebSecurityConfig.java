package com.comunus.hungryForJob.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	
	    @Autowired
	    private CustomAuthenticationProvider authProvider;

	    @Bean
	    public AuthenticationManager authManager(HttpSecurity http) throws Exception {
	        AuthenticationManagerBuilder authenticationManagerBuilder = 
	            http.getSharedObject(AuthenticationManagerBuilder.class);
;	        authenticationManagerBuilder.authenticationProvider(authProvider);
	        return authenticationManagerBuilder.build();
	    }
	    
	    @Bean
	    WebSecurityCustomizer configureWebSecurity() {
	        return (web) -> web.ignoring().antMatchers("/img/**", "/css/**", "/js/**","/plugins/**","/images/**", "/fonts/**","/WEB-INF/views/**","/employer/**","/candidatecss/**","/admin/**");
	    }

	    @Bean
	    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	    	http
			.authorizeHttpRequests((authorize) -> authorize
					.antMatchers("/login/**").permitAll()
					.antMatchers("/login").permitAll()
					.antMatchers("/forgotPassVerifyEmail").permitAll()
					.antMatchers("/forgotPassVerifyOtp").permitAll()
					.antMatchers("/forgotPassChangePassword").permitAll()
					.antMatchers("/verifyEmail").permitAll()
					.antMatchers("/ExistedEmail").permitAll()
					.antMatchers("/ValidateOtp").permitAll()
					.antMatchers("/portalRegister").permitAll()
					.antMatchers("/candiateRegister").permitAll()
					.antMatchers("/registerExperience").permitAll()
					.antMatchers("/getCity").permitAll()
					.antMatchers("/candiateExperienceRegistered").permitAll()
					.antMatchers("/saveEmployeementDetails").permitAll()
					.antMatchers("/education").permitAll()
					.antMatchers("/getCourseDetails").permitAll()
					.antMatchers("/saveEducationDetails").permitAll()
					.antMatchers("/lastStep").permitAll()
					.antMatchers("/saveLastStep").permitAll()
					.antMatchers("/getPoastalCode").permitAll()
					.antMatchers("/getEmploymentDetails").permitAll()
					.antMatchers("/saveEmployer").permitAll()
					.antMatchers("/EmployerValidateOtp").permitAll()
					.antMatchers("/SaveCompanydetails").permitAll()
					.antMatchers("/industrylist").permitAll()
					.antMatchers("/save-industry").permitAll()
					.antMatchers("/searchjavac").permitAll()
					.antMatchers("/search").permitAll()
					.antMatchers("/index").permitAll()
					.antMatchers("/").permitAll()
					.antMatchers("/*").permitAll()
					.antMatchers("/searchedJob").permitAll()
					.antMatchers("/fetchSkillsFramework").permitAll()
					.antMatchers("/fetchCompanyDetails").permitAll()
					.antMatchers("/addNewCompany").permitAll()
					.antMatchers("/employerlogin").permitAll()
					.antMatchers("/getCandidateById").permitAll()
					.antMatchers("/empportalRegister").permitAll()
					.antMatchers("/logout").permitAll()
					.antMatchers("/resendotpcandidate").permitAll()
					
//					.antMatchers("/admindashboard").permitAll()
//					.antMatchers("/updatePlanStatus").permitAll()
//					.antMatchers("/adminpricingplandetails").permitAll()
//					.antMatchers("/registerplanDetails").permitAll()
//					.antMatchers("/updateplanpriority").permitAll()
//					.antMatchers("/updateadminplandetails").permitAll()
					
					.anyRequest().authenticated()
			)
			.csrf(csrf->csrf.disable())
			.httpBasic(Customizer.withDefaults())
			.formLogin((formLogin) ->
			        formLogin
			        .failureHandler(customAuthenticationFailureHandler())
			        .successHandler(customAuthenticationSuccessHandler())
			        .usernameParameter("username")
			        .passwordParameter("password")
			        .loginPage("/login")
			        //.failureUrl("/login?failed=true")
			        );
	        return http.build();
	   }
	    
	    @Bean
	    public CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler() {
	        return new CustomAuthenticationSuccessHandler();
	    }
	    
	    @Bean
	    public AuthenticationFailureHandler customAuthenticationFailureHandler() {
	        return new CustomAuthenticationFailureHandler();
	    }
	    

}
