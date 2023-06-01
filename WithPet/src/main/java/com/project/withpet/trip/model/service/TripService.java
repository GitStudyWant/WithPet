package com.project.withpet.trip.model.service;

import java.util.ArrayList;

import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;

public interface TripService {
	
	ArrayList<Place> selectPlaceList(Place p);
	
	ArrayList<Place> bestPlaceList(Place p);
	
	int checkMyCourse(String memId);
	
	int saveMyPlace(MyPlace place);
	
	int insertPlace(Place p);
	
	
	

}
