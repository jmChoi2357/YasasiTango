package com.yasashitango.www.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.yasasitango.www.vo.TangoVO;

public interface QuizMapper {

	public ArrayList<TangoVO> quiz_random();
	public ArrayList<TangoVO> quiz_level(int word_level);
	public ArrayList<TangoVO> make_question(String kanji);
	public ArrayList<TangoVO> make_question_level(HashMap<String, String> map);
	public int gradeUp(String id);
}
