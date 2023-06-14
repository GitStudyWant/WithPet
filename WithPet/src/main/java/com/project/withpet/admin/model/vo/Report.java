package com.project.withpet.admin.model.vo;

import lombok.Data;

@Data
public class Report {
	private int reportNo;
	private String reportSender;
	private String reportReceiver;
	private String reportDate;
	private String reportContent;
	private String reportStatus;
	private int boardNo;
	private int commentNo;
}
