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

	public TangoVO tangoResultKO(String korean) {
		TangoMapper mapper = session.getMapper(TangoMapper.class);
		TangoVO tango = null;
		try {
			tango = mapper.tangoResultKO(korean);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return tango;
	}
}
