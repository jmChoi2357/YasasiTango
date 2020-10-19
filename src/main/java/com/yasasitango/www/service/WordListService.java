package com.yasasitango.www.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yasasitango.www.dao.WordListDAO;

@Service
public class WordListService {

	@Autowired
	private WordListDAO dao;
	
	
	public ArrayList<HashMap<String, Object>> seeWordList(int searchWord, String searchType){
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		map.put("searchType", searchType);
		
		ArrayList<HashMap<String, Object>> list = dao.seeWordList(map);
		
		return list;
	}
}

