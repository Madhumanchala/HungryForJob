package com.comunus.hungryForJob.config;


import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.ClientRequest;
import org.springframework.web.reactive.function.client.ClientResponse;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
/*import org.springframework.web.reactive.function.client.ClientRequest;
import org.springframework.web.reactive.function.client.ClientResponse;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
import org.springframework.web.reactive.function.client.WebClient;*/
import org.springframework.web.reactive.function.client.WebClient;

import com.comunus.hungryForJob.util.EncryptUtil;
//import com.comunus.hungryForJobs.util.EncryptUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

//import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
//import reactor.core.publisher.Mono;
import reactor.core.publisher.Mono;

@Component
@Log4j2
public class WebClientConfig {

    private final WebClient webClient;
    
    @Autowired
    HttpServletRequest httpServletRequest;
    
    @Autowired
    HttpSession session;
    
    @Autowired
    private EncryptUtil encryptUtil;

    
	private static final Charset DEFAULT_CHARSET = Charset.forName(StandardCharsets.UTF_8.name());
	private static final String SECUREHEADERKEY = "securepayload";
    
	@Autowired
    public WebClientConfig(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder
                .filter(ExchangeFilterFunction.ofRequestProcessor(this::encryptRequest))
                .filter(ExchangeFilterFunction.ofResponseProcessor(this::decryptResponse))
                .build();
    }
    
    

	public Mono<WebClientResponse> get(String uri) {
        return webClient.get()
                .uri(uri)
                .exchangeToMono(this::handleResponse);
    }

    
    private Mono<ClientRequest> encryptRequest(ClientRequest request) {
        // Encrypt the request here if needed
        return Mono.just(request);
    }

    private Mono<ClientResponse> decryptResponse(ClientResponse response) {
        // Decrypt the response here if needed
        return Mono.just(response);
    }
    public Mono<WebClientResponse> post(String uri, Object body) throws JsonProcessingException {
       	log.info(body);
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("domainName", httpServletRequest.getHeader("host").split(":")[0]);
		headers.add("Authorization", (String) httpServletRequest.getSession().getAttribute("token"));
		log.info("TOKENNNNNNNNNNNNN HERE "+(String) httpServletRequest.getSession().getAttribute("token"));
		headers.add("securepayload", "true");
		headers.add("roletype", session.getAttribute("roletype")!=null?session.getAttribute("roletype").toString():null);
		log.info("request headers ::"+headers);
		RequestWrapper r = new RequestWrapper(encryptUtil.encryptRequest(new ObjectMapper().writeValueAsString(body).getBytes()));
		log.info(r);
		Mono<WebClientResponse> re =webClient.post()
                .uri(uri)	
                .headers(h -> h.addAll(headers))
                .body(Mono.just(r), Object.class)
                .exchangeToMono(this::handleResponse); 
	    return re;
    }

    // Add other methods for PUT, DELETE, etc. as needed

//    private Mono<MyResponse> handleResponse(ClientResponse clientResponse) {
//        return clientResponse.toEntity(String.class)
//                .flatMap(entity -> Mono.just(new MyResponse(clientResponse.statusCode().value(), entity.getBody())))
//                .switchIfEmpty(Mono.just(new MyResponse(clientResponse.statusCode().value(), "")));
//    }
    private Mono<WebClientResponse> handleResponse(ClientResponse clientResponse) {
        if (clientResponse.statusCode().is4xxClientError() || clientResponse.statusCode().is5xxServerError()) {
            return clientResponse.bodyToMono(String.class)
                    .flatMap(body -> Mono.just(new WebClientResponse(clientResponse.statusCode().value(), body,null)));
        } else {
        	
        	log.info("@@@@ Response Headers :"+clientResponse.headers().asHttpHeaders());
        	HttpHeaders resHeaders = clientResponse.headers().asHttpHeaders();
        	final String token= (resHeaders.get("auth")!=null && resHeaders.get("auth").size()>0)?resHeaders.get("auth").get(0):null;
        	log.info(clientResponse.toEntity(String.class));
            return clientResponse.toEntity(String.class)
            		.flatMap(entity -> Mono.just(new WebClientResponse(clientResponse.statusCode().value(),encryptUtil.decryptResponse(new JSONObject(entity.getBody()).getString("data")),token)));
//                    .flatMap(entity -> Mono.just(new WebClientResponse(clientResponse.statusCode().value(),decrypt(entity.getBody()))));
        }
    }
    
    
   

   
	
}
