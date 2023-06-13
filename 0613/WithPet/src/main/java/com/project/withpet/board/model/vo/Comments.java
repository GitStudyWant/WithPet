package com.project.withpet.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Comments {
	
	private int commentNo;	//NUMBER
	private int boardNo;	//NUMBER
	private String commentWriter;	//VARCHAR2(50 BYTE)
	private String commentText;	//VARCHAR2(4000 BYTE)
	private String commentStatus;	//VARCHAR2(10 BYTE)
	private int commentGroup;	//NUMBER
	private int commentLevel;	//NUMBER
	private Date regDate;	//DATE
}
