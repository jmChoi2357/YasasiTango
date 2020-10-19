package com.yasasitango.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WordListDAO {

	@Autowired
	public SqlSession session;
	
	public ArrayList<HashMap<String, Object>> seeWordList(HashMap<String, Object> map){
		WordListMapper mapper = session.getMapper(WordListMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
		
			list = mapper.seeWordList(map);
			System.out.println(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		
		
		return list;
	}
}
