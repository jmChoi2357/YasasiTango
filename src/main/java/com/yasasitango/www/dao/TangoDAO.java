package com.yasasitango.www.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yasashitango.www.mapper.TangoMapper;
import com.yasasitango.www.vo.TangoVO;

@Repository
public class TangoDAO {
	@Autowired
    SqlSession session;

	public TangoVO tangoResultKO(String searchWord, String langCheck) {
		TangoMapper mapper = session.getMapper(TangoMapper.class);
		TangoVO tango = null;
		System.out.println("언어체크: " + langCheck);
		try {
			if(langCheck.equals("ko")) {
				tango = mapper.tangoResultKO(searchWord);
			}
			else
				 tango = mapper.tangoResultJP(searchWord);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return tango;
	}
	
	public int insertSearched(HashMap<String, Object> map) {
		TangoMapper mapper = session.getMapper(TangoMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.insertSearched(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}