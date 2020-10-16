package com.yasashitango.www.mapper;

import java.util.HashMap;

import com.yasasitango.www.vo.TangoVO;

public interface TangoMapper {

	public TangoVO tangoResultKO(String korean);
	public TangoVO tangoResultJP(String korean);
	public int insertSearched(HashMap<String, String> map);
}
