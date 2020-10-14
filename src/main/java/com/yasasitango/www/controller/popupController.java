package com.yasasitango.www;

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
	 
	 @RequestMapping(value="/wordForm", method = RequestMethod.GET) 
	 public String wordForm() { 
		 
		 return "popup/wordForm";
	 }
	 
}
