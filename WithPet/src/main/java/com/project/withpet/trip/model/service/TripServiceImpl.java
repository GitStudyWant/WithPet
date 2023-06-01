package com.project.withpet.trip.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.trip.model.dao.TripDao;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;

@Service
public class TripServiceImpl implements TripService {

	@Autowired
	private TripDao tripdao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Place> selectPlaceList(Place p) {
		return tripdao.selectPlaceList(sqlSession, p);
	}

	@Override
	public ArrayList<Place> bestPlaceList(Place p) {
		return tripdao.bestPlaceList(sqlSession, p);
	}

	@Override
	public int checkMyCourse(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int saveMyPlace(MyPlace place) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPlace(Place p) {
		return tripdao.insertPlace(sqlSession, p);
	}

}