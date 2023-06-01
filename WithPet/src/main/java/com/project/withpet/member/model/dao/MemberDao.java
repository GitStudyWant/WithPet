package com.project.withpet.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.withpet.member.model.vo.Member;

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
}
