package com.comunus.hungryForJob.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.comunus.hungryForJob.model.MasterUrl;

import lombok.extern.log4j.Log4j2;

@Configuration
@Log4j2
public class Configs {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public static HashMap<String, MasterUrl> urls;
	
	@PostConstruct
	public void init() throws Exception {
		refresh();
	}
	
	public void refresh() throws Exception {
		log.info("@@@@@ LOADING URLS FROM MASTER URLS@@@@@");	
		try {
			List<Map<String, Object>> data= jdbcTemplate.queryForList("SELECT * FROM master_url");
			if(data!=null) {
				log.info("@@ urlMasterList @@"+data.size());
				urls=new HashMap<>();
				data.stream().forEach(ob->{
					MasterUrl masterUrl=new MasterUrl();
					masterUrl.setId(ob.get("id")!=null ? (Integer)ob.get("id"):null);
					masterUrl.setName(ob.get("name")!=null ? (String)ob.get("name"):null);
					masterUrl.setTimeOut(ob.get("time_out")!=null ? (String)ob.get("time_out"):null);
					masterUrl.setUrl(ob.get("url")!=null ? (String)ob.get("url"):null);
					urls.put(masterUrl.getName(),masterUrl);
				});
			}
		}catch(EmptyResultDataAccessException e) {
			log.error(e.getMessage());
			throw new Exception("No URLS mapped in master_url table.");
		} 
		catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
	}	
}
