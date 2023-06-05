package com.project.withpet.trip.model.service;

import java.util.ArrayList;

import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.R_MyPlace;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

public interface TripService {
	
	ArrayList<Place> selectPlaceList(Place p);
	
	ArrayList<Place> bestPlaceList(Place p);
	
	int checkMyCourse(String memId);
	
	int saveMyCourse(R_MyPlace rMyPlace);
	
	int increaseCount(String placeNo);
	
	int insertPlace(Place p);
	
	Place detailPlace(int placeNo);
	
	int checkTransportation(Transportation t);
	
	int checkTReservation(TaxiReservation r);
	
	int findTaxiNo(TaxiReservation r);
	
	int taxiReservation(TaxiReservation r);
}
