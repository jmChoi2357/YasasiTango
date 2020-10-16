package com.yasasitango.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yasasitango.www.dao.TangoDAO;
import com.yasasitango.www.vo.TangoVO;

@Service
public class TangoService {

	@Autowired
	TangoDAO dao;
	
	public TangoVO tangoResultKO(String korean) {
		TangoVO tango = dao.tangoResultKO(korean);
		return tango;
	}
}
