package com.project.withpet.member.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.dao.MemberDao;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.Passward;
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
	public int selectKakaoCount(String memKakaoId) {
		return memberDao.selectKakaoCount(sqlSession, memKakaoId);
	}
	
	@Override
	public Member selectKakaoMember(String memKakaoId){
		return memberDao.selectKakaoMember(sqlSession, memKakaoId);
	}
	
	@Override
	public int updateMember(Member member) {
		return 0;
	}

	@Override
	public int selectMemoCount(String memId) {
		return memberDao.selectMemoCount(sqlSession, memId);
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
	public int insertSchedule(Schedule schedule) {
		return memberDao.insertSchedule(sqlSession, schedule);
	}
	
	@Override
	public ArrayList<Schedule> selectSchedules(Schedule schedule) {
		return memberDao.selectSchedules(sqlSession, schedule);
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

}
