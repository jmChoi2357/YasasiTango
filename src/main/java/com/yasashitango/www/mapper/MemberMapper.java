package com.yasashitango.www.mapper;

import com.yasasitango.www.vo.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO member);
	public String login(MemberVO member);
	public int updateDate(String id);
}
