package com.project.withpet.trip.model.vo;

import lombok.Data;

@Data
public class Transportation {
	
	private int trNo;
	private String trType1;
	private String trType2;
	private String trOriginName;
	private String trChangeName;
	private int trFee;

}
