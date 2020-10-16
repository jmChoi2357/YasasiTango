package com.yasasitango.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yasashitango.www.mapper.TangoMapper;
import com.yasasitango.www.vo.TangoVO;

@Repository
public class TangoDAO {
	@Autowired
    SqlSession session;

	public TangoVO tangoResultKO(String korean, String langCheck) {
		TangoMapper mapper = session.getMapper(TangoMapper.class);
		TangoVO tango = null;
		System.out.println("언어체크: " + langCheck);
		try {
			if(langCheck.equals("ko")) {
				System.out.println("한글 실행");
				tango = mapper.tangoResultKO(korean);
			}
			else
				 tango = mapper.tangoResultJP(korean);
			System.out.println("탄고: " + tango);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return tango;
	}
}
