package com.project.withpet.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.trip.model.vo.CarReservation;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

@Repository
public class AdminDao {

	public ArrayList<Transportation> adminTransportation(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminTransportation");
	}

	public int addTransportation(SqlSessionTemplate sqlSession, Transportation t) {
		return sqlSession.insert("adminMapper.addTransportation", t);
	}

	public int countTrRes(SqlSessionTemplate sqlSession, Transportation t) {
		return sqlSession.selectOne("adminMapper.countTrRes", t);
	}
	
	public int deleteTr(SqlSessionTemplate sqlSession, int trNo) {
		return sqlSession.delete("adminMapper.deleteTr", trNo);
	}

	public ArrayList<TaxiReservation> taxiReservationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.taxiReservationList");
	}

	public ArrayList<CarReservation> carReservationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.carReservationList");
	}

	public int deleteTReservation(SqlSessionTemplate sqlSession, String resNo) {
		return sqlSession.update("adminMapper.deleteTReservation", resNo);
	}

	public int deleteCReservation(SqlSessionTemplate sqlSession, String resNo) {
		return sqlSession.update("adminMapper.deleteCReservation", resNo);
	}

	public int deletePlace(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.delete("adminMapper.deletePlace", placeNo);
	}

	public int countPlaceList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countPlaceList");
	}

	public ArrayList<Place> adminPlaceList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.adminPlaceList",null,rowBounds);
	}

	public int modifyPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.update("adminMapper.modifyPlace", p);
	}


}
