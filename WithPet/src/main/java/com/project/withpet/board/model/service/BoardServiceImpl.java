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
import com.project.withpet.board.model.vo.Likes;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;
import com.project.withpet.member.model.vo.Member;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//자유게시판
	@Override
	public int selectFrListCount() {
		return boardDao.selectFrListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectFrList(PageInfo pi) {
		return boardDao.selectFrList(sqlSession,pi);
	}
	
	@Override
	public int insertFrBoard(Board b) {
		return boardDao.insertFrBoard(sqlSession,b);
	}
	
	@Override
	public int updateFrBoard(Board b) {
		return boardDao.updateFrBoard(sqlSession,b);
	}
	
	
	
	
	
	//리뷰게시판
	@Override
	public int selectReListCount() {
		return boardDao.selectReListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectReList(PageInfo pi) {
		return boardDao.selectReList(sqlSession,pi);
	}
	
	@Override
	public int insertReBoard(Board b) {
		return boardDao.insertReBoard(sqlSession,b);
	}
	@Override
	public int updateReBoard(Board b) {
		return boardDao.updateReBoard(sqlSession,b);
	}
	
	@Override
	public Board selectReBoard(int boardNo) {
		return boardDao.selectReBoard(sqlSession,boardNo);
	}
	
	
	
	
	//qna게시판
	@Override
	public int selectQnListCount() {
		return boardDao.selectQnListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectQnList(PageInfo pi) {
		return boardDao.selectQnList(sqlSession,pi);
	}
	
	@Override
	public int insertQnBoard(Board b) {
		return boardDao.insertQnBoard(sqlSession,b);
	}

	@Override
	public int updateQnBoard(Board b) {
		return boardDao.updateQnBoard(sqlSession,b);
	}
	
	
	// 나눔게시판
	@Override
	public ArrayList<Board> selectShList(PageInfo pi) {
		return boardDao.selectShList(sqlSession,pi);
	}

	@Override
	public int selectShListCount() {
		return boardDao.selectShListCount(sqlSession);
	}
	
	@Override
	public int insertShBoard(Board b) {
		return boardDao.insertShBoard(sqlSession,b);
	}

	@Override
	public int updateShBoard(Board b) {
		return boardDao.updateShBoard(sqlSession,b);
	}

	// 크리에이터 게시판
	@Override
	public ArrayList<Board> selectCrList(PageInfo pi) {
		return boardDao.selectCrList(sqlSession,pi);
	}

	@Override
	public int selectCrListCount() {
		return boardDao.selectCrListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> searchCrList(String memNick,PageInfo pi) {
		return boardDao.searchCrList(sqlSession,memNick,pi);
	}

	@Override
	public int searchCrListCount(String memNick) {
		return boardDao.searchCrListCount(sqlSession,memNick);
	}
	
	@Override
	public int insertCrBoard(Board b) {
		return boardDao.insertCrBoard(sqlSession,b);
	}

	@Override
	public int updateCrBoard(Board b) {
		return boardDao.updateCrBoard(sqlSession,b);
	}
	@Override
	public ArrayList<Member> selectHowList() {
		return boardDao.selectHowList(sqlSession);
	}
	

	
	
	// 공지사항
	@Override
	public int selectNoListCount() {
		return boardDao.selectNoListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectNoList(PageInfo pi) {
		return boardDao.selectNoList(sqlSession,pi);
	}
	
	@Override
	public int insertNoBoard(Board b) {
		return boardDao.insertNoBoard(sqlSession,b);
	}

	@Override
	public int updateNoBoard(Board b) {
		return boardDao.updateNoBoard(sqlSession,b);
	}

	
	
	
	
	
	
	
	
	
	
	//공통
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
	public void updateTagBridges(List<TagBridge> tagBridges) {
		 boardDao.updateTagBridge(sqlSession, tagBridges);
	}
	@Override
	public void deleteTagBridges(int boardNo) {
		boardDao.deleteTagBridges(sqlSession, boardNo);
		
	}

	@Override
	public int likeCount(int boardNo) {
		return boardDao.likeCount(sqlSession, boardNo);
	}

	@Override
	public int likeAdd(Likes l) {
		return boardDao.likeAdd(sqlSession,l);
	}

	@Override
	public Likes likeChk(Likes l) {
		return boardDao.likeChk(sqlSession,l);
	}

	@Override
	public void likeCancle(Likes l) {
		boardDao.likeCancle(sqlSession,l);
	}


	

	
	
	

	

	
	







	
	

	


}
