package com.project.withpet.cafe.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.common.model.vo.PageInfo;

@Repository
public class CafeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("cafeMapper.selectListCount");
	}
	
	public ArrayList<Cafe> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("cafeMapper.selectList", null, rowBounds);
	}
	
	public int insertCafe(SqlSessionTemplate sqlSession, Cafe c) {
		return sqlSession.insert("cafeMapper.insertCafe", c);
	}
	
	public Cafe cafeInfo(SqlSessionTemplate sqlSession, int cafeNo) {
		return sqlSession.selectOne("cafeMapper.cafeInfo",cafeNo);
	}
	
	public int cafeReservation(SqlSessionTemplate sqlSession, CafeRes r) {
		return sqlSession.insert("cafeMapper.cafeReservation", r);
	}
	
	public int findCafeNo(SqlSessionTemplate sqlSession, CafeRes r) {
		return sqlSession.selectOne("cafeMapper.findCafeNo", r);
	}
	
	
}
