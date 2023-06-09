package com.project.withpet.member.model.service;

import java.util.ArrayList;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Friend;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Point;
import com.project.withpet.member.model.vo.Schedule;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;

public interface MemberService {
	
	// 멤버
	public int insertMember(Member member);
	
	public int idCheck(String checkId);
	
	public int nickCheck(String checkNick);
	
	public int phoneCheck(String checkPhone);
	
	public int emailCheck(String checkEmail);
	
	public Member selectMember(Member member);
	
	public Member selectKakaoMember(String memKakaoId);
	
	public int selectKakaoCount(String memKakaoId);

	public int updateMember(Member member);
	
	// 스케쥴
	public ArrayList<Schedule> selectSchedules(Schedule schedule);
	
	public int insertSchedule(Schedule schedule);
	
	public int updateSchedule(Schedule schedule);
	
	public int deleteSchedule(int scheduleNo);
	
	// 메모
	public int selectMemoCount(String memId);
		
	public ArrayList<Memo> selectMemoGet(String memId, PageInfo pi);
	
	public ArrayList<Memo> selectMemoSend(String memId, PageInfo pi);
		
	public int updateMemoCheck(int memoNo);
		
	public Memo selectMemoDetail(int memNo);
		
	public int deleteMemo(int memNo);
		
	public int deleteMemos(Memo[] memNos);
		
	public int insertMemo(Memo memo);
	
	// 포인트
	public ArrayList<Point> selectPoint(String memId);
	
	public ArrayList<Point> selectPointPlus(String memId);
	
	public ArrayList<Point> selectPointMinus(String memId);
	
	// 코스
	// 예약
	// 결제
	
	
	public ArrayList<Place> myCourse(String memId);
	
	public int deleteCourse(MyPlace m);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 諛뺣�쇱꽦
	
	// 湲곕뒫 1 �옉�꽦湲�, �옉�꽦�뙎湲�, �뒪�겕�옪�븳湲� 蹂닿린 (異쒖꽍泥댄겕, �궘�젣�븳 寃뚯떆湲� 蹂닿린)
	
	public ArrayList<Board> writingBoard(String memId);

	public ArrayList<Comments> writingReply(String memId);
	
	public ArrayList<Board> likesBoard(String memId);
	
	public int attendance(String memId);
	
	public ArrayList<Board> deletedBoard(String memId);
	
	public int sendMail(CertVO certVo);
	
	public int validata(CertVO certVo);
	
	public Member idFind(String email);
	
	public int pwdMail(CertVO certVo);
	
	public int pwdFind(Passward p);
	
	public ArrayList<Board> myPage(PageInfo pi);
	
	public int boardCount(String memberId);
	
	public int replyCount(String memberId);
	
	public ArrayList<Comments> myPageReply(PageInfo pi);
	
	public int likeCount(String memberId);
	
	public ArrayList<Board> myPageLike(PageInfo pi);
	
	public int deleteCount(String memberId);
	
	public ArrayList<Board> myPageDelete(PageInfo pi);
	
	public int friendCount(String memberId);
	
	public ArrayList<Member> myPageFriend(PageInfo pi);
	
	public int friendDelete(Friend fri);
	
	public int freindSharing(Friend fri);
	
	public int sharingCancellation(Friend fri);
	
	public Member friendSearch(Friend fri);
	
}
