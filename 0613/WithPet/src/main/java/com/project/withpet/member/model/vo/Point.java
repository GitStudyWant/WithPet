package com.project.withpet.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Point {
	
	private String memId;
	private String pointCate;
	private String pointCate2;
	private int pointNo;
	private Date pointDate;

}
