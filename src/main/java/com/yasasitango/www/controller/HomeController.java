package com.yasasitango.www.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yasasitango.www.service.WordListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private WordListService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/wordList", method = RequestMethod.GET)
	public String wordList() {
		return "wordList";
	}
	
	

	@RequestMapping(value="/seeWordList", method = RequestMethod.GET)
	public String seeWordList(
			 String searchType, 
			@RequestParam(value = "searchWord", defaultValue = "0" ) int searchWord, 
			Model model) {
		
		ArrayList<HashMap<String, Object>> list = service.seeWordList(searchWord, searchType);
		model.addAttribute("list", list);
		 
		
		return "wordList";
	}
	
	@RequestMapping(value="/calender", method = RequestMethod.GET)
	public String calender() {
		return "calender";
	}
}
