package com.project.withpet.cafe.model.vo;

import lombok.Data;

@Data
public class CafePicture {
	
	private int cpNo;
	private int refCafe;
	private String filePath;
	private String originName;
	private String changeName; 
	private int fileLevel;
}
