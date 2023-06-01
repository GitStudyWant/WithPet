package com.project.withpet.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardAttachment {
	
	private int fileNo;	//NUMBER
	private int refBno;	//NUMBER
	private int refAno;	//NUMBER
	private String originName;	//VARCHAR2(255 BYTE)
	private String changeName;	//VARCHAR2(255 BYTE)
	private String filePath;	//VARCHAR2(1000 BYTE)
	private Date updateDate;	//DATE
	private int fileLeveL;	//NUMBER
}
