package com.comunus.hungryForJob.security;

import java.security.Key;
import java.util.Date;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class JwtTokenUtil {

	  @Value("${jwt.token.secret}")
	  private String jwtSecret;

	  @Value("${jwt.token.validity}")
	  private int jwtExpirationMs;

	  public String generateJwtToken(Authentication authentication) throws JsonProcessingException {

	    UserDetailsImpl userPrincipal = (UserDetailsImpl) authentication.getPrincipal();
	    ObjectMapper mapper = new ObjectMapper();
	    String subject=mapper.writeValueAsString(userPrincipal);
	    return Jwts.builder()
	        .setSubject(subject)
	        .setIssuedAt(new Date())
	        .setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
	        .signWith(key(), SignatureAlgorithm.HS512)
	        .compact();
	  }
	  
	  private Key key() {
	    return Keys.hmacShaKeyFor(Decoders.BASE64.decode(jwtSecret));
	  }

	  public String getUserNameFromJwtToken(String token) {
	    return Jwts.parserBuilder().setSigningKey(key()).build()
	               .parseClaimsJws(token).getBody().getSubject();
	  }

	  public boolean validateJwtToken(String authToken) {
		try {
	      Jwts.parserBuilder().setSigningKey(key()).build().parse(authToken);
	      return true;
	    } catch (MalformedJwtException e) {
	      log.error("Invalid JWT token:"+ e.getMessage());
	    } catch (ExpiredJwtException e) {
	    	log.error("JWT token is expired: " +e.getMessage());
	    } catch (UnsupportedJwtException e) {
	    	log.error("JWT token is unsupported:"+ e.getMessage());
	    } catch (IllegalArgumentException e) {
	    	log.error("JWT claims string is empty: "+ e.getMessage());
	    }
	    return false;
	  }
	  
	  public UserDetailsImpl getUserDetailsImplFromJWT(String token) throws JsonMappingException, JsonProcessingException {
		    String subject=Jwts.parserBuilder().setSigningKey(key()).build().parseClaimsJws(token).getBody().getSubject();
			ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);;
			log.info(subject);
			JSONObject obj = new JSONObject(subject);
			UserDetailsImpl userDetailsImpl = mapper.readValue(obj.toString(), UserDetailsImpl.class);
			return userDetailsImpl;
		}
	}