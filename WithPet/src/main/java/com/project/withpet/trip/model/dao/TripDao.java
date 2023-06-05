package com.project.withpet.trip.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.R_MyPlace;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

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

	public int checkMyCourse(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("tripMapper.checkMyCourse", memId);
	}

	public int saveMyCourse(SqlSessionTemplate sqlSession, R_MyPlace rMyPlace) {
		return sqlSession.insert("tripMapper.saveMyCourse", rMyPlace);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, String placeNo) {
		return sqlSession.update("tripMapper.increaseCount", placeNo);
	}

	public Place detailPlace(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("tripMapper.detailPlace",placeNo);
	}
	
	public int checkTransportation(SqlSessionTemplate sqlSession, Transportation t) {
		return sqlSession.selectOne("tripMapper.checkTransportation",t);
	}

	public int checkTReservation(SqlSessionTemplate sqlSession, TaxiReservation r) {
		return sqlSession.selectOne("tripMapper.checkTReservation", r);
	}

	public int findTaxiNo(SqlSessionTemplate sqlSession, TaxiReservation r) {
		return sqlSession.selectOne("tripMapper.findTaxiNo", r);
	}

	public int taxiReservation(SqlSessionTemplate sqlSession, TaxiReservation r) {
		return sqlSession.insert("tripMapper.taxiReservation", r);
	}

}