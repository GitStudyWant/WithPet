package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OneChatting {

	private String memberId; //MEMBER_ID
	private String oneChatContent; //ONECHAT_CONTENT
	private Date oneChatTime; //ONECHAT_TIME
	
	private String memberOne; //MEMBER_ONE
	private String memberTwo; //MEMBER_TWO
	private int oneChatNo;  //ONECHAT_NO
	private Date oneLast; //ONE_LAST
	private Date twoLast; //TWO_LAST
	public OneChatting(String memberOne, String memberTwo) {
		super();
		this.memberOne = memberOne;
		this.memberTwo = memberTwo;
	}
	public OneChatting(String memberId, String oneChatContent, Date oneChatTime, String memberOne, String memberTwo,
			int oneChatNo, Date oneLast, Date twoLast) {
		super();
		this.memberId = memberId;
		this.oneChatContent = oneChatContent;
		this.oneChatTime = oneChatTime;
		this.memberOne = memberOne;
		this.memberTwo = memberTwo;
		this.oneChatNo = oneChatNo;
		this.oneLast = oneLast;
		this.twoLast = twoLast;
	}
	public OneChatting() {
		super();
	}
	
	
}
