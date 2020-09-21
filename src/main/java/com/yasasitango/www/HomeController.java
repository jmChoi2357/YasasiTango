package com.yasasitango.www;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	public String seeWordList(String type, Model model) {
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = new HashMap<String, String>() ; // ArrayList<HashMap> 형태로 데이터베이스나, api에서 받아온다. 
		map.put("date", "2020-09-16");
		map.put("level", "JLPT2");
		map.put("hiragana", "かんじ");
		map.put("kanji", "漢字");
		map.put("lisetning", "음성듣기");
		map.put("example", "1+1=?");
		
		HashMap<String, String> map2 = new HashMap<String, String>(); // ArrayList<HashMap> 형태로 데이터베이스나, api에서 받아온다. 
		map2.put("date", "2020-09-16");
		map2.put("level", "JLPT3");
		map2.put("hiragana", "きほん");
		map2.put("kanji", "基本");
		map2.put("lisetning", "음성듣기");
		map2.put("example", "2+1=?");
		
		list.add(map);
		list.add(map2);
		
		model.addAttribute("list", list);
		
		return "wordList";
	}
	
	@RequestMapping(value="/calender", method = RequestMethod.GET)
	public String calender() {
		return "calender";
	}
}
