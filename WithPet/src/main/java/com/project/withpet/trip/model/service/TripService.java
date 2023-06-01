package com.project.withpet.trip.model.service;

import java.util.ArrayList;

import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.R_MyPlace;

public interface TripService {
	
	ArrayList<Place> selectPlaceList(Place p);
	
	ArrayList<Place> bestPlaceList(Place p);
	
	int checkMyCourse(String memId);
	
	int saveMyCourse(R_MyPlace rMyPlace);
	
	int increaseCount(String placeNo);
	
	int insertPlace(Place p);
	
	
	

}
