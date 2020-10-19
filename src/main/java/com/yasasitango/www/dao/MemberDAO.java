package com.yasasitango.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yasashitango.www.mapper.MemberMapper;
import com.yasasitango.www.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;
	
	public int insertMember(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.insertMember(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public String login(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		String loginId = null;
		try {
			loginId = mapper.login(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return loginId;
	}
	
	public int updateDate(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
        int cnt = 0;
		
		try {
			cnt = mapper.updateDate(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
