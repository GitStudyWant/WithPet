package com.project.withpet.member.model.service;

import java.util.ArrayList;

import javax.websocket.OnMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.dao.MemberDao;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Friend;
import com.project.withpet.member.model.vo.Inquiry;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Point;
import com.project.withpet.member.model.vo.Schedule;
import com.project.withpet.trip.model.vo.CarReservation;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 멤버
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(sqlSession, member);
	}
	
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	
	@Override
	public int phoneCheck(String checkPhone) {
		return memberDao.phoneCheck(sqlSession, checkPhone);
	}
	
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
	}

	@Override
	public Member selectMember(Member member) {
		return memberDao.selectMember(sqlSession, member);
	}
	
	@Override
	public Member selectKakaoMember(String memKakaoId){
		return memberDao.selectKakaoMember(sqlSession, memKakaoId);
	}
	
	@Override
	public Member selectNaverMember(String memNaverId){
		return memberDao.selectNaverMember(sqlSession, memNaverId);
	}
	
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(sqlSession, member);
	}

	// 스케쥴
	@Override
	public ArrayList<Schedule> selectSchedules(Schedule schedule) {
		return memberDao.selectSchedules(sqlSession, schedule);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return memberDao.insertSchedule(sqlSession, schedule);
	}
	
	@Override
	public int updateSchedule(Schedule schedule) {
		return memberDao.updateSchedule(sqlSession, schedule);
	}
	
	@Override
	public int deleteSchedule(int scheduleNo) {
		return memberDao.deleteSchedule(sqlSession, scheduleNo);
	}
	
	// 메모
	@Override
	public int selectReceiveMemoCount(String memId) {
		return memberDao.selectReceiveMemoCount(sqlSession, memId);
	}
	
	@Override
	public int selectSendMemoCount(String memId) {
		return memberDao.selectSendMemoCount(sqlSession, memId);
	}
	
	@Override
	public int selectReceiveMemoCountCheck(String memId) {
		return memberDao.selectReceiveMemoCountCheck(sqlSession, memId);
	}
	
	@Override
	public ArrayList<Memo> selectMemoGet(String memId, PageInfo pi) {
		return memberDao.selectMemoGet(sqlSession, memId, pi);
	}
	
	@Override
	public ArrayList<Memo> selectMemoSend(String memId, PageInfo pi) {
		return memberDao.selectMemoSend(sqlSession, memId, pi);
	}

	@Override
	public int updateMemoCheck(int memoNo) {
		return memberDao.updateMemoCheck(sqlSession, memoNo);
	}

	@Override
	public int updateMemoCheckDate(int memoNo) {
		return memberDao.updateMemoCheckDate(sqlSession, memoNo);
	}
	
	@Override
	public Memo selectMemoDetail(int memoNo) {
		return memberDao.selectMemoDetail(sqlSession, memoNo);
	}

	@Override
	public int deleteReceiveMemo(int memoNo) {
		return memberDao.deleteReceiveMemo(sqlSession, memoNo);
	}
	
	@Override
	public int deleteSendMemo(int memoNo) {
		return memberDao.deleteSendMemo(sqlSession, memoNo);
	}
	
	@Override
	public int rollbackSendMemo(int memoNo) {
		return memberDao.rollbackSendMemo(sqlSession, memoNo);
	}
	
	@Override
	public int discountMemoCount(String memId) {
		return memberDao.discountMemoCount(sqlSession, memId);
	}

	@Override
	public int insertMemo(Memo memo) {
		return memberDao.insertMemo(sqlSession, memo);
	}

	@Override
	public int insertChatMemo(Memo memo) {
		return memberDao.insertChatMemo(sqlSession, memo);
	}
	
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public ArrayList<Place> myCourse(String memId) {
		return memberDao.myCourse(sqlSession, memId);
	}
	
	
	@Override
	public int deleteCourse(MyPlace m) {
		return memberDao.deleteCourse(sqlSession, m);
	}

	@Override
	public ArrayList<TaxiReservation> selectMyTaxiRes(String memId) {
		return memberDao.selectMyTaxiRes(sqlSession, memId);
	}

	@Override
	public ArrayList<CarReservation> selectMyCarRes(String memId) {
		return memberDao.selectMyCarRes(sqlSession, memId);
	}
	
	@Override
	public int deleteTRes(int resNo) {
		return memberDao.deleteTRes(sqlSession, resNo);
	}

	@Override
	public int deleteCRes(int resNo) {
		return memberDao.deleteCRes(sqlSession, resNo);
	}


	
	
	
	
	
	
	
	
	
	
	

	@Override
	public ArrayList<Board> writingBoard(String memId) {
		return null;
	}

	@Override
	public ArrayList<Comments> writingReply(String memId) {
		
		return null;
	}

	@Override
	public ArrayList<Board> likesBoard(String memId) {
		return null;
	}

	@Override
	public int attendance(String memId) {
		return 0;
	}

	@Override
	public ArrayList<Board> deletedBoard(String memId) {
		return null;
	}
	
	@Override
	public int sendMail(CertVO certVo) {
		return memberDao.sendMail(sqlSession, certVo);
	}
	
	@Override
	public int validata(CertVO certVo) {
		return memberDao.validata(sqlSession, certVo);
	}
	
	@Override
	public Member idFind(String email) {
		return memberDao.idFind(sqlSession, email);
	}
	
	@Override
	public int pwdMail(CertVO certVo) {
		return memberDao.sendMail(sqlSession, certVo);
	}
	
	@Override
	public int pwdFind(Passward p) {
		return memberDao.pwdFind(sqlSession, p);
	}
	
	@Override
	public ArrayList<Board> myPage(PageInfo pi){
		return memberDao.myPage(sqlSession, pi);
	}
	
	@Override
	public int boardCount(String memberId) {
		return memberDao.boardCount(sqlSession, memberId);
	}

	@Override
	public int replyCount(String memberId) {
		return memberDao.replyCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Comments> myPageReply(PageInfo pi) {
		return memberDao.myPageReply(sqlSession, pi);
	}

	@Override
	public int likeCount(String memberId) {
		return memberDao.likeCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Board> myPageLike(PageInfo pi) {
		return memberDao.myPageLike(sqlSession, pi);
	}

	@Override
	public int deleteCount(String memberId) {
		return memberDao.deleteCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Board> myPageDelete(PageInfo pi) {
		return memberDao.myPageDelete(sqlSession, pi);
	}
	
	@Override
	public int friendCount(String memberId) {
		return memberDao.friendCount(sqlSession, memberId);
	}
	
	@Override
	public ArrayList<Member> myPageFriend(PageInfo pi){
		return memberDao.myPageFriend(sqlSession, pi);
	}
	
	@Override
	public int friendDelete(Friend fri) {
		return memberDao.friendDelete(sqlSession, fri);
	}
	
	@Override
	public int freindSharing(Friend fri) {
		return memberDao.freindSharing(sqlSession, fri);
	}
	
	@Override
	public int sharingCancellation(Friend fri) {
		return memberDao.sharingCancellation(sqlSession, fri);
	}
	
	@Override
	public Member friendSearch(Friend fri) {
		return memberDao.friendSearch(sqlSession, fri);
	}

	@Override
	public ArrayList<Member> liveSearch(String keyword){
		return memberDao.liveSearch(sqlSession, keyword);
	}
	
	@Override
	public Member findMember(String findMember) {
		return memberDao.findMember(sqlSession, findMember);
	}
	
	@Override
	public ArrayList<Inquiry> inquiry(PageInfo pi){
		return memberDao.inquiry(sqlSession, pi);
	}
	
	@Override
	public int inquiryCount(String memberId) {
		return memberDao.inquiryCount(sqlSession, memberId);
	}

	@Override
	public Inquiry inquiryDetail(Inquiry i) {
		return memberDao.inquiryDetail(sqlSession, i);
	}
	
	@Override
	public int inquiryDelete(int ino) {
		return memberDao.inquiryDelete(sqlSession, ino);
	}
	
	@Override
	public int inquiryInsert(Inquiry i) {
		return memberDao.inquiryInsert(sqlSession, i);
	}

	
	



	


}
