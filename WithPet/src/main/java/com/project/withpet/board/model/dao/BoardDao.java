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
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;

@Repository
public class BoardDao {

	public ArrayList<Board> selectFrList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectFrList", null, rowBounds);
	
	}
	public ArrayList<Board> selectReList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectReList", null, rowBounds);
	}
	public ArrayList<Board> selectQnList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectQnList", null, rowBounds);
	}
	public ArrayList<Board> selectNoList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoList", null, rowBounds);
	}

	public int selectFrListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFrListCount");
	}
	public int selectReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectReListCount");
	}
	public int selectQnListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectQnListCount");
	}
	public int selectNoListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectNoListCount");
	}
	public int insertFrBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertFrBoard", b);
	}

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

	public int removeTag(SqlSessionTemplate sqlSession, String tagName) {
		return sqlSession.delete("boardMapper.removeTag",tagName);
	}

	public int searchTagId(SqlSessionTemplate sqlSession, String tagName) {
		return sqlSession.selectOne("boardMapper.searchTagId", tagName);
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
	public int updateFrBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateFrBoard", b);
	}
	public void updateTagBridge(SqlSessionTemplate sqlSession, List<TagBridge> tagBridges) {
		for (TagBridge tagBridge : tagBridges) {
	        sqlSession.insert("boardMapper.updateTagBridge", tagBridge);
	    }
	}
	public void deleteTagBridges(SqlSessionTemplate sqlSession, int boardNo) {
		sqlSession.delete("boardMapper.deleteTagBridges", boardNo);
	}
	
	


	
}
