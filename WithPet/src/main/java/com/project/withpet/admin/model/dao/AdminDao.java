package com.project.withpet.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	public ArrayList<Member> adminMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.adminMemberList",null,rowBounds);
	}
	
	public int adminMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminMemberListCount");
	}

	public int adminGradeUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.adminGradeUpdate", m);
	}
	
	public int adminStatusUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.adminStatusUpdate", m);
	}
	
	public ArrayList<CafeRes> cafeResManagement(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.cafeResManagement");
	}
	
	public int deleteCr(SqlSessionTemplate sqlSession, int cafeResNo) {
		return sqlSession.delete("adminMapper.deleteCr", cafeResNo);
	}

	public ArrayList<Search> searchKeyword(SqlSessionTemplate sqlSession, String key) {
		return (ArrayList)sqlSession.selectList("adminMapper.searchKeyword", key);
	}

	public ArrayList<Search> bestKeyword(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.bestKeyword");
	}
	
	public ArrayList<Cafe> cafeManagement(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.cafeManagement",null,rowBounds);		
	}
	
	public int managementCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.managementCount");
	}
	
	public int deleteCafe(SqlSessionTemplate sqlSession, int cafeNo) {
		return sqlSession.delete("adminMapper.deleteCafe", cafeNo);
	}
	
	public ArrayList<Inquiry> inquiryManagement(SqlSessionTemplate sqlSession, PageInfo pi){
		return (ArrayList)sqlSession.selectList("adminMapper.inquiryManagement", pi);
	}
	
	public int inquiryManagementCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.inquiryManagementCount");
	}
	
	public int deleteInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.delete("adminMapper.deleteInquiry", inquiryNo);
	}

	public int countReportList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.countReportList");
	}

	public ArrayList<Report> adminReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.adminReportList",null,rowBounds);
	}

	public int deleteReport(SqlSessionTemplate sqlSession, String reportNo) {
		return sqlSession.delete("adminMapper.deleteReport", reportNo);
	}

	public int checkReport1(SqlSessionTemplate sqlSession, String reportNo) {
		return sqlSession.update("adminMapper.checkReport1", reportNo);
	}

	public int checkReport2(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.update("adminMapper.checkReport2", memId);
	}

	public ArrayList<Board> goSearch(SqlSessionTemplate sqlSession, String searchKeyword) {
		return (ArrayList)sqlSession.selectList("adminMapper.goSearch", searchKeyword);
	}

	public int addSearchKeyword(SqlSessionTemplate sqlSession, String searchKeyword) {
		return sqlSession.insert("adminMapper.addSearchKeyword", searchKeyword);
	}
	
}
