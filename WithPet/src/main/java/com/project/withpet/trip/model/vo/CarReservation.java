package com.project.withpet.trip.model.vo;

import lombok.Data;

@Data
public class CarReservation {
	
	private String carRno;
	private String trNo;
	private String startDate;
	private String endDate;
	private String status;
	private String memId;
	private String trPaymentNo;
	private String trPaymentDate;
	private String trCardNo;
	
}
