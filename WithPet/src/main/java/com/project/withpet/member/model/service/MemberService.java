package com.project.withpet.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Point;
import com.project.withpet.member.model.vo.Schedule;

public interface MemberService {
	
	// 회원
	public int insertMember(Member member);
	
	public int idDouble(String checkId);
	
	public Member selectMember(Member member);
	
	public int selectMemoCount(String memId);
	
	public ArrayList<Memo> selectGetMemo(String memId);

	public int updateMember(Member member);
	
	// 메모
	public ArrayList<Memo> selectMemoGet(String memId);
	
	public int updateMemoCheck(int memoNo);
	
	public Memo selectMemoDetail(int memNo);
	
	public int deleteMemo(int memNo);
	
	public int deleteMemos(Memo[] memNos);
	
	public ArrayList<Memo> selectMemoSend(String memId);
	
	public int insertMemo(Memo memo);
	
	// 스케쥴
	public ArrayList<Schedule> selectSchedule(String memId);
	
	public ArrayList<Schedule> selectScheduleDetails(Date day);
	
	public Schedule selectScheduleDetail(int scheduleNo);
	
	public int insertSchedule(Schedule schedule);
	
	public int deleteSchedule(int scheduleNo);
	
	// 포인트
	public ArrayList<Point> selectPoint(String memId);
	
	public ArrayList<Point> selectPointPlus(String memId);
	
	public ArrayList<Point> selectPointMinus(String memId);
	
	// 코스
	// 예약
	// 결제
	
}
