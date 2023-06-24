package com.project.withpet.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Likes;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;

@Repository
public class BoardDao {
	
	//자유게시판
	public ArrayList<Board> selectFrList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectFrList", null, rowBounds);
	
	}
	
	public int selectFrListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFrListCount");
	}
	
	
	public int insertFrBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertFrBoard", b);
	}
	
	public int updateFrBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateFrBoard", b);
	}
	
	
	//리뷰게시판
	public ArrayList<Board> selectReList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectReList", null, rowBounds);
	}
	
	public int selectReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectReListCount");
	}
	
	public int insertReBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertReBoard", b);
	}
	public int updateReBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateReBoard", b);
	}
	public Board selectReBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectReBoard", boardNo);
	}
	
	
	
	
	//qna게시판
	public ArrayList<Board> selectQnList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnList", null, rowBounds);
	}
	public int selectQnListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectQnListCount");
	}
	public int insertQnBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertQnBoard", b);
	}

	public int updateQnBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateQnBoard", b);
	}
	
	//나눔게시판
	public ArrayList<Board> selectShList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectShList", null, rowBounds);
	}

	public int selectShListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectShListCount");
	}

	public int insertShBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertShBoard", b);
	}

	public int updateShBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateShBoard", b);
	}
	
	
	
	//공지사항
	public ArrayList<Board> selectNoList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoList", null, rowBounds);
	}
	
	public int selectNoListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectNoListCount");
	}
	
	public int insertNoBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNoBoard", b);
	}

	public int updateNoBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateNoBoard", b);
	}

	
	
	
	//공통
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	public ArrayList<Comments> selectCommentsList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectCommentsList", boardNo);
	}

	public int insertComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertComments", c);
	}

	public int addTag(SqlSessionTemplate sqlSession, String tagName) {
		return sqlSession.insert("boardMapper.addTag",tagName);
	}

	public String selectTag(SqlSessionTemplate sqlSession, String tagName) {
		return sqlSession.selectOne("boardMapper.selectTag", tagName);
	}
	
	public ArrayList<Tag> selectTagName(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTagName", boardNo);
	}
	public ArrayList<Tag> selectTagAll(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTagAll", boardNo);
	}


	public void insertTagBridge(SqlSessionTemplate sqlSession, List<TagBridge> tagBridges) {
	    for (TagBridge tagBridge : tagBridges) {
	        sqlSession.insert("boardMapper.insertTagBridge", tagBridge);
	    }
	}

	public Tag selectTagId(SqlSessionTemplate sqlSession, String tagName) {
	    return sqlSession.selectOne("boardMapper.selectTagId", tagName);
	}

	public int getCommentCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.CommentsCount", boardNo);
	}
	
	public void updateTagBridge(SqlSessionTemplate sqlSession, List<TagBridge> tagBridges) {
		for (TagBridge tagBridge : tagBridges) {
	        sqlSession.insert("boardMapper.updateTagBridge", tagBridge);
	    }
	}
	public void deleteTagBridges(SqlSessionTemplate sqlSession, int boardNo) {
		sqlSession.delete("boardMapper.deleteTagBridges", boardNo);
	}

	public int likeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.likeCount", boardNo);
	}

	public int likeAdd(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.insert("boardMapper.likeAdd", l);
	}

	public Likes likeChk(SqlSessionTemplate sqlSession, Likes l) {
	    return sqlSession.selectOne("boardMapper.likeChk", l);
	}

	public void likeCancle(SqlSessionTemplate sqlSession, Likes l) {
		sqlSession.delete("boardMapper.likeCancle",l);
		
	}

	
	

	
	
	
	


	
}
