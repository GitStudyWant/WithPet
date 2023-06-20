package com.project.withpet.board.model.service;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.dao.BoardDao;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectFrListCount() {
		return boardDao.selectFrListCount(sqlSession);
	}
	@Override
	public int selectReListCount() {
		return boardDao.selectReListCount(sqlSession);
	}
	@Override
	public int selectQnListCount() {
		return boardDao.selectQnListCount(sqlSession);
	}
	
	@Override
	public int selectNoListCount() {
		return boardDao.selectNoListCount(sqlSession);
	}
	@Override
	public ArrayList<Board> selectFrList(PageInfo pi) {
		return boardDao.selectFrList(sqlSession,pi);
	}
	@Override
	public ArrayList<Board> selectReList(PageInfo pi) {
		return boardDao.selectReList(sqlSession,pi);
	}
	@Override
	public ArrayList<Board> selectQnList(PageInfo pi) {
		return boardDao.selectQnList(sqlSession,pi);
	}
	@Override
	public ArrayList<Board> selectNoList(PageInfo pi) {
		return boardDao.selectQnList(sqlSession,pi);
	}


	@Override
	public int insertFrBoard(Board b) {
		return boardDao.insertFrBoard(sqlSession,b);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession,boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession,boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession,boardNo);
	}

	@Override
	public ArrayList<Comments> selectCommentsList(int boardNo) {
		return boardDao.selectCommentsList(sqlSession,boardNo);
	}

	@Override
	public int insertComments(Comments c) {
		return boardDao.insertComments(sqlSession,c);
	}

	@Override
	public int addTag(String tagName) {
		return boardDao.addTag(sqlSession,tagName);
	}

	@Override
	public int removeTag(String tagName) {
	        return boardDao.removeTag(sqlSession,tagName);
	}

	@Override
	public int searchTagId(String tagName) {
		return boardDao.searchTagId(sqlSession,tagName);
	}

	@Override
	public String selectTag(String tagName) {
		return boardDao.selectTag(sqlSession,tagName);
	}

	@Override
	public ArrayList<Tag> selectTagName(int boardNo) {
		return boardDao.selectTagName(sqlSession,boardNo);
	}

	@Override
	public Tag selectTagId(String tagName) {
		return boardDao.selectTagId(sqlSession,tagName);
	}

	@Override
	public void insertTagBridges(List<TagBridge> tagBridges) {
		 boardDao.insertTagBridge(sqlSession, tagBridges);
	}
	@Override
	public int getCommentCount(int boardNo) {
		return boardDao.getCommentCount(sqlSession, boardNo);
	}
	@Override
	public ArrayList<Tag> selectTagAll(int boardNo) {
		return boardDao.selectTagAll(sqlSession, boardNo);
	}
	@Override
	public int updateFrBoard(Board b) {
		return boardDao.updateFrBoard(sqlSession,b);
	}
	@Override
	public void updateTagBridges(List<TagBridge> tagBridges) {
		 boardDao.updateTagBridge(sqlSession, tagBridges);
	}
	@Override
	public void deleteTagBridges(int boardNo) {
		boardDao.deleteTagBridges(sqlSession, boardNo);
		
	}







	
	

	


}
