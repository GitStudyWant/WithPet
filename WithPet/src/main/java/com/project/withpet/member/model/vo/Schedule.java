package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Schedule {

	private String memId;
	private int scheduleNo;
	private String scheduleCate;
	private Date scheduleStart;
	private Date scheduleEnd;
	private Date scheduleDate;
	
}
