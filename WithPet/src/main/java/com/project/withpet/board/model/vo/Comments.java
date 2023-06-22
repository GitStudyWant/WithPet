package com.project.withpet.board.model.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
	private Timestamp regDate;	//Timestamp
	

	
}
