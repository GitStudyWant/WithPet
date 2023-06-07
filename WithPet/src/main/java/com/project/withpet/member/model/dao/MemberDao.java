package com.project.withpet.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Schedule;

@Repository
public class MemberDao {
	
	public int insertMember(SqlSession sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public int idCheck(SqlSession sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int nickCheck(SqlSession sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	public int phoneCheck(SqlSession sqlSession, String checkPhone) {
		return sqlSession.selectOne("memberMapper.phoneCheck", checkPhone);
	}
	
	public int emailCheck(SqlSession sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}
	
	public Member selectMember(SqlSession sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.selectMember", member);
	}
	
	public int selectKakaoCount(SqlSession sqlSession, String memKakaoId) {
		return sqlSession.selectOne("memberMapper.selectKakaoCount", memKakaoId);
	}
	
	public Member selectKakaoMember(SqlSession sqlSession, String memKakaoId) {
		return sqlSession.selectOne("memberMapper.selectKakaoMember", memKakaoId);
	}
	
	public int selectMemoCount(SqlSession sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.selectMemoCount", memId);
	}
	
	public int insertSchedule(SqlSession sqlSession, Schedule schedule) {
		return sqlSession.insert("memberMapper.insertSchedule", schedule);
	}
	
	public ArrayList<Schedule> selectSchedules(SqlSession sqlSession, Schedule schedule) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSchedules", schedule);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 박민성
	
	public int sendMail(SqlSessionTemplate sqlSession, CertVO certVo) {
		return sqlSession.insert("memberMapper.sendMail", certVo);
	}
	
	public int validata(SqlSessionTemplate sqlSession, CertVO certVo) {
		CertVO result = sqlSession.selectOne("memberMapper.validate", certVo);
		int resultNum = 0;
		if(result != null) {
			resultNum = sqlSession.delete("memberMapper.remove", certVo);
		}
		return resultNum;
	}
	
	public Member idFind(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.idFind", email);
	}
	
	public int pwdMail(SqlSessionTemplate sqlSession, CertVO certVo) {
		return sqlSession.insert("memberMapper.pwdMail", certVo);
	}
	
	public int pwdFind(SqlSessionTemplate sqlSession, Passward p) {
		return sqlSession.update("memberMapper.pwdFind", p);
	}
	

	
}
