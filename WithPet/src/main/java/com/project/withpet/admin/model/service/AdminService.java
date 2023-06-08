package com.project.withpet.admin.model.service;

import java.util.ArrayList;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.trip.model.vo.CarReservation;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

public interface AdminService {
	
	ArrayList<Transportation> adminTransportation();
	
	int addTransportation(Transportation t);
	
	int deleteTr(int trNo);
	
	ArrayList<TaxiReservation> taxiReservationList();
	
	ArrayList<CarReservation> carReservationList();
	
	int deleteTReservation(String resNo);
	
	int deleteCReservation(String resNo);
	
	ArrayList<Place> adminPlaceList(PageInfo pi);
	
	int deletePlace(int placeNo);
	
	int countPlaceList();
	
	int modifyPlace(Place p);
}
