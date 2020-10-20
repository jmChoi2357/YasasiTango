package com.yasasitango.www.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yasasitango.www.dao.TangoDAO;
import com.yasasitango.www.vo.TangoVO;

@Service
public class TangoService {
	@Autowired
	private HttpSession session;
	@Autowired
	TangoDAO dao;
	
	public TangoVO tangoResultKO(String searchWord, String langCheck) {
		TangoVO tango = dao.tangoResultKO(searchWord, langCheck);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id;
		id = (String) session.getAttribute("loginId");
		
			int word_num = tango.getWord_num();
			System.out.println(word_num);
			map.put("id", id);
			map.put("word_num", word_num);
			dao.insertSearched(map);
		return tango;
	}
}
