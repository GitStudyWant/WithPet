package com.project.withpet.trip.model.vo;

import lombok.Data;

@Data
public class CarReservation {
	
	private String carRno;
	private int trNo;
	private String startDate;
	private String endDate;
	private String status;
	private String memId;
	private String trPaymentNo;
	private String trPaymentDate;
	private String trCardNo;
	private String trType2;
	private int trFee;
	
}
