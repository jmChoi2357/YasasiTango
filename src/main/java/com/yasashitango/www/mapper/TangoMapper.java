package com.yasashitango.www.mapper;

import java.util.HashMap;

import com.yasasitango.www.vo.TangoVO;

public interface TangoMapper {

	public TangoVO tangoResultKO(String searchWord);
	public TangoVO tangoResultJP(String searchWord);
	public int insertSearched(HashMap<String, Object> map);
}
