package com.project.withpet.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Memo {
	private int memoNo;
	private String memoSender;
	private String memoReceiver;
	private String memoTitle;
	private String memoContent;
	private String memoSendDate;
	private String memoCheckDate;
	private String memoReserveDate;
	private String memoCheck;
	private String memoSenderStatus;
	private String memoReceiverStatus;

}
