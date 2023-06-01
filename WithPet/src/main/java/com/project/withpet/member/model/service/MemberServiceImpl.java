package com.project.withpet.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Reply;
import com.project.withpet.member.model.dao.MemberDao;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Point;
import com.project.withpet.member.model.vo.Schedule;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(sqlSession, member);
	}
	
	@Override
	public int idDouble(String checkId) {
		return memberDao.idDouble(sqlSession, checkId);
	}

	@Override
	public Member selectMember(Member member) {
		return null;
	}

	@Override
	public int selectMemoCount(String memId) {
		return 0;
	}

	@Override
	public ArrayList<Memo> selectGetMemo(String memId) {
		return null;
	}

	@Override
	public int updateMember(Member member) {
		return 0;
	}

	@Override
	public ArrayList<Memo> selectMemoGet(String memId) {
		return null;
	}

	@Override
	public int updateMemoCheck(int memoNo) {
		return 0;
	}

	@Override
	public Memo selectMemoDetail(int memNo) {
		return null;
	}

	@Override
	public int deleteMemo(int memNo) {
		return 0;
	}

	@Override
	public int deleteMemos(Memo[] memNos) {
		return 0;
	}

	@Override
	public ArrayList<Memo> selectMemoSend(String memId) {
		return null;
	}

	@Override
	public int insertMemo(Memo memo) {
		return 0;
	}

	@Override
	public ArrayList<Schedule> selectSchedule(String memId) {
		return null;
	}

	@Override
	public ArrayList<Schedule> selectScheduleDetails(Date day) {
		return null;
	}

	@Override
	public Schedule selectScheduleDetail(int scheduleNo) {
		return null;
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return 0;
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		return 0;
	}

	@Override
	public ArrayList<Point> selectPoint(String memId) {
		return null;
	}

	@Override
	public ArrayList<Point> selectPointPlus(String memId) {
		return null;
	}

	@Override
	public ArrayList<Point> selectPointMinus(String memId) {
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 박민성
	@Override
	public ArrayList<Board> writingBoard(String memId) {
		return null;
	}

	@Override
	public ArrayList<Reply> writingReply(String memId) {
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

}
