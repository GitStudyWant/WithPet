package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AllChatting {

	private String memberId; // MEMBER_ID
	private String chatContent; //CHAT_CONTENT
	private Date chatTime; //CHAT_TIME
	
}
