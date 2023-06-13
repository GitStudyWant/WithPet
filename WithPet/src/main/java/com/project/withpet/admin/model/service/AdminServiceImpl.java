package com.project.withpet.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.admin.model.dao.AdminDao;
import com.project.withpet.admin.model.vo.Search;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.trip.model.vo.CarReservation;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

@Service
public class AdminServiceImpl implements AdminService {
	
	
	@Autowired
	private AdminDao adminDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Transportation> adminTransportation() {
		//System.out.println("service: " + adminDao.adminTransportation(sqlSession));
		return adminDao.adminTransportation(sqlSession);
	}


	@Override
	public int addTransportation(Transportation t) {
		return adminDao.addTransportation(sqlSession, t);
	}


	@Override
	public int deleteTr(int trNo) {
		return adminDao.deleteTr(sqlSession, trNo);
	}


	@Override
	public ArrayList<TaxiReservation> taxiReservationList() {
		return adminDao.taxiReservationList(sqlSession);
	}


	@Override
	public ArrayList<CarReservation> carReservationList() {
		return adminDao.carReservationList(sqlSession);
	}


	@Override
	public int deleteTReservation(String resNo) {
		return adminDao.deleteTReservation(sqlSession, resNo);
	}


	@Override
	public int deleteCReservation(String resNo) {
		return adminDao.deleteCReservation(sqlSession, resNo);
	}


	@Override
	public int deletePlace(int placeNo) {
		return adminDao.deletePlace(sqlSession, placeNo);
	}

	@Override
	public int countPlaceList() {
		return adminDao.countPlaceList(sqlSession);
	}


	@Override
	public ArrayList<Place> adminPlaceList(PageInfo pi) {
		return adminDao.adminPlaceList(sqlSession, pi);
	}


	@Override
	public int modifyPlace(Place p) {
		return adminDao.modifyPlace(sqlSession, p);
	}


	@Override
	public int countTrRes(Transportation t) {
		return adminDao.countTrRes(sqlSession, t);
	}

	@Override
	public ArrayList<Member> adminMemberList(PageInfo pi) {
		return adminDao.adminMemberList(sqlSession, pi);
	}

	@Override
	public int adminMemberListCount() {
		return adminDao.adminMemberListCount(sqlSession);
	}


	@Override
	public int adminGradeUpdate(Member m) {
		return adminDao.adminGradeUpdate(sqlSession, m);
	}


	@Override
	public ArrayList<CafeRes> cafeResManagement() {
		return adminDao.cafeResManagement(sqlSession);
	}


	@Override
	public int deleteCr(int cafeResNo) {
		return adminDao.deleteCr(sqlSession, cafeResNo);
	}


	public ArrayList<Search> searchKeyword(String key) {
		return adminDao.searchKeyword(sqlSession, key);
	}


	@Override
	public ArrayList<Search> bestKeyword() {
		return adminDao.bestKeyword(sqlSession);
	}


	
}
