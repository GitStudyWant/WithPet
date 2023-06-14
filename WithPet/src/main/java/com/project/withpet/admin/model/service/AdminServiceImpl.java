package com.project.withpet.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.withpet.admin.model.dao.AdminDao;
import com.project.withpet.admin.model.vo.Report;
import com.project.withpet.admin.model.vo.Search;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.member.model.vo.Inquiry;
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


	@Override
	public ArrayList<Search> searchKeyword(String key) {
		return adminDao.searchKeyword(sqlSession, key);
	}

	@Override
	public ArrayList<Search> bestKeyword() {
		return adminDao.bestKeyword(sqlSession);
	}

	@Override
	public ArrayList<Cafe> cafeManagement(PageInfo pi) {
		return adminDao.cafeManagement(sqlSession, pi);
	}

	public int managementCount() {
		return adminDao.managementCount(sqlSession);
	}


	@Override
	public int deleteCafe(int cafeNo) {
		return adminDao.deleteCafe(sqlSession, cafeNo);
	}


	@Override
	public ArrayList<Inquiry> inquiryManagement(PageInfo pi) {
		return adminDao.inquiryManagement(sqlSession, pi);
	}


	@Override
	public int inquiryManagementCount() {
		return adminDao.inquiryManagementCount(sqlSession);
	}


	@Override
	public int deleteInquiry(int inquiryNo) {
		return adminDao.deleteInquiry(sqlSession, inquiryNo);
	}


	@Override
	public int countReportList() {
		return adminDao.countReportList(sqlSession);
	}


	@Override
	public ArrayList<Report> adminReportList(PageInfo pi) {
		return adminDao.adminReportList(sqlSession, pi);
	}


	@Override
	public int deleteReport(String reportNo) {
		return adminDao.deleteReport(sqlSession, reportNo);
	}

	@Transactional
	@Override
	public int checkReport1(String reportNo) {
		return adminDao.checkReport1(sqlSession, reportNo);
	}

	@Transactional
	@Override
	public int checkReport2(String memId) {
		return adminDao.checkReport2(sqlSession, memId);
	}

	@Override
	public ArrayList<Board> goSearch(String searchKeyword) {
		return adminDao.goSearch(sqlSession, searchKeyword);
	}


	@Override
	public int addSearchKeyword(String searchKeyword) {
		return adminDao.addSearchKeyword(sqlSession, searchKeyword);
	}


	
}
