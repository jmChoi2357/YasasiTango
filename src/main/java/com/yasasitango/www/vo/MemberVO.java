package com.yasasitango.www.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String latestLoginDate;
	private String searchedWord;

}
