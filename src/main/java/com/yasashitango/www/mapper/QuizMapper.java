package com.yasashitango.www.mapper;

import java.util.ArrayList;

import com.yasasitango.www.vo.TangoVO;

public interface QuizMapper {

	public ArrayList<TangoVO> quiz_random();
	public ArrayList<TangoVO> make_question(String kanji);
}
