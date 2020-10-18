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
	
	public TangoVO tangoResultKO(String korean, String langCheck) {
		TangoVO tango = dao.tangoResultKO(korean, langCheck);
		HashMap<String, String> map = new HashMap<String, String>();
		String id;
		id = (String) session.getAttribute("loginId");
		map.put("id", id);
		map.put("kanji", tango.getKanji());
		if(id != null) dao.insertSearched(map);
		return tango;
	}
}
