package com.yasasitango.www.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yasasitango.www.dao.MemberDAO;
import com.yasasitango.www.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	@Autowired
	HttpSession session;
	
	public int insertMember(MemberVO member) {
	    int cnt = dao.insertMember(member);
	    return cnt;
	}
	
	public String login(MemberVO member) {
		String loginId = dao.login(member);
		session.setAttribute("loginId", loginId);
		
		int cnt = dao.updateDate(loginId);
		
		return loginId;
	}
	
	public int findLevel() {
		String id = (String) session.getAttribute("loginId");
		int jlpt_level = dao.findLevel(id);
		return jlpt_level;
	}
	
	public void logout() {
		session.removeAttribute("loginId");
	}
}
