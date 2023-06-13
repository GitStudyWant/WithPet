package com.project.withpet.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule {

	private String memId;
	private int scheduleNo;
	private String scheduleCate;
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleContent;
	private String scheduleColor;
	private Date scheduleDate;
	
}
