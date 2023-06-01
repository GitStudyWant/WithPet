package com.project.withpet.trip.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.trip.model.vo.Place;

@Repository
public class TripDao {

	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, Place p) {
		return (ArrayList)sqlSession.selectList("tripMapper.selectPlaceList",p);
	}
	
	public ArrayList<Place> bestPlaceList(SqlSessionTemplate sqlSession, Place p){
		return (ArrayList)sqlSession.selectList("tripMapper.bestPlaceList", p);
	}
	
	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("tripMapper.insertPlace", p);
	}
}