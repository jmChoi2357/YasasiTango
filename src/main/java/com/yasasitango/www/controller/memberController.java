package com.yasasitango.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/member")
public class memberController {
	
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String  joinForm() {
		return "/member/joinForm";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(String id, String pw, String name) {
		
		return "redirect:/";
	}
}
