package com.yasasitango.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yasashitango.www.mapper.QuizMapper;
import com.yasasitango.www.vo.TangoVO;

@Repository
public class QuizDAO {
	@Autowired
	SqlSession session;
	
	public ArrayList<TangoVO> quiz_random(){
		QuizMapper mapper = session.getMapper(QuizMapper.class);
		ArrayList<TangoVO> list = null;
		try {
			list = mapper.quiz_random();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<TangoVO> make_question(String kanji){
		QuizMapper mapper = session.getMapper(QuizMapper.class);
		ArrayList<TangoVO> list = null;
		try {
			list = mapper.make_question(kanji);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

}
