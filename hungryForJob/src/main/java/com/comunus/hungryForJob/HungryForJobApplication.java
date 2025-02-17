package com.comunus.hungryForJob;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@SpringBootApplication
//@PropertySources({@PropertySource(value = "file:${catalina.base}/hfj.properties",ignoreResourceNotFound = true)})
public class HungryForJobApplication {

	public static void main(String[] args) {
		SpringApplication.run(HungryForJobApplication.class, args);
	}

}
