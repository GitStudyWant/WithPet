package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Memo {
	private int memoNo;
	private String memoSender;
	private String memoReceiver;
	private String memoTitle;
	private String memoContent;
	private Date memoDate;
	private Date memoDate2;
	private String memoCheck;
	private String memoStatus;

}
