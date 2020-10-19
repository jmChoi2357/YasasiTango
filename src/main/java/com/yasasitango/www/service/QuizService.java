package com.yasasitango.www.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yasasitango.www.dao.QuizDAO;
import com.yasasitango.www.vo.TangoVO;

@Service
public class QuizService {
	
	@Autowired
	QuizDAO dao;
	@Autowired
	HttpSession session;

	public ArrayList<TangoVO> quiz_random(){
		ArrayList<TangoVO> list = dao.quiz_random();
		return list;
	}
	
	public ArrayList<TangoVO> quiz_level(int level){
		ArrayList<TangoVO> list = dao.quiz_level(level);
		return list;
	}
	
	public ArrayList<TangoVO> make_question(String kanji){
		ArrayList<TangoVO> list = dao.make_question(kanji);
		return list;
	}
	
	public ArrayList<TangoVO> make_question_level(HashMap<String, String> map) {
		ArrayList<TangoVO> list = dao.make_question_level(map);
		return list;
	}
}
