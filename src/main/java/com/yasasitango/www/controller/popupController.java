package com.yasasitango.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/popup")
public class popupController {

	
	 @RequestMapping(value="/jlptLevel", method = RequestMethod.GET) 
	 public String jlptLevel() { 
		 
		 return "popup/jlptLevel";
	 }
	 
	
	 
}
