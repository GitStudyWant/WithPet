package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private String memId;
	private String memNick;
	private String memPwd;
	private int memPhone;
	private String memEmail;
	private String memPhoto;
	private String memPath;
	private String memIntro;
	private String memGrade;
	private Date memDate;
	private int memMemo;
	private int memPoint;
	private int memReport;
	private String memStaus;
	private String memUpdate;
	private String memKakaoId;

}
