package com.project.withpet.board.model.service;

import java.util.ArrayList;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Tag;

public interface BoardService {

	ArrayList<Board> selectFrList(PageInfo pi);

	int selectFrListCount();

	int insertFrBoard(Board b);

	int increaseCount(int boardNo);

	Board selectBoard(int boardNo);

	int deleteBoard(int boardNo);

	ArrayList<Comments> selectCommentsList(int boardNo);

	int insertComments(Comments c);

	int addTag(String tagName);

	int removeTag(String tagName);
	
	int searchTagId(String tagName);

	String selectTag(String tagName);
	

	
}
