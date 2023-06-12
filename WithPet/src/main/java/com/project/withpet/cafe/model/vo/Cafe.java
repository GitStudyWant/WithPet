package com.project.withpet.cafe.model.vo;

import lombok.Data;

@Data
public class Cafe {
	
	private int cafeNo;
	private String cafeTitle;
	private String cafeContent;
	private String cafeAddress;
	private String cafeService;
	private String originName;
	private String changeName;
	private String lat;
	private String lng;
	private String cafeStatus;
}
