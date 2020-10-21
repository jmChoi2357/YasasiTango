package com.yasasitango.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<TangoVO> quiz_level(int level){
		System.out.println("현재 레벨: " + level);
		QuizMapper mapper = session.getMapper(QuizMapper.class);
		ArrayList<TangoVO> list = null;
		try {
			list = mapper.quiz_level(level);
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
	
	public ArrayList<TangoVO> make_question_level(HashMap<String, String> map){
		QuizMapper mapper = session.getMapper(QuizMapper.class);
		ArrayList<TangoVO> list = null;
		try {
			list = mapper.make_question_level(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int gradeUp(String id) {
		QuizMapper mapper = session.getMapper(QuizMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.gradeUp(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
