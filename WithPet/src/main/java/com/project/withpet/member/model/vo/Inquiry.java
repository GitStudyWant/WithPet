package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Inquiry {
	private String memberId;//MEM_ID
	private int inquiryNo; //INQUIRY_NO
	private String inquiryTitle; //INQUIRY_TITLE
	private String inquiryContent; //INQUIRY_CONTENT
	private Date inquiryCreateDate; //INQUIRY_CREATEDATE
	private String inquiryStatus; //INQUIRY_STATUS
	private String inquiryAnswer; //INQUIRY_ANSWER
	
	public Inquiry(String memberId, int inquiryNo) {
		super();
		this.memberId = memberId;
		this.inquiryNo = inquiryNo;
	}

	public Inquiry() {
		super();
	}

	
	
	
	
	
}

