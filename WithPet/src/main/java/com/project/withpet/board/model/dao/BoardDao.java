package com.project.withpet.board.model.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;

@Repository
public class BoardDao {

	public ArrayList<Board> selectFrList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFrList", null, rowBounds);
	
	}

	public int selectFrListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFrListCount");
	}
	
}
