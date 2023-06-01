package com.project.withpet.board.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.dao.BoardDao;
import com.project.withpet.board.model.vo.Board;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectFrList(PageInfo pi) {
		return boardDao.selectFrList(sqlSession,pi);
	}

	@Override
	public int selectFrListCount() {
		return boardDao.selectFrListCount(sqlSession);
	}
	


}
