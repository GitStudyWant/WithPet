package com.project.withpet.trip.model.vo;

import lombok.Data;

@Data
public class TaxiReservation {
	
	private int taxiRno;
	private int trNo;
	private String taxiRDate;
	private int taxiRTime;
	private String status;
	private String memId;
	private String trType2;

}
