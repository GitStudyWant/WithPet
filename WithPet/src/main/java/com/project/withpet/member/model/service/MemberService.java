package com.project.withpet.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Point;
import com.project.withpet.member.model.vo.Schedule;

public interface MemberService {
	
	// 硫ㅻ쾭
	public int insertMember(Member member);
	
	public int idCheck(String checkId);
	
	public int nickCheck(String checkNick);
	
	public int phoneCheck(String checkPhone);
	
	public int emailCheck(String checkEmail);
	
	public Member selectMember(Member member);
	
	public Member selectKakaoMember(String memKakaoId);
	
	public int selectKakaoCount(String memKakaoId);

	public int updateMember(Member member);
	
	// 硫붾え
	public int selectMemoCount(String memId);
	
	public ArrayList<Memo> selectMemoGet(String memId);
	
	public int updateMemoCheck(int memoNo);
	
	public Memo selectMemoDetail(int memNo);
	
	public int deleteMemo(int memNo);
	
	public int deleteMemos(Memo[] memNos);
	
	public ArrayList<Memo> selectMemoSend(String memId);
	
	public int insertMemo(Memo memo);
	
	// �뒪耳�伊�
	public int insertSchedule(Schedule schedule);
	
	public ArrayList<Schedule> selectSchedules(Schedule schedule);
	
	public ArrayList<Schedule> selectScheduleDetails(Date day);
	
	public Schedule selectScheduleDetail(int scheduleNo);
	
	public int deleteSchedule(int scheduleNo);
	
	// �룷�씤�듃
	public ArrayList<Point> selectPoint(String memId);
	
	public ArrayList<Point> selectPointPlus(String memId);
	
	public ArrayList<Point> selectPointMinus(String memId);
	
	// 肄붿뒪
	// �삁�빟
	// 寃곗젣
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
}
