package com.myessay.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myessay.config.Config;

@Controller
@RequestMapping("/app/config")
public class HelloController {
	
	@Autowired
	Config config;

	@RequestMapping(method = RequestMethod.GET, value = "/superuserid")
	@ResponseBody
	public String getSuperuserid(){
		return String.valueOf(config.getSuperid());
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/superuserpwd")
	@ResponseBody
	public String getSuperuserPwd(){
		return config.getSuperPassword();
	}
}
