package com.yasasitango.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yasasitango.www.service.MemberService;
import com.yasasitango.www.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class memberController {
	
	@Autowired
	MemberService service;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String  joinForm() {
		return "/member/joinForm";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String  login(MemberVO member) {
		String loginSuccess = service.login(member);
		System.out.println("현재 로그인ID: "  + loginSuccess);
		System.out.println("세션 로그인ID: "  + session.getAttribute("loginId"));
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout() {
		service.logout();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(MemberVO member) {
		System.out.println("멤버: " + member);
		int cnt = service.insertMember(member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/quizMain", method = RequestMethod.GET)
	public String quizMain(Model model) {
		int level = service.findLevel();
		model.addAttribute("level", level);
		return "/quiz/quizMain";
	}
}
