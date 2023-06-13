package com.project.withpet.admin.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Search{
	
	private String searchKeyword;
	private Date searchDate;

}
